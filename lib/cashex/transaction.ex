defmodule Cashex.Transaction do
  @moduledoc """
  Transaction data model
  """

  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}

  @fields [:value, :buyer_cpf, :cashback]

  # What to render in json
  @derive {Jason.Encoder, only: [:id] ++ @fields}

  schema "transactions" do
    field :cashback, :float
    field :value, :float
    field :buyer_cpf, :string

    timestamps()
  end

  @doc false
  def changeset(transaction, attrs) do
    transaction
    |> cast(attrs, @fields)
    |> validate_required(@fields)
    |> validate_length(:buyer_cpf, is: 11)
    # Negative -> Spending cashback
    # Positive -> Recieving cashback
    |> validate_number(:value, not_equal_to: 0)
  end
end
