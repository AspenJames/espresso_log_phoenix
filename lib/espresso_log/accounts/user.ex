defmodule EspressoLog.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  import Comeonin.Bcrypt, only: [hashpwsalt: 1]

  @derive {Poison.Encoder, only: [:name, :id, :email]}
  schema "users" do
    field :email, :string
    field :name, :string
    field :password_hash, :string
    # Virtual fields:
    field :password, :string, virtual: true
    field :password_confirmation, :string, virtual: true

    has_many :espressos, EspressoLog.Coffees.Espresso
    many_to_many :cafes, EspressoLog.Accounts.Cafe, join_through: EspressoLog.Accounts.Cafe_user

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :email, :password, :password_confirmation])
    |> validate_required([:name, :email, :password, :password_confirmation])
    |> validate_format(:email, ~r/@/) # check valid email - update regex later
    |> validate_length(:password, min: 8) # check password length is > 8
    |> validate_confirmation(:password)
    |> unique_constraint(:email)
    |> put_pass_hash
  end

  defp put_pass_hash(changeset) do
    case changeset do
      %Ecto.Changeset{valid?: true, changes: %{password: pass}}
        -> 
          put_change(changeset, :password_hash, hashpwsalt(pass))
      _ -> 
          changeset
    end
  end
end
