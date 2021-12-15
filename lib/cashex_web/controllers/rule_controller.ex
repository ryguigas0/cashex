defmodule CashexWeb.RuleController do
  use CashexWeb, :controller

  alias Cashex.Rules

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

    with rule <- Rules.Read.call(rule_id),
         false <- is_nil(rule) do
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
end
