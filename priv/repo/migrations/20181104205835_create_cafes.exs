defmodule EspressoLog.Repo.Migrations.CreateCafes do
  use Ecto.Migration

  def change do
    create table(:cafes) do
      add :name, :string
      add :address, :string

      timestamps()
    end

    create unique_index(:cafes, [:name])
    create unique_index(:cafes, [:address])
  end
end
