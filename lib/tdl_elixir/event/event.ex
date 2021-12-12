defmodule TdlElixir.Event.Event do
  use Ecto.Schema
  import Ecto.Changeset
  alias TdlElixir.Event.Event
  alias TdlElixir.Tickets.Ticket
  alias TdlElixir.Repo

  schema "events" do
    field :description, :string
    field :name, :string
    field :date, :utc_datetime
    field :location, :string
    field :price, :integer
    field :availability, :integer
    has_many :tickets, Ticket

    timestamps()
  end

  @doc false
  def changeset(event, params \\ %{}) do
    event
    |> cast(params, [:name, :description, :date, :location, :price, :availability])
    |> validate_number(:price, greater_than_or_equal_to: 0)
    |> validate_number(:availability, greater_than_or_equal_to: 0)
    |> validate_length(:name, min: 1, max: 100)
    |> validate_length(:description, max: 100)
    |> validate_length(:location, min: 2)
    |> validate_required([:name, :description, :date, :location, :price, :availability])
  end

  def reduce_availability_by(event, n) do
    Event.changeset(event, %{availability: event.availability - n})
    |> Repo.update()
  end

  def change_event(%Event{} = event) do
    Event.changeset(event, %{})
  end

  def list_events do
    Repo.all(Event)
  end
end
