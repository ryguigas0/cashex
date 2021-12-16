defmodule Cashex.Rules.Delete do
  @moduledoc """
  Rule updating related functions
  """

  alias Cashex.{Repo, Rules}

  @doc """
  Deletes an Rule using an rule id (uuid)
  """
  def call(rule_id) do
    Rules.Read.call(rule_id)
    |> case do
      {:ok, rule} ->
        rule
        |> Repo.delete()

      {:error, _} = errors ->
        errors
    end
  end
end
