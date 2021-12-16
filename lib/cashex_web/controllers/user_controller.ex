defmodule CashexWeb.UserController do
  use CashexWeb, :controller

  alias Cashex.Users

  action_fallback CashexWeb.ErrorFallbackController

  def show(conn, params) do
    cpf = Map.get(params, "cpf", "")

    with {:ok, user} <- Users.Read.call(cpf) do
      conn
      |> put_status(:found)
      |> render("show.json", user: user)
    end
  end

  def spend(conn, params) do
    cashback_value = params["cashback"] |> String.to_float()
    cpf = params["cpf"]

    with {:ok, user} <- Users.Read.call(cpf) do
      cond do
        cashback_value == 0 ->
          {:error, :cashback_0_value}

        user.cashback_acc < cashback_value ->
          {:error, :inssuficient_balance}

        true ->
          Users.UpdateCashback.call(cpf, -cashback_value)

          conn
          |> put_status(:ok)
          |> render("show.json", user: user)
      end
    end
  rescue
    ArgumentError -> {:error, :cashback_not_float_value}
  end
end
