defmodule EspressoLog.Coffees do
  @moduledoc """
  The Coffees context.
  """

  import Ecto.Query, warn: false
  alias EspressoLog.Repo

  alias EspressoLog.Coffees.Coffee

  @doc """
  Returns the list of coffees.

  ## Examples

      iex> list_coffees()
      [%Coffee{}, ...]

  """
  def list_coffees do
    Repo.all(Coffee)
  end

  @doc """
  Gets a single coffee.

  Raises `Ecto.NoResultsError` if the Coffee does not exist.

  ## Examples

      iex> get_coffee!(123)
      %Coffee{}

      iex> get_coffee!(456)
      ** (Ecto.NoResultsError)

  """
  def get_coffee!(id), do: Repo.get!(Coffee, id)

  @doc """
  Creates a coffee.

  ## Examples

      iex> create_coffee(%{field: value})
      {:ok, %Coffee{}}

      iex> create_coffee(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_coffee(attrs \\ %{}) do
    %Coffee{}
    |> Coffee.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a coffee.

  ## Examples

      iex> update_coffee(coffee, %{field: new_value})
      {:ok, %Coffee{}}

      iex> update_coffee(coffee, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_coffee(%Coffee{} = coffee, attrs) do
    coffee
    |> Coffee.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Coffee.

  ## Examples

      iex> delete_coffee(coffee)
      {:ok, %Coffee{}}

      iex> delete_coffee(coffee)
      {:error, %Ecto.Changeset{}}

  """
  def delete_coffee(%Coffee{} = coffee) do
    Repo.delete(coffee)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking coffee changes.

  ## Examples

      iex> change_coffee(coffee)
      %Ecto.Changeset{source: %Coffee{}}

  """
  def change_coffee(%Coffee{} = coffee) do
    Coffee.changeset(coffee, %{})
  end

  alias EspressoLog.Coffees.Espresso

  @doc """
  Returns the list of espressos.

  ## Examples

      iex> list_espressos()
      [%Espresso{}, ...]

  """
  def list_espressos do
    Repo.all(Espresso)
  end

  @doc """
  Gets a single espresso.

  Raises `Ecto.NoResultsError` if the Espresso does not exist.

  ## Examples

      iex> get_espresso!(123)
      %Espresso{}

      iex> get_espresso!(456)
      ** (Ecto.NoResultsError)

  """
  def get_espresso!(id), do: Repo.get!(Espresso, id)

  @doc """
  Creates a espresso.

  ## Examples

      iex> create_espresso(%{field: value})
      {:ok, %Espresso{}}

      iex> create_espresso(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_espresso(attrs \\ %{}) do
    %Espresso{}
    |> Espresso.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a espresso.

  ## Examples

      iex> update_espresso(espresso, %{field: new_value})
      {:ok, %Espresso{}}

      iex> update_espresso(espresso, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_espresso(%Espresso{} = espresso, attrs) do
    espresso
    |> Espresso.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Espresso.

  ## Examples

      iex> delete_espresso(espresso)
      {:ok, %Espresso{}}

      iex> delete_espresso(espresso)
      {:error, %Ecto.Changeset{}}

  """
  def delete_espresso(%Espresso{} = espresso) do
    Repo.delete(espresso)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking espresso changes.

  ## Examples

      iex> change_espresso(espresso)
      %Ecto.Changeset{source: %Espresso{}}

  """
  def change_espresso(%Espresso{} = espresso) do
    Espresso.changeset(espresso, %{})
  end
end
