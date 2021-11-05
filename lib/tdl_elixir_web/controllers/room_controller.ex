defmodule TdlElixirWeb.RoomController do
  use TdlElixirWeb, :controller

  def new(conn, _params) do
    alias TdlElixir.Room.Event
    changeset = Event.changeset(%Event{}, %{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"event" => room_params}) do
    alias TdlElixir.Room.Event
    alias TdlElixir.Repo

    %Event{}
    |> Event.changeset(room_params)
    |> Repo.insert()
    |> case do
      {:ok, event} ->
        conn
        |> put_flash(:info, "Event created successfully.")
        |> redirect(to: Routes.page_path(conn, :index))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end
end
