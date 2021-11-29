defmodule TdlElixirWeb.UsersController do
  use TdlElixirWeb, :controller
  alias TdlElixir.Event.Event
  alias TdlElixir.Users.User
  alias TdlElixir.Repo
  require Logger

  def index(conn, _params) do
    current_user = Pow.Plug.current_user(conn)
    render(conn, "index.html", user: current_user)
  end

  def show(conn, _params) do
    current_user = Pow.Plug.current_user(conn)
    user= current_user
    |> Repo.preload(:tickets)
    |> Ecto.Changeset.cast(params, [])
    |> Ecto.Changeset.cast_assoc(:tickets)
    Logger.info(user)
    render(conn, "show.html", user: user)
  end

end