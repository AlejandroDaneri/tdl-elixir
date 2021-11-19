defmodule TdlElixir.Repo.Migrations.EventsAddDateColumn do
  use Ecto.Migration

  def change do
    alter table("events") do
      add :date, :string
    end
  end
end
