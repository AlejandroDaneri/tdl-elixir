defmodule TdlElixirWeb.HomeController do
  use TdlElixirWeb, :controller
  alias TdlElixir.Room.Event
  alias TdlElixir.Repo

  def show(conn, %{"id" => id}) do
    room = Repo.get!(Event, id)
    render(conn, "show.html", room: room)
  end

  def index(conn, _params) do
    rooms = TdlElixir.Conversation.list_rooms()
    render(conn, "index.html", rooms: rooms)
  end
end