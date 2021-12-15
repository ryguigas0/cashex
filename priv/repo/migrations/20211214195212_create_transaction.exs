defmodule Cashex.Repo.Migrations.CreateTransactions do
  use Ecto.Migration

  def change do
    create table(:transactions, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :cashback, :float
      add :value, :float
      add :buyer_cpf, :string

      timestamps()
    end
  end
end