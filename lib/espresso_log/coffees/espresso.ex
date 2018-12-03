defmodule EspressoLog.Coffees.Espresso do
  use Ecto.Schema
  import Ecto.Changeset

  @derive {Poison.Encoder, only: [
    :dose, :notes, :time, :yield, :days_off_roast
    ]}


  schema "espressos" do
    field :dose, :integer
    field :notes, :string
    field :time, :integer
    field :yield, :integer
    field :days_off_roast, :integer

    belongs_to :coffee, EspressoLog.Coffees.Coffee
    belongs_to :user, EspressoLog.Accounts.User

    timestamps()
  end

  @doc false
  def changeset(espresso, attrs) do
    espresso
    |> cast(attrs, [:dose, :yield, :time, :notes, :days_off_roast, :coffee_id, :user_id])
    |> validate_required([:dose, :yield, :time, :days_off_roast, :coffee_id, :user_id])
  end
end
