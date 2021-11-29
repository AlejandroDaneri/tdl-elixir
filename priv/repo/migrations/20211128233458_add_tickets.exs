defmodule TdlElixir.Repo.Migrations.AddTickets do
  use Ecto.Migration

  def change do
    create table(:tickets, primary_key: false) do
      add(:event_id, references(:events, on_delete: :delete_all), primary_key: true)
      add(:user_id, references(:users, on_delete: :delete_all), primary_key: true)

      timestamps()
    end

    create(
      unique_index(:tickets, [:event_id, :user_id], name: :event_id_user_id_unique_index)
    )
  end
end
