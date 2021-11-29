defmodule TdlElixir.Repo.Migrations.AddTicketsId do
  use Ecto.Migration

  def change do
    drop table("tickets")
    create table(:tickets) do
      add(:event_id, references(:events, on_delete: :delete_all))
      add(:user_id, references(:users, on_delete: :delete_all))

      timestamps()
    end
    create index(:tickets, [:event_id, :user_id], name: :event_id_user_id_index)
  end
end
