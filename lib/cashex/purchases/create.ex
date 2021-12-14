defmodule Cashex.Purchases.Create do
  alias Cashex.{Purchase, Repo, Rules}

  def call(attrs = %{value: value, buyer_cpf: _}, rule_id) do
    get_cashback(rule_id, value)
    |> handle_purchase(attrs)
  end

  defp get_cashback(rule_id, value) do
    case Rules.Read.call(rule_id) do
      nil ->
        {:error, :rule_not_found}

      rule ->
        rule.bon / 100 * value
    end
  end

  defp handle_purchase({:error, reason}, _attrs), do: {:error, reason}

  defp handle_purchase(cashback_value, attrs) do
    attrs = Map.put(attrs, :cashback, cashback_value)

    %Purchase{}
    |> Purchase.changeset(attrs)
    |> Repo.insert()
  end
end
