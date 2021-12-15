defmodule Cashex.Rule do
  @moduledoc """
  Rule data model
  """
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id

  @fields [:desc, :bon]

  # What to render in json
  @derive {Jason.Encoder, only: [:id] ++ @fields}

  schema "rules" do
    field :bon, :float
    field :desc, :string

    timestamps()
  end

  @doc false
  def changeset(rule, attrs) do
    rule
    |> cast(attrs, @fields)
    |> validate_required(@fields)
    |> validate_number(:bon, greater_than: 0, less_than_or_equal_to: 100)
    |> validate_length(:desc, max: 128)
  end
end
