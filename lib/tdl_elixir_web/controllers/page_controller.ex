defmodule TdlElixirWeb.PageController do
  use TdlElixirWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
