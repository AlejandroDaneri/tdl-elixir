defmodule TdlElixirWeb.RoomController do
  use TdlElixirWeb, :controller
  alias TdlElixir.Room.Event
  alias TdlElixir.Repo

  def index(conn, _params) do
    rooms = TdlElixir.Conversation.list_rooms()
    render(conn, "index.html", rooms: rooms)
  end

  def show(conn, %{"id" => id}) do
    room = Repo.get!(Event, id)
    render(conn, "show.html", room: room)
  end

  def edit(conn, %{"id" => id}) do
    room = Repo.get!(Event, id)
    changeset = Event.change_room(room)
    render(conn, "edit.html", room: room, changeset: changeset)
  end

  def new(conn, _params) do
    changeset = Event.changeset(%Event{}, %{})
    render(conn, "new.html", changeset: changeset)
  end

  def update(conn, %{"id" => id, "event" => room_params}) do
    room = Repo.get!(Event, id)

    room
    |> Event.changeset(room_params)
    |> Repo.update()
    |> case do
      {:ok, room} ->
        conn
        |> put_flash(:info, "Room updated successfully.")
        |> redirect(to: Routes.room_path(conn, :show, room))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", room: room, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    room = Repo.get!(Event, id)
    {:ok, _room} = Repo.delete(room)

    conn
    |> put_flash(:info, "Room deleted successfully.")
    |> redirect(to: Routes.room_path(conn, :index))
  end

  def create(conn, %{"event" => room_params}) do
    %Event{}
    |> Event.changeset(room_params)
    |> Repo.insert()
    |> case do
      {:ok, _room} ->
        conn
        |> put_flash(:info, "Event created successfully.")
        |> redirect(to: Routes.room_path(conn, :index))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end
end
