defmodule Cashex.Users.Read do
  @moduledoc """
  User reading related functions
  """

  alias Cashex.{User, Repo}

  # Finds an single user with an cpf
  def call(cpf) do
    Repo.get_by(User, cpf: cpf)
    |> case do
      nil -> {:error, :user_not_found}
      user -> {:ok, user}
    end
  end
end
