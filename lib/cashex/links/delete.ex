defmodule Cashex.Links.Delete do
  @moduledoc """
  Link deleting related functions
  """

  alias Cashex.{Repo, Links}

  @doc """
  Deletes an Link using an link id (uuid)
  """
  def call(link_id) do
    link = Links.Read.call(link_id)

    case link do
      {:ok, link} ->
        link
        |> Repo.delete()

      {:error, _} = errors ->
        errors
    end
  end
end
