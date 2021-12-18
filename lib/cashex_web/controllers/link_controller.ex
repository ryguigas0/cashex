defmodule CashexWeb.LinkController do
  use CashexWeb, :controller

  alias Cashex.Links

  action_fallback CashexWeb.ErrorFallbackController

  def gen_spend_link(conn, params) do
    value = params["value"]
    user_cpf = params["user_cpf"]

    with {:ok, link} <- Links.Create.call(value, user_cpf) do
      conn
      |> put_status(:created)
      |> render("show.json", link: link)
    end
  end

  def use_spend_link(conn, params) do
    id = params["id"]

    with {:ok, link} <- Links.Delete.call(id) do
      conn
      |> put_view(CashexWeb.TransactionView)
      |> CashexWeb.TransactionController.spend(%{
        "value" => link.value,
        "user_cpf" => link.user_cpf
      })
    end
  end
end
