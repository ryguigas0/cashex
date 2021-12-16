defmodule Cashex.Rules.SerchByDesc do
  @moduledoc """
  Rule searching by description
  """

  alias Cashex.{Repo, Rule}

  @doc """
  Finds rules that contain the search in their descriptions
  """
  def call(search) do
    result =
      Repo.all(Rule)
      |> Enum.filter(fn rule ->
        rule.desc |> String.downcase() |> String.contains?(search |> String.downcase())
      end)

    if result |> length == 0 do
      {:error, :search_no_results}
    else
      {:ok, result}
    end
  end
end
