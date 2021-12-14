defmodule Cashex.Rules.Read do
  alias Cashex.{Rule, Repo}

  def call(rule_id) do
    Repo.one(Rule, id: rule_id)
  end
end
