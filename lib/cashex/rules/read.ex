defmodule Cashex.Rules.Read do
  @moduledoc """
  Rule reading related functions
  """

  alias Cashex.{Repo, Rule}

  @doc """
  Finds an Rule from an id (uuid)
  """
  def call(rule_id) do
    # Checks if its an valid uuid
    Regex.match?(
      ~r(^[0-9a-fA-F]{8}\b-[0-9a-fA-F]{4}\b-[0-9a-fA-F]{4}\b-[0-9a-fA-F]{4}\b-[0-9a-fA-F]{12}$),
      rule_id
    )
    |> handle_id(rule_id)
  end

  defp handle_id(true, rule_id) do
    rule = Repo.get_by(Rule, id: rule_id)

    case rule do
      nil -> {:error, :not_found}
      rule -> {:ok, rule}
    end
  end

  defp handle_id(false, _rule), do: {:error, :invalid_data}
end
