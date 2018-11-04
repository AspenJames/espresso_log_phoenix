defmodule EspressoLog.Coffees.Coffee do
  use Ecto.Schema
  import Ecto.Changeset


  schema "coffees" do
    field :name, :string

    belongs_to :cafe, EspressoLog.Accounts.Cafe

    timestamps()
  end

  @doc false
  def changeset(coffee, attrs) do
    coffee
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
