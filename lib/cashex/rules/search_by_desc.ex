defmodule Cashex.Rules.SerchByDesc do
  @moduledoc """
  Rule searching by description
  """

  alias Cashex.{Repo, Rule}

  import Ecto.Query

  @doc """
  Finds rules that contain the search in their descriptions
  """
  def call(search) do
    query_str = "%#{search}%"
    # WARNING: ilike/2 IS ONLY AVAILABLE ON POSTGRESQL
    query = from r in Rule, where: ilike(r.desc, ^query_str)

    result = Repo.all(query)

    {:ok, result}
  end
end
