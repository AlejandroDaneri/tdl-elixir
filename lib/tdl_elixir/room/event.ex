defmodule TdlElixir.Room.Event do
  use Ecto.Schema
  import Ecto.Changeset
  alias TdlElixir.Room.Event

  schema "events" do
    field :description, :string
    field :name, :string
    # TODO: change to date
    field :date, :string
    field :location, :string
    # TODO: change to number
    field :price, :string

    many_to_many :users, TdlElixir.Users.User, join_through: TdlElixir.Tickets.Ticket

    timestamps()
  end

  @doc false
  def changeset(event, attrs) do
    event
    |> cast(attrs, [:name, :description, :date, :location, :price])
    # TODO: add required fields
    |> validate_required([:name])
    |> Ecto.Changeset.cast_assoc(:user)
  end

  def change_room(%Event{} = room) do
    Event.changeset(room, %{})
  end
end
