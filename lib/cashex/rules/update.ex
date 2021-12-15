defmodule Cashex.Rules.Update do
  @moduledoc """
  Rule updating related functions
  """

  alias Cashex.{Repo, Rule, Rules}

  @doc """
  Updates an Rule with another description or bonus (percentage)
  """
  def call(new_attrs, rule_id) when is_map(new_attrs) do
    Rules.Read.call(rule_id)
    |> Rule.changeset(new_attrs)
    |> Repo.update()
  end
end
