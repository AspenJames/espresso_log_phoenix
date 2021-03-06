defmodule EspressoLog.Accounts.Cafe do
  use Ecto.Schema
  import Ecto.Changeset

  @derive {Poison.Encoder, only: [:name]}


  schema "cafes" do
    field :address, :string
    field :name, :string

    has_many :coffees, EspressoLog.Coffees.Coffee
    many_to_many :users, EspressoLog.Accounts.User, join_through: EspressoLog.Accounts.Cafe_user

    timestamps()
  end

  @doc false
  def changeset(cafe, attrs) do
    cafe
    |> cast(attrs, [:name, :address])
    |> validate_required([:name, :address])
    |> unique_constraint(:name)
    |> unique_constraint(:address)
  end
end
