defmodule Cashex.Buyers.UpdateCashback do
  alias Cashex.{Repo, Buyer, Buyers}

  @doc """
    Creates or finds by the cpf value an buyer and add the cashback value to the accumulated cashback
  """
  def call(cpf, cashback_value) do
    find_buyer(cpf)
    |> update_cashback_acc(cashback_value)
  end

  defp find_buyer(cpf) do
    # Finds an buyer with the cpf
    Buyers.Read.call(cpf)
    |> handle_buyer(cpf)
  end

  # Runs when there is no buyer with the same cpf
  defp handle_buyer(nil, cpf) do
    case Buyers.Create.call(cpf) do
      # invalid cpf
      {:error, _} = err -> err
      # created a new buyer
      {:ok, buyer} -> buyer
    end
  end

  # Runs when an buyer is found
  defp handle_buyer(buyer, _cpf), do: buyer

  # Updates the accumulated cashback from the buyer
  defp update_cashback_acc(buyer, cashback_value) do
    buyer
    |> Buyer.changeset(%{cashback_acc: buyer.cashback_acc + cashback_value})
    |> Repo.update()
  end
end
