defmodule TdlElixir.Repo.Migrations.AddEventsAvailability do
  use Ecto.Migration

  def change do
    alter table("events") do
      add :availability, :integer, default: 100
    end
  end
end
