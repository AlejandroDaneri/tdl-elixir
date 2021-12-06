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
    field :price, :float
    field :availability, :integer
    has_many :tickets, Ticket

    timestamps()
  end

  @doc false
  def changeset(event, params \\ %{}) do
    # TODO extract constants to config
    event
    |> cast(params, [:name, :description, :date, :location, :price, :availability])
    |> validate_number(:price, greater_than_or_equal_to: 0)
    |> validate_number(:availability, greater_than_or_equal_to: 0)
    |> validate_length(:name, min: 1, max: 100)
    |> validate_length(:description, max: 100)
    |> validate_length(:location, min: 2)
    |> validate_required([:name, :description, :date, :location, :price, :availability])
  end

  defprotocol PurchaseTickets do
    def reduce_availability_by(events, n)
  end

  defimpl PurchaseTickets, for: SingularEvent do
    def reduce_availability_by(event, n) do
      Event.changeset(event, %{availability: event.availability - n})
      |> Repo.update()
    end
  end

  defimpl PurchaseTickets, for: PackEvents do
    def reduce_availability_by(events, n) do
      #for event in events:
        Event.changeset(event, %{availability: event.availability - n})
        |> Repo.update()
    end
  end

  #def increase_availability_by(event, n) do
  #  Event.changeset(event, %{availability: event.availability + n})
  #  |> Repo.update()
  #end

  def change_event(%Event{} = event) do
    Event.changeset(event, %{})
  end
end
