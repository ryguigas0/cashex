defmodule Cashex.Repo.Migrations.CreateUsers do
  @moduledoc """
  User Ecto migration
  """
  use Ecto.Migration

  def change do
    create table(:users, primary_key: false) do
      add :cpf, :string, primary_key: true, size: 11
      add :cashback_acc, :float

      timestamps()
    end
  end
end
