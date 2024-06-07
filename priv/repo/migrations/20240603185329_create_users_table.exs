defmodule FoxBank.Repo.Migrations.CreateUsersTable do
  use Ecto.Migration

  def change do
    create table("tb_users") do
      add :name, :string
      add :password_hash, :string, null: false
      add :email, :string, null: false
      add :cep, :string, null: false

      timestamps()
    end
  end
end
