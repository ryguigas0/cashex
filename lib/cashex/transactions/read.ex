defmodule Cashex.Transactions.Read do
  @moduledoc """
  Transaction reading related functions
  """

  alias Cashex.{Transaction, Repo}

  def call(transaction_id) do
    Repo.one(Transaction, id: transaction_id)
  end
end
