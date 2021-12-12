defmodule TdlElixir.Repo.Migrations.CastPrice do
  use Ecto.Migration

  def change do
    alter table("events") do
      remove :price
      add :price, :integer, default: 0
    end
  end
end
