defmodule Cashex.Users.Create do
  @moduledoc """
    User creation function
  """

  alias Cashex.{Repo, User}

  def call(cpf) do
    %User{}
    |> User.changeset(%{cpf: cpf})
    |> Repo.insert()
  end
end
