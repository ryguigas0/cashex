defmodule Cashex.Transactions.Read do
  @moduledoc """
  Transaction reading related functions
  """

  alias Cashex.{Repo, Transaction}

  def call(transaction_id) do
    Repo.get_by(Transaction, id: transaction_id)
    |> case do
      nil -> {:error, :not_found}
      transaction -> {:ok, transaction}
    end
  rescue
    Ecto.Query.CastError -> {:error, :invalid_data}
  end
end
