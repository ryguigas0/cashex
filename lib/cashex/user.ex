defmodule Cashex.User do
  @moduledoc """
  User data model
  """

  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:cpf, :string, autogenerate: false}

  @required_params [:cashback_acc, :cpf]

  schema "users" do
    field :cashback_acc, :float, default: 0.0

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, @required_params)
    |> validate_required(@required_params)
    |> validate_length(:cpf, is: 11)
  end
end
