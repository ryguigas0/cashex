defmodule CashexWeb.RuleView do
  use CashexWeb, :view

  def render("show.json", %{rule: rule}), do: rule

  def render("show_many.json", %{rule_list: rule_list}) do
    rule_list
    |> Enum.map(&render("show.json", %{rule: &1}))
  end

  def render("delete.json", %{id: rule_id}), do: %{message: "Rule #{rule_id} has been deleted!"}
end
