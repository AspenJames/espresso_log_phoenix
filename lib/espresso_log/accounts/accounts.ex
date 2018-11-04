defmodule EspressoLog.Accounts do
  @moduledoc """
  The Accounts context.
  """

  import Ecto.Query, warn: false
  alias EspressoLog.Repo

  alias EspressoLog.Accounts.User

  @doc """
  Returns the list of users.

  ## Examples

      iex> list_users()
      [%User{}, ...]

  """
  def list_users do
    Repo.all(User)
  end

  @doc """
  Gets a single user.

  Raises `Ecto.NoResultsError` if the User does not exist.

  ## Examples

      iex> get_user!(123)
      %User{}

      iex> get_user!(456)
      ** (Ecto.NoResultsError)

  """
  def get_user!(id), do: Repo.get!(User, id)

  @doc """
  Creates a user.

  ## Examples

      iex> create_user(%{field: value})
      {:ok, %User{}}

      iex> create_user(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_user(attrs \\ %{}) do
    %User{}
    |> User.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a user.

  ## Examples

      iex> update_user(user, %{field: new_value})
      {:ok, %User{}}

      iex> update_user(user, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_user(%User{} = user, attrs) do
    user
    |> User.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a User.

  ## Examples

      iex> delete_user(user)
      {:ok, %User{}}

      iex> delete_user(user)
      {:error, %Ecto.Changeset{}}

  """
  def delete_user(%User{} = user) do
    Repo.delete(user)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking user changes.

  ## Examples

      iex> change_user(user)
      %Ecto.Changeset{source: %User{}}

  """
  def change_user(%User{} = user) do
    User.changeset(user, %{})
  end

  alias EspressoLog.Accounts.Cafe

  @doc """
  Returns the list of cafes.

  ## Examples

      iex> list_cafes()
      [%Cafe{}, ...]

  """
  def list_cafes do
    Repo.all(Cafe)
  end

  @doc """
  Gets a single cafe.

  Raises `Ecto.NoResultsError` if the Cafe does not exist.

  ## Examples

      iex> get_cafe!(123)
      %Cafe{}

      iex> get_cafe!(456)
      ** (Ecto.NoResultsError)

  """
  def get_cafe!(id), do: Repo.get!(Cafe, id)

  @doc """
  Creates a cafe.

  ## Examples

      iex> create_cafe(%{field: value})
      {:ok, %Cafe{}}

      iex> create_cafe(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_cafe(attrs \\ %{}) do
    %Cafe{}
    |> Cafe.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a cafe.

  ## Examples

      iex> update_cafe(cafe, %{field: new_value})
      {:ok, %Cafe{}}

      iex> update_cafe(cafe, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_cafe(%Cafe{} = cafe, attrs) do
    cafe
    |> Cafe.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Cafe.

  ## Examples

      iex> delete_cafe(cafe)
      {:ok, %Cafe{}}

      iex> delete_cafe(cafe)
      {:error, %Ecto.Changeset{}}

  """
  def delete_cafe(%Cafe{} = cafe) do
    Repo.delete(cafe)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking cafe changes.

  ## Examples

      iex> change_cafe(cafe)
      %Ecto.Changeset{source: %Cafe{}}

  """
  def change_cafe(%Cafe{} = cafe) do
    Cafe.changeset(cafe, %{})
  end

  alias EspressoLog.Accounts.Cafe_user

  @doc """
  Returns the list of cafe_users.

  ## Examples

      iex> list_cafe_users()
      [%Cafe_user{}, ...]

  """
  def list_cafe_users do
    Repo.all(Cafe_user)
  end

  @doc """
  Gets a single cafe_user.

  Raises `Ecto.NoResultsError` if the Cafe user does not exist.

  ## Examples

      iex> get_cafe_user!(123)
      %Cafe_user{}

      iex> get_cafe_user!(456)
      ** (Ecto.NoResultsError)

  """
  def get_cafe_user!(id), do: Repo.get!(Cafe_user, id)

  @doc """
  Creates a cafe_user.

  ## Examples

      iex> create_cafe_user(%{field: value})
      {:ok, %Cafe_user{}}

      iex> create_cafe_user(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_cafe_user(attrs \\ %{}) do
    %Cafe_user{}
    |> Cafe_user.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a cafe_user.

  ## Examples

      iex> update_cafe_user(cafe_user, %{field: new_value})
      {:ok, %Cafe_user{}}

      iex> update_cafe_user(cafe_user, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_cafe_user(%Cafe_user{} = cafe_user, attrs) do
    cafe_user
    |> Cafe_user.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Cafe_user.

  ## Examples

      iex> delete_cafe_user(cafe_user)
      {:ok, %Cafe_user{}}

      iex> delete_cafe_user(cafe_user)
      {:error, %Ecto.Changeset{}}

  """
  def delete_cafe_user(%Cafe_user{} = cafe_user) do
    Repo.delete(cafe_user)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking cafe_user changes.

  ## Examples

      iex> change_cafe_user(cafe_user)
      %Ecto.Changeset{source: %Cafe_user{}}

  """
  def change_cafe_user(%Cafe_user{} = cafe_user) do
    Cafe_user.changeset(cafe_user, %{})
  end
end
