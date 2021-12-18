defmodule Cashex.Repo.Migrations.CreateTransactions do
  @moduledoc """
  Transaction Ecto migration
  """
  use Ecto.Migration

  def change do
    create table(:transactions, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :cashback, :float
      add :value, :float
      add :user_cpf, :string
      # recieve / spend
      add :type, :string

      timestamps()
    end
  end
end
