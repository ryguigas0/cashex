defmodule Cashex.Users.Create do
  @moduledoc """
    User creation function
  """

  alias Cashex.{Repo, User}

  def call(cpf) do
    %User{}
    |> User.changeset(%{cpf: cpf})
    |> Repo.insert()
    |> case do
      {:error, changeset} -> {:error, {:invalid_changeset, changeset}}
      {:ok, user} ->  {:ok, user}
    end
  end
end
