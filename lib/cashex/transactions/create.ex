defmodule Cashex.Transactions.Create do
  @moduledoc """
  Transaction creation related functions
  """
  alias Cashex.{Buyers, Repo, Rules, Transaction}

  @doc """
  Creates an transaction from a value, an buyer_cpf and a rule_id
  """
  def call(%{value: value, buyer_cpf: buyer_cpf, rule_id: rule_id}) do
    get_cashback(rule_id, value)
    |> handle_transaction(value, buyer_cpf)
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
  defp handle_transaction({:error, reason}, _value, _buyer_cpf), do: {:error, reason}

  # Inserts the transaction in the database
  defp handle_transaction(cashback_value, value, buyer_cpf) do
    Buyers.UpdateCashback.call(buyer_cpf, cashback_value)

    attrs = %{cashback: cashback_value, value: value, buyer_cpf: buyer_cpf}

    %Transaction{}
    |> Transaction.changeset(attrs)
    |> Repo.insert()
  end
end
