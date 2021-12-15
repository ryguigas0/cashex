defmodule Cashex.Rules.SerchByDesc do
  @moduledoc """
  Rule searching by description
  """

  alias Cashex.{Repo, Rule}

  @doc """
  Finds rules that contain the search in their descriptions
  """
  def call(search) do
    Repo.all(Rule)
    |> Enum.filter(fn rule ->
      rule.desc |> String.downcase() |> String.contains?(search |> String.downcase())
    end)
  end
end
