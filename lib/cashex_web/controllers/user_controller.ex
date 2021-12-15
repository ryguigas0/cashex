defmodule CashexWeb.UserController do
  use CashexWeb, :controller

  alias Cashex.Users

  def show(conn, params) do
    cpf = params["cpf"]

    with user <- Users.Read.call(cpf), false <- is_nil(user) do
      conn
      |> put_status(:found)
      |> render("show.json", user: user)
    end
  end

  def spend(conn, params) do
    cashback_value = params["cashback"] |> String.to_float()
    cpf = params["cpf"]

    with user <- Users.Read.call(cpf), false <- is_nil(user) do
      if user.cashback_acc < cashback_value do
        {:error, :inssuficient_balance}
      else
        Users.UpdateCashback.call(cpf, -cashback_value)

        conn
        |> put_status(:ok)
        |> render("show.json", user: user)
      end
    end
  end
end
