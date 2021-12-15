defmodule CashexWeb.UserView do
  use CashexWeb, :view

  def render("show.json", %{user: user}), do: user
end
