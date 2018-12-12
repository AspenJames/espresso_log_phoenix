defmodule EspressoLog.Accounts.Cafe_user do
  use Ecto.Schema
  import Ecto.Changeset


  schema "cafe_users" do
    field :admin, :boolean, default: false
    field :approved, :boolean, default: false

    belongs_to :cafe, EspressoLog.Accounts.Cafe
    belongs_to :user, EspressoLog.Accounts.User

    timestamps()
  end

  @doc false
  def changeset(cafe_user, attrs) do
    cafe_user
    |> cast(attrs, [:user_id, :cafe_id, :admin, :approved])
    |> validate_required([:user_id, :cafe_id, :admin, :approved])
  end
end
