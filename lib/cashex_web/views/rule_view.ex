defmodule CashexWeb.RuleView do
  use CashexWeb, :view

  def render("show.json", %{rule: rule}), do: rule

  def render("delete.json", %{id: rule_id}), do: %{message: "Rule #{rule_id} has been deleted!"}
end
