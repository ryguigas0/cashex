defmodule Cashex.Transactions.History do
  @moduledoc """
  Functions for retrieving an history of transactions from a buyer
  """

  import Ecto.Query
  alias Cashex.{Repo, Transaction}

  def call(buyer_cpf) do
    query = from t in Transaction, where: t.buyer_cpf == ^buyer_cpf

    Repo.all(query)
  end
end
