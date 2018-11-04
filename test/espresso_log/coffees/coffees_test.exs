defmodule EspressoLog.CoffeesTest do
  use EspressoLog.DataCase

  alias EspressoLog.Coffees

  describe "coffees" do
    alias EspressoLog.Coffees.Coffee

    @valid_attrs %{name: "some name"}
    @update_attrs %{name: "some updated name"}
    @invalid_attrs %{name: nil}

    def coffee_fixture(attrs \\ %{}) do
      {:ok, coffee} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Coffees.create_coffee()

      coffee
    end

    test "list_coffees/0 returns all coffees" do
      coffee = coffee_fixture()
      assert Coffees.list_coffees() == [coffee]
    end

    test "get_coffee!/1 returns the coffee with given id" do
      coffee = coffee_fixture()
      assert Coffees.get_coffee!(coffee.id) == coffee
    end

    test "create_coffee/1 with valid data creates a coffee" do
      assert {:ok, %Coffee{} = coffee} = Coffees.create_coffee(@valid_attrs)
      assert coffee.name == "some name"
    end

    test "create_coffee/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Coffees.create_coffee(@invalid_attrs)
    end

    test "update_coffee/2 with valid data updates the coffee" do
      coffee = coffee_fixture()
      assert {:ok, coffee} = Coffees.update_coffee(coffee, @update_attrs)
      assert %Coffee{} = coffee
      assert coffee.name == "some updated name"
    end

    test "update_coffee/2 with invalid data returns error changeset" do
      coffee = coffee_fixture()
      assert {:error, %Ecto.Changeset{}} = Coffees.update_coffee(coffee, @invalid_attrs)
      assert coffee == Coffees.get_coffee!(coffee.id)
    end

    test "delete_coffee/1 deletes the coffee" do
      coffee = coffee_fixture()
      assert {:ok, %Coffee{}} = Coffees.delete_coffee(coffee)
      assert_raise Ecto.NoResultsError, fn -> Coffees.get_coffee!(coffee.id) end
    end

    test "change_coffee/1 returns a coffee changeset" do
      coffee = coffee_fixture()
      assert %Ecto.Changeset{} = Coffees.change_coffee(coffee)
    end
  end
end
