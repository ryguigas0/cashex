defmodule Cashex.Rules.Create do
  alias Cashex.{Rule, Repo}

  def call(attrs = %{desc: _desc, bon: _bon}) when is_map(attrs) do
    %Rule{}
    |> Rule.changeset(attrs)
    |> Repo.insert()
  end
end
