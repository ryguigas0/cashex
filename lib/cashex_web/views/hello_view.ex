defmodule CashexWeb.HelloView do
  use CashexWeb, :view

  def render("hello.json", %{name: name}) do
    %{
      message: "Hello #{name}"
    }
  end
end
