defmodule TdlElixir.Repo.Migrations.AddRolesUsers do
  use Ecto.Migration

  def change do
    alter table("users") do
      add :role, :string, null: false, default: "user"
    end
  end
end
