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
end
