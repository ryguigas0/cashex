defmodule Cashex.User do
  @moduledoc """
  User data model
  """

  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:cpf, :string, autogenerate: false}

  @fields [:cashback_acc, :cpf]

  @derive {Jason.Encoder, only: @fields}

  schema "users" do
    field :cashback_acc, :float, default: 0.0

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, @fields)
    |> validate_required(@fields)
    |> validate_length(:cpf, is: 11)
    |> validate_number(:cashback_acc, greater_than_or_equal_to: 0)
  end
end
