defmodule CashexWeb.LinkView do
  use CashexWeb, :view

  def render("show.json", %{link: link}),
    do: %{
      id: link.id
    }
end
