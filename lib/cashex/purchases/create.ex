defmodule Cashex.Purchases.Create do
  @moduledoc """
  Purchase creation related functions
  """
  alias Cashex.{Purchase, Repo, Rules, Buyers}

  @doc """
  Creates an purchase from a value and a buyer_cpf
  """
  def call(value, buyer_cpf, rule_id) do
    get_cashback(rule_id, value)
    |> handle_purchase(value, buyer_cpf)
  end

  # Calculates the cashback with the bonus, in case theres a rule
  defp get_cashback(rule_id, value) do
    case Rules.Read.call(rule_id) do
      nil ->
        {:error, :rule_not_found}

      rule ->
        rule.bon / 100 * value
    end
  end

  # Runs if theres is no rule to get the bonus from
  defp handle_purchase({:error, reason}, _value, _buyer_cpf), do: {:error, reason}

  # Inserts the purchase in the database
  defp handle_purchase(cashback_value, value, buyer_cpf) do
    Buyers.UpdateCashback.call(buyer_cpf, cashback_value)

    attrs = %{cashback: cashback_value, value: value, buyer_cpf: buyer_cpf}

    %Purchase{}
    |> Purchase.changeset(attrs)
    |> Repo.insert()
  end
end
