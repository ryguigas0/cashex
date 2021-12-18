defmodule Cashex.Links.Read do
  alias Cashex.{Repo, Link}

  def call(link_id) do
    # Checks if its an valid uuid
    Regex.match?(
      ~r(^[0-9a-fA-F]{8}\b-[0-9a-fA-F]{4}\b-[0-9a-fA-F]{4}\b-[0-9a-fA-F]{4}\b-[0-9a-fA-F]{12}$),
      link_id
    )
    |> handle_id(link_id)
  end

  defp handle_id(true, link_id) do
    link = Repo.get_by(Link, id: link_id)

    case link do
      nil -> {:error, :not_found}
      link -> {:ok, link}
    end
  end

  defp handle_id(false, _link_id), do: {:error, :invalid_data}
end
