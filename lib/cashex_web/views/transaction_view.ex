defmodule CashexWeb.TransactionView do
  use CashexWeb, :view

  def render("show.json", %{transaction: transaction}), do: transaction

  def render("show_many.json", %{transaction_list: transaction_list}) do
    transaction_list
    |> Enum.map(&render("show.json", %{transaction: &1}))
  end
end
