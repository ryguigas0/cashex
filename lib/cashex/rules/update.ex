defmodule Cashex.Rules.Update do
  @moduledoc """
  Rule updating related functions
  """

  alias Cashex.{Repo, Rule, Rules}

  @doc """
  Updates an Rule with another description or bonus (percentage)
  """
  def call(%{desc: _desc, bon: _bon} = new_attrs, rule_id) do
    # Finds if the rule to update exists
    Rules.Read.call(rule_id)
    |> handle_read(new_attrs)
  end

  # If it exists
  defp handle_read({:ok, rule}, new_attrs) do
    rule
    |> Rule.changeset(new_attrs)
    |> Repo.update()
    |> case do
      {:error, changeset} -> {:error, {:invalid_changeset, changeset}}
      {:ok, rule} -> {:ok, rule}
    end
  end

  # Recieving error -> forward the error
  defp handle_read({:error, _} = error, _), do: error
end
