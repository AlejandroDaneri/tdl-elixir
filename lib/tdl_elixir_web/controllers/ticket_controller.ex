defmodule TdlElixirWeb.TicketController do
  use TdlElixirWeb, :controller
  alias TdlElixir.Room.Event
  alias TdlElixir.Users.User
  alias TdlElixir.Repo

  def create(conn, %{"id" => event_id}) do
    current_user = Pow.Plug.current_user(conn)

    current_user
    |> Repo.preload(:events)
    |> Ecto.Changeset.change()
    |> Ecto.Changeset.put_assoc(:events, [Repo.get!(Event, event_id)])
    |> Repo.update()
    |> case do
      {:ok, _} ->
        conn
        |> put_flash(:info, "the ticket was successfully bought.")
        |> redirect(to: Routes.home_path(conn, :index))

      {:error, _} ->
        # handle error
        Logger.error("Error buying ticket")
    end
  end
end
