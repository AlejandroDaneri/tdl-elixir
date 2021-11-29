defmodule TdlElixirWeb.TicketController do
  use TdlElixirWeb, :controller
  alias TdlElixir.Event.Event
  alias TdlElixir.Users.User
  alias TdlElixir.Repo
  alias TdlElixir.Tickets.Ticket
  alias Ecto.Changeset
  require Logger

  def create(conn, %{"id" => event_id}) do
    user = Pow.Plug.current_user(conn)
    event = Repo.get!(Event, event_id)

    %Ticket{}
    |> Ecto.Changeset.change()
    |> Changeset.put_assoc(:user, user)
    |> Changeset.put_assoc(:event, event)
    |> Repo.insert()
    |> case do
      {:ok, _} ->
        conn
        |> put_flash(:info, "Ticket successfully bought.")
        |> redirect(to: Routes.home_path(conn, :index))

      {:error, _} ->
        conn
        |> put_flash(:error, "Error buying ticket.")
        Logger.error("Error buying ticket")
    end
  end
end
