defmodule Cashex.Users.UpdateCashback do
  alias Cashex.{Repo, User, Users}

  @doc """
    Creates or finds by the cpf value an user and add the cashback value to the accumulated cashback
  """
  def call(cpf, cashback_value) do
    find_user(cpf)
    |> update_cashback_acc(cashback_value)
  end

  defp find_user(cpf) do
    # Finds an user with the cpf
    Users.Read.call(cpf)
    |> handle_user(cpf)
  end

  # Runs when there is no user with the same cpf
  defp handle_user(nil, cpf) do
    case Users.Create.call(cpf) do
      # invalid cpf
      {:error, _} = err -> err
      # created a new user
      {:ok, user} -> user
    end
  end

  # Runs when an user is found
  defp handle_user(user, _cpf), do: user

  # Updates the accumulated cashback from the user
  defp update_cashback_acc(user, cashback_value) do
    user
    |> User.changeset(%{cashback_acc: user.cashback_acc + cashback_value})
    |> Repo.update()
  end
end
