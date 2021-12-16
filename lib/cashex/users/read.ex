defmodule Cashex.Users.Read do
  @moduledoc """
  User reading related functions
  """

  alias Cashex.{User, Repo}

  # Finds an single user with an cpf
  def call(cpf) do
    Repo.get_by(User, cpf: cpf)
    |> case do
      nil -> {:error, :search_no_results}
      user -> {:ok, user}
    end
  end
end
