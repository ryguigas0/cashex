defmodule Cashex.Repo.Migrations.CreateRules do
  use Ecto.Migration

  def change do
    create table(:rules, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :desc, :string
      add :bon, :float

      timestamps()
    end
  end
end
