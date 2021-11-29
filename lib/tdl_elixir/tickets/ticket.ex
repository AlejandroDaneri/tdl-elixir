defmodule TdlElixir.Tickets.Ticket do
  use Ecto.Schema
  alias Ecto.Changeset
  alias TdlElixir.Event.Event
  alias TdlElixir.Users.User
  alias TdlElixir.Repo
  alias TdlElixir.Tickets.Ticket

  schema "tickets" do
    belongs_to :event, Event
    belongs_to :user, User
    timestamps()
  end

  def _create(event, user) do
    %Ticket{}
    |> Ecto.Changeset.change()
    |> Changeset.put_assoc(:user, user)
    |> Changeset.put_assoc(:event, event)
    |> Repo.insert()
  end

  def create(event_id, user, amount) do
    event = Repo.get!(Event, event_id)

    cond do
      event.availability - amount < 0 ->
        {:error, "there are not enough tickets available"}
      true ->
        Event.reduce_availability_by(event, amount)
        _create(event, user)
    end


  end
end
