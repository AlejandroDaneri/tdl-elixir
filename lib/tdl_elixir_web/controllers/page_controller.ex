defmodule TdlElixirWeb.PageController do
  use TdlElixirWeb, :controller

  def index(conn, _params) do
    rooms = TdlElixir.Conversation.list_rooms()
    render(conn, "index.html", rooms: rooms)
  end
end
