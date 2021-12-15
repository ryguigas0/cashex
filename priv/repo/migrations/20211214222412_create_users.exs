defmodule Cashex.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users, primary_key: false) do
      add :cpf, :string, primary_key: true
      add :cashback_acc, :float

      timestamps()
    end
  end
end
