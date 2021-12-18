defmodule Cashex.Transactions.Create do
  @moduledoc """
  Transaction creation related functions
  """
  alias Cashex.{Users, Repo, Rules, Transaction}

  @doc """
  Creates an transaction from a value, an user_cpf and a rule_id
  """
  def call(type, user_cpf, value, rule_id) do
    get_cashback(rule_id, value)
    |> handle_transaction(value, user_cpf, type)
  end

  # It only recieves nil if its a spending transaction
  defp get_cashback(nil, _value), do: 0

  # Calculates the cashback with the bonus, in case theres a rule
  defp get_cashback(rule_id, value) do
    case Rules.Read.call(rule_id) do
      {:error, reason} ->
        {:error, reason}

      {:ok, rule} ->
        rule.bon / 100 * value
    end
  end

  # Runs if theres is no rule to get the bonus from
  defp handle_transaction({:error, reason}, _value, _user_cpf, _type),
    do: {:error, reason}

  # Inserts the transaction in the database
  defp handle_transaction(cashback, value, user_cpf, type) do
    case type do
      # if its an spending transaction
      "spend" -> Users.UpdateCashback.call(user_cpf, value, type)
      # if its an recieving transaction
      "recieve" -> Users.UpdateCashback.call(user_cpf, cashback, type)
    end

    attrs = %{cashback: cashback, value: value, user_cpf: user_cpf, type: type}

    %Transaction{}
    |> Transaction.changeset(attrs)
    |> Repo.insert()
  end
end
