defmodule TdlElixir.Tickets.Ticket do
  use Ecto.Schema

  schema "tickets" do
    belongs_to :event, TdlElixir.Room.Event
    belongs_to :user, TdlElixir.Users.User
    timestamps()
  end
end
