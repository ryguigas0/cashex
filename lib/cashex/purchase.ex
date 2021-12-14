defmodule Cashex.Purchase do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}

  @cast_attrs [:value, :buyer_cpf]

  schema "purchases" do
    field :cashback, :float
    field :value, :float
    field :buyer_cpf, :string

    has_one :rule, Cashex.Rule, foreign_key: :id
    timestamps()
  end

  @doc false
  def changeset(purchase, attrs) do
    purchase
    |> cast(attrs, @cast_attrs)
    |> validate_required(@cast_attrs)
    |> validate_length(:buyer_cpf, is: 11)
    |> validate_number(:value, not_equal_to: 0)
  end
end
