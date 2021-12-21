defmodule Cashex.Links.Read do
  @moduledoc """
  Link reading related functions
  """

  alias Cashex.{Link, Repo}

  def call(link_id) do
    # Checks if its an valid uuid
    Regex.match?(
      ~r([0-9]{7}),
      link_id
    )
    |> handle_id(link_id)
  end

  defp handle_id(true, link_id) do
    link = Repo.get_by(Link, id: link_id)

    case link do
      nil -> {:error, :link_not_found}
      link -> {:ok, link}
    end
  end

  defp handle_id(false, _link_id), do: {:error, :invalid_data}
end
