defmodule Cashex.Rules.Read do
  @moduledoc """
  Rule reading related functions
  """

  alias Cashex.{Repo, Rule}

  @doc """
  Finds an Rule from an id (uuid)
  """
  def call(rule_id) do
    Repo.get_by(Rule, id: rule_id)
    |> case do
      nil -> {:error, :not_found}
      rule -> {:ok, rule}
    end
  rescue
    Ecto.Query.CastError -> {:error, :invalid_data}
  end
end
