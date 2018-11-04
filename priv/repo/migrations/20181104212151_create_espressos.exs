defmodule EspressoLog.Repo.Migrations.CreateEspressos do
  use Ecto.Migration

  def change do
    create table(:espressos) do
      add :dose, :integer
      add :yield, :integer
      add :time, :integer
      add :notes, :string
      add :coffee_id, references(:coffees)
      add :user_id, references(:users)

      timestamps()
    end

  end
end
