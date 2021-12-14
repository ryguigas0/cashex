defmodule Cashex.Buyers.Create do
  alias Cashex.{Repo, Buyer}

  def call(cpf) do
    %Buyer{}
    |> Buyer.changeset(%{cpf: cpf})
    |> Repo.insert()
  end
end
