defmodule Cashex.Repo.Migrations.CreatePurchases do
  use Ecto.Migration

  def change do
    create table(:purchases, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :cashback, :float
      add :value, :float
      add :buyer_cpf, :string

      timestamps()
    end
  end
end
