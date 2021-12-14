defmodule Cashex.Purchases.Read do
  alias Cashex.{Purchase, Repo}

  def call(purchase_id) do
    Repo.one(Purchase, id: purchase_id)
  end
end
