defmodule Cashex.Links.Create do
  @moduledoc """
  Link creation related functions
  """
  alias Cashex.{Link, Repo}

  @doc """
  Creates an spending link from an spending value and an cpf
  """
  def call(value, user_cpf) do
    %Link{}
    |> Link.changeset(%{value: value, user_cpf: user_cpf, id: gen_id()})
    |> Repo.insert()
    |> case do
      {:error, changeset} -> {:error, {:invalid_changeset, changeset}}
      {:ok, link} -> {:ok, link}
    end
  end

  # Generates an 7-digit id
  defp gen_id, do: Enum.reduce(1..7, "", fn _n, acc -> "#{:rand.uniform(10) - 1}" <> acc end)
end
