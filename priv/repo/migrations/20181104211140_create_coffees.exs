defmodule EspressoLog.Repo.Migrations.CreateCoffees do
  use Ecto.Migration

  def change do
    create table(:coffees) do
      add :name, :string
      add :cafe_id, references(:cafes)

      timestamps()
    end

  end
end
