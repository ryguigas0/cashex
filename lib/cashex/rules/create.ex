defmodule Cashex.Rules.Create do

  @moduledoc """
  Rule creating related functions
  """

  alias Cashex.{Repo, Rule}

  @doc """
  Creates an Rule from a description and bonus (percentage)
  """
  def call(attrs = %{desc: _desc, bon: _bon}) when is_map(attrs) do
    %Rule{}
    |> Rule.changeset(attrs)
    |> Repo.insert()
  end
end
