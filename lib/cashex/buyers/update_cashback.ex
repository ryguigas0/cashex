defmodule Cashex.Buyers.UpdateCashback do
  alias Cashex.{Repo, Buyer, Buyers}

  def call(cpf, cashback_value) do
    find_buyer(cpf)
    |> update_cashback_acc(cashback_value)
  end

  defp find_buyer(cpf) do
    Repo.get_by(Buyer, cpf: cpf)
    |> handle_buyer(cpf)
  end

  defp handle_buyer(nil, cpf) do
    case Buyers.Create.call(cpf) do
      {:error, _} = err -> err
      {:ok, buyer} -> buyer
    end
  end

  defp handle_buyer(buyer, _cpf), do: buyer

  defp update_cashback_acc(buyer, cashback_value) do
    buyer
    |> Buyer.changeset(%{cashback_acc: buyer.cashback_acc + cashback_value})
    |> Repo.update()
  end
end
