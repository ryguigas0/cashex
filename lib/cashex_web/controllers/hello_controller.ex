defmodule CashexWeb.HelloController do
  use CashexWeb, :controller

  alias CashexWeb.HelloView

  def hello(conn, params) do
    name = Map.get(params, "name", "visitor")

    conn
    |> put_status(:ok)
    |> put_view(HelloView)
    |> render("hello.json", name: name)
  end
end
