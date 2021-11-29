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
    # TODO receive amount as param
    Ticket.create(event_id, user, 1)
    |> case do
      {:ok, _} ->
        conn
        |> put_flash(:info, "Ticket successfully bought.")
        |> redirect(to: Routes.home_path(conn, :index))

      {:error, _} ->
        Logger.error("Error buying ticket.")

        conn
        |> put_flash(:error, "Error buying ticket.")
        |> redirect(to: Routes.home_path(conn, :index))
    end
  end
end
