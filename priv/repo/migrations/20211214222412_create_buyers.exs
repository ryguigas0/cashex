defmodule Cashex.Repo.Migrations.CreateBuyers do
  use Ecto.Migration

  def change do
    create table(:buyers, primary_key: false) do
      add :cpf, :string, primary_key: true
      add :cashback_acc, :float

      timestamps()
    end
  end
end
