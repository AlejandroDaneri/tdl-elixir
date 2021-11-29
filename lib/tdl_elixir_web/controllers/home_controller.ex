defmodule TdlElixirWeb.HomeController do
  use TdlElixirWeb, :controller
  alias TdlElixir.Event.Event
  alias TdlElixir.Repo

  def show(conn, %{"id" => id}) do
    event = Repo.get!(Event, id)
    render(conn, "show.html", event: event)
  end

  def index(conn, _params) do
    events = TdlElixir.Conversation.list_events()
    render(conn, "index.html", events: events)
  end
end