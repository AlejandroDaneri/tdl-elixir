defmodule TdlElixirWeb.EventController do
  use TdlElixirWeb, :controller
  alias TdlElixir.Event.Event
  alias TdlElixir.Repo
  require Enum

  def index(conn, _params) do
    events = Event.list_events()
    render(conn, "index.html", events: Enum.sort(events))
  end

  def show(conn, %{"id" => id}) do
    event = Repo.get!(Event, id)
    render(conn, "show.html", event: event)
  end

  def edit(conn, %{"id" => id}) do
    event = Repo.get!(Event, id)
    changeset = Event.change_event(event)
    render(conn, "edit.html", event: event, changeset: changeset)
  end

  def new(conn, _params) do
    changeset = Event.changeset(%Event{}, %{})
    render(conn, "new.html", changeset: changeset)
  end

  def update(conn, %{"id" => id, "event" => event_params}) do
    event = Repo.get!(Event, id)

    event
    |> Event.changeset(event_params)
    |> Repo.update()
    |> case do
      {:ok, event} ->
        conn
        |> put_flash(:info, "Event updated successfully.")
        |> redirect(to: Routes.event_path(conn, :show, event))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", event: event, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    event = Repo.get!(Event, id)
    {:ok, _event} = Repo.delete(event)

    conn
    |> put_flash(:info, "Event deleted successfully.")
    |> redirect(to: Routes.event_path(conn, :index))
  end

  def create(conn, %{"event" => event_params}) do
    %Event{}
    |> Event.changeset(event_params)
    |> Repo.insert()
    |> case do
      {:ok, _event} ->
        conn
        |> put_flash(:info, "Event created successfully.")
        |> redirect(to: Routes.event_path(conn, :index))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end
end
