defmodule TdlElixirWeb.HomeController do
  use TdlElixirWeb, :controller
  alias TdlElixir.Event.Event
  alias TdlElixir.Repo
  require Enum

  def show(conn, %{"id" => id}) do
    event = Repo.get!(Event, id)
    render(conn, "show.html", event: event)
  end

  def index(conn, _params) do
    events = Event.list_events()
    render(conn, "index.html", events: Enum.sort(events))
  end
end
