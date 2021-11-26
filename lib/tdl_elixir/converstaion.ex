defmodule TdlElixir.Conversation do
  alias TdlElixir.Repo
  alias TdlElixir.Room.Event

  def list_rooms do
    Repo.all(Event)
  end
end
