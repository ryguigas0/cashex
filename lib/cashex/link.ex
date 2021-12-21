defmodule Cashex.Link do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :string, autogenerate: false}
  @foreign_key_type :string
  schema "links" do
    field :user_cpf, :string
    field :value, :float

    timestamps()
  end

  @doc false
  def changeset(link, attrs) do
    link
    |> cast(attrs, [:value, :user_cpf, :id])
    |> validate_required([:value, :user_cpf])
    |> validate_length(:user_cpf, is: 11)
    |> validate_number(:value, greater_than: 0)
  end
end
