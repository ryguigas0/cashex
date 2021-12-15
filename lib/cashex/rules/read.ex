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
  end
end
