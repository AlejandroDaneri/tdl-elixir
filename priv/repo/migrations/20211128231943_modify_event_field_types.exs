defmodule TdlElixir.Repo.Migrations.ModifyEventFieldTypes do
  use Ecto.Migration

  def change do
    alter table("events") do
      remove :date
      add :date, :utc_datetime, default: fragment("now()")
      remove :price
      add :price, :float, default: 0
    end
  end
end
