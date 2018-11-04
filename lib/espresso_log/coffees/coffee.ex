defmodule EspressoLog.Coffees.Coffee do
  use Ecto.Schema
  import Ecto.Changeset


  schema "coffees" do
    field :name, :string

    belongs_to :cafe, EspressoLog.Accounts.Cafe
    has_many :espressos, EspressoLog.Coffees.Espresso

    timestamps()
  end

  @doc false
  def changeset(coffee, attrs) do
    coffee
    |> cast(attrs, [:name, :cafe_id])
    |> validate_required([:name, :cafe_id])
  end
end
