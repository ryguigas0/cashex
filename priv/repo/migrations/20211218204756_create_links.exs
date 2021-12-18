defmodule Cashex.Repo.Migrations.CreateLinks do
  @moduledoc """
  Link Ecto migration
  """
  use Ecto.Migration

  def change do
    create table(:links, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :value, :float
      add :user_cpf, :string

      timestamps()
    end
  end
end
