defmodule CashexWeb.TransactionController do
  use CashexWeb, :controller

  alias Cashex.Transactions

  action_fallback CashexWeb.ErrorFallbackController

  def create(conn, params) do
    attrs =
      %{}
      |> Map.put(:value, params["value"])
      |> Map.put(:user_cpf, params["user_cpf"])
      |> Map.put(:rule_id, params["rule_id"])

    with {:ok, new_transaction} <- Transactions.Create.call(attrs) do
      conn
      |> put_status(:created)
      |> render("show.json", transaction: new_transaction)
    end
  end

  def show(conn, params) do
    transaction_id = params["id"]

    with {:ok, transaction} <- Transactions.Read.call(transaction_id) do
      conn
      |> put_status(:found)
      |> render("show.json", transaction: transaction)
    end
  end

  def history(conn, params) do
    user_cpf = Map.get(params, "cpf", {:error, :no_cpf_sent})

    with {:ok, history} <-
           Transactions.History.call(user_cpf) do
      conn
      |> put_status(:found)
      |> render("show_many.json", %{transaction_list: history})
    end
  end
end
