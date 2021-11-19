defmodule TdlElixir.Room.Event do
  use Ecto.Schema
  import Ecto.Changeset
  alias TdlElixir.Room.Event

  schema "events" do
    field :description, :string
    field :name, :string
    field :date, :string
    field :location, :string
    field :price, :string

    timestamps()
  end

  @doc false
  def changeset(event, attrs) do
    event
    |> cast(attrs, [:name, :description, :date, :location, :price])
    |> validate_required([:name])
  end

  def change_room(%Event{} = room) do
    Event.changeset(room, %{})
  end
end
