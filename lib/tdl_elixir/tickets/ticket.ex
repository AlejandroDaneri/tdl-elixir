defmodule TdlElixir.Tickets.Ticket do
  use Ecto.Schema
  alias TdlElixir.Event.Event
  alias TdlElixir.Users.User

  schema "tickets" do
    belongs_to :event, Event
    belongs_to :user, User
    timestamps()
  end

  @doc false
  def changeset(event, params \\ %{}) do
    event
    |> cast(params, [:name, :description, :date, :location, :price, :availability])
  end

end
