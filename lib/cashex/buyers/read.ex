defmodule Cashex.Buyers.Read do
  @moduledoc """
  Buyer reading related functions
  """

  alias Cashex.{Buyer, Repo}

  # Finds an single buyer with an cpf
  def call(cpf) do
    Repo.one(Buyer, cpf: cpf)
  end
end
