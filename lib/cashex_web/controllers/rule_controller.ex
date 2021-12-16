defmodule CashexWeb.RuleController do
  use CashexWeb, :controller

  alias Cashex.Rules

  action_fallback CashexWeb.ErrorFallbackController

  def create(conn, params) do
    attrs =
      %{}
      |> Map.put(:desc, params["desc"])
      |> Map.put(:bon, params["bon"])

    with {:ok, new_rule} <- Rules.Create.call(attrs) do
      conn
      |> put_status(:created)
      |> render("show.json", rule: new_rule)
    end
  end

  def show(conn, params) do
    rule_id = params["id"]

    with {:ok, rule} <- Rules.Read.call(rule_id) do
      conn
      |> put_status(:found)
      |> render("show.json", rule: rule)
    end
  end

  def update(conn, params) do
    rule_id = params["id"]

    new_attrs =
      %{}
      |> Map.put(:desc, params["desc"])
      |> Map.put(:bon, params["bon"])

    with {:ok, updated_rule} <- Rules.Update.call(new_attrs, rule_id) do
      conn
      |> put_status(:ok)
      |> render("show.json", rule: updated_rule)
    end
  end

  def delete(conn, params) do
    rule_id = params["id"]

    with {:ok, _deleted_rule} <- Rules.Delete.call(rule_id) do
      conn
      |> put_status(:ok)
      |> render("delete.json", id: rule_id)
    end
  end

  def search(conn, params) do
    desc = Map.get(params, "desc", "")

    with {:ok, rules} <-
           Rules.SerchByDesc.call(desc) do
      conn
      |> put_status(:found)
      |> render("show_many.json", rule_list: rules)
    end
  end
end
