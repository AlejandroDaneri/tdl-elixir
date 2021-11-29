defmodule TdlElixir.Event.Event do
  use Ecto.Schema
  import Ecto.Changeset
  alias TdlElixir.Event.Event

  schema "events" do
    field :description, :string
    field :name, :string
    field :date, :utc_datetime
    field :location, :string
    field :price, :float
    field :availability, :integer

    timestamps()
  end

  @doc false
  def changeset(event, attrs) do
    # TODO extract constants to config
    event
    |> cast(attrs, [:name, :description, :date, :location, :price, :availability])
    |> validate_number(:price, greater_than_or_equal_to: 0)
    |> validate_number(:availability, greater_than_or_equal_to: 0)
    |> validate_length(:name, min: 1, max: 100)
    |> validate_length(:description, max: 100)
    |> validate_length(:location, min: 2)
    |> validate_required([:name, :description, :date, :location, :price, :availability])
  end

  def change_event(%Event{} = event) do
    Event.changeset(event, %{})
  end
end
