defmodule TdlElixir.Conversation do
  alias TdlElixir.Repo
  alias TdlElixir.Event.Event

  def list_events do
    Repo.all(Event)
  end
end
