defmodule Cashex.Transactions.History do
  @moduledoc """
  Functions for retrieving an history of transactions from a user
  """

  import Ecto.Query
  alias Cashex.{Repo, Transaction}

  def call(user_cpf) do
    query = from t in Transaction, where: t.user_cpf == ^user_cpf

    Repo.all(query)
  end
end
