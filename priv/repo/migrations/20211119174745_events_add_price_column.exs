defmodule TdlElixir.Repo.Migrations.EventsAddPriceColumn do
  use Ecto.Migration

  def change do
    alter table("events") do
      add :price, :string
    end
  end
end
