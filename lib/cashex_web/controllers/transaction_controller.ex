defmodule CashexWeb.TransactionController do
  use CashexWeb, :controller

  alias Cashex.Transactions

  def create(conn, params) do
    attrs =
      %{}
      |> Map.put(:value, params["value"])
      |> Map.put(:buyer_cpf, params["buyer_cpf"])
      |> Map.put(:rule_id, params["rule_id"])

    with {:ok, new_transaction} <- Transactions.Create.call(attrs) do
      conn
      |> put_status(:created)
      |> render("show.json", transaction: new_transaction)
    end
  end

  def show(conn, params) do
    transaction_id = params["id"]

    with transaction <- Transactions.Read.call(transaction_id),
         false <- is_nil(transaction) do
      conn
      |> put_status(:found)
      |> render("show.json", transaction: transaction)
    end
  end

  def history(conn, params) do
    with buyer_cpf <- params["cpf"],
         false <- is_nil(buyer_cpf),
         history <- Transactions.History.call(buyer_cpf),
         true <- length(history) != 0 do
      conn
      |> put_status(:found)
      |> render("show_many.json", %{transaction_list: history})
    end
  end
end
