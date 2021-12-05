defmodule TdlElixir.Repo.Migrations.UpdateUsersRole do
  use Ecto.Migration

  def change do
    execute "UPDATE users
    SET role = 'standard'
    WHERE role = 'user';"
  end
end
