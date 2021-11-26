defmodule TdlElixir.Repo.Migrations.EventsAddLocationColumn do
  use Ecto.Migration

  def change do
    alter table("events") do
      add :location, :string
    end
  end
end
