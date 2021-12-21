defmodule Cashex.Users.UpdateCashback do
  @moduledoc """
  User cashback updating related functions
  """
  alias Cashex.{Repo, User, Users}

  @doc """
    Creates or finds by the cpf value an user, then adds or subtracts the value to the accumulated cashback
  """
  def call(cpf, value, type) do
    find_user(cpf)
    |> update_cashback_acc(value, type)
  end

  defp find_user(cpf) do
    # Finds an user with the cpf
    cpf
    |> Users.Read.call()
    |> handle_user(cpf)
  end

  # Runs when there is no user with the same cpf
  defp handle_user({:error, :user_not_found}, cpf) do
    case Users.Create.call(cpf) do
      # invalid cpf
      {:error, _} = err -> err
      # created a new user
      {:ok, user} -> {:ok, user}
    end
  end

  # Runs when an user is found
  defp handle_user({:ok, user}, _cpf), do: {:ok, user}

  # Spend the user cashback, if possible
  defp update_cashback_acc({:ok, user}, value, "spend") do
    if value <= user.cashback_acc do
      user
      |> User.changeset(%{cashback_acc: user.cashback_acc - value})
      |> Repo.update()

      {:ok, :cashback_spent}
    else
      {:error, :insuficient_funds}
    end
  end

  defp update_cashback_acc({:ok, user}, value, "recieve") do
    user
    |> User.changeset(%{cashback_acc: user.cashback_acc + value})
    |> Repo.update()
  end
end
