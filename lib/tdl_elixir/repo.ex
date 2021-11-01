defmodule TdlElixir.Repo do
  use Ecto.Repo,
    otp_app: :tdl_elixir,
    adapter: Ecto.Adapters.Postgres
end
