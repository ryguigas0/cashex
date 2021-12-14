defmodule Cashex.Purchases.Create do
  @moduledoc """
  Purchase creation related functions
  """
  alias Cashex.{Purchase, Repo, Rules}

  @doc """
  Creates an purchase from a value and a buyer_cpf
  """
  def call(attrs = %{value: value, buyer_cpf: _}, rule_id) do
    get_cashback(rule_id, value)
    |> handle_purchase(attrs)
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
  defp handle_purchase({:error, reason}, _attrs), do: {:error, reason}

  # Inserts the purchase in the database
  defp handle_purchase(cashback_value, attrs) do
    attrs = Map.put(attrs, :cashback, cashback_value)

    %Purchase{}
    |> Purchase.changeset(attrs)
    |> Repo.insert()
  end
end
