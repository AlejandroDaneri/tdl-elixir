defmodule TdlElixir.Repo.Migrations.DefaultAdmin do
  use Ecto.Migration

  def change do
    execute "INSERT INTO users (inserted_at, updated_at, email,password_hash,role) VALUES ('2021-11-28 15:02:12','2021-11-28 15:02:12', 'super@admin.com','$pbkdf2-sha512$100000$yEZe9SkB9Ep3qIdGWjWbew==$g4sEDzDlnkdnxnt4J3dywzzqU/0+L2kYlGgI7xjvCkAYdeqzFjs9ltS7cl+Qr5WRVMbpsjLQZdZxddDpfhHnfw==','admin');"
    #pwd root123456789
  end
end
