defmodule Cashex.Transactions.History do
  @moduledoc """
  Functions for retrieving an history of transactions from a user
  """

  import Ecto.Query
  alias Cashex.{Repo, Transaction}

  def call(user_cpf) do
    query = from t in Transaction, where: t.user_cpf == ^user_cpf

    history =
      Repo.all(query)

    if history |> Enum.empty? do
      {:error, :search_no_results}
    else
      {:ok, history}
    end
  end
end
