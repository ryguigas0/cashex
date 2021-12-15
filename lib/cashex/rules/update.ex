defmodule Cashex.Rules.Update do
  @moduledoc """
  Rule updating related functions
  """

  alias Cashex.{Repo, Rule, Rules}

  @doc """
  Updates an Rule with another description or bonus (percentage)
  """
  def call(new_attrs = %{desc: _desc, bon: _bon}, rule_id) do
    Rules.Read.call(rule_id)
    |> Rule.changeset(new_attrs)
    |> Repo.update()
  end
end
