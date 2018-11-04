defmodule EspressoLog.Repo.Migrations.CreateCafeUsers do
  use Ecto.Migration

  def change do
    create table(:cafe_users) do
      add :user_id, references(:users)
      add :cafe_id, references(:cafes)
      add :admin, :boolean, default: false
      add :approved, :boolean, default: false

      timestamps()
    end

  end
end
