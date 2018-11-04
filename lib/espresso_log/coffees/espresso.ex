defmodule EspressoLog.Coffees.Espresso do
  use Ecto.Schema
  import Ecto.Changeset


  schema "espressos" do
    field :dose, :integer
    field :notes, :string
    field :time, :integer
    field :yield, :integer

    belongs_to :coffee, EspressoLog.Coffees.Coffee
    belongs_to :user, EspressoLog.Accounts.User

    timestamps()
  end

  @doc false
  def changeset(espresso, attrs) do
    espresso
    |> cast(attrs, [:dose, :yield, :time, :notes, :coffee_id, :user_id])
    |> validate_required([:dose, :yield, :time, :coffee_id, :user_id])
  end
end
