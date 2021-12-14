defmodule Cashex.Buyer do
  @moduledoc """
  Buyer data model
  """

  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:cpf, :string, autogenerate: false}

  @required_params [:cashback_acc, :cpf]

  schema "buyers" do
    field :cashback_acc, :float, default: 0.0

    timestamps()
  end

  @doc false
  def changeset(buyer, attrs) do
    buyer
    |> cast(attrs, @required_params)
    |> validate_required(@required_params)
    |> validate_length(:cpf, is: 11)
  end
end
