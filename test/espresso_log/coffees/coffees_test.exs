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

  describe "espressos" do
    alias EspressoLog.Coffees.Espresso

    @valid_attrs %{coffee_id: 42, dose: 42, notes: "some notes", time: 42, user_id: 42, yield: 42}
    @update_attrs %{coffee_id: 43, dose: 43, notes: "some updated notes", time: 43, user_id: 43, yield: 43}
    @invalid_attrs %{coffee_id: nil, dose: nil, notes: nil, time: nil, user_id: nil, yield: nil}

    def espresso_fixture(attrs \\ %{}) do
      {:ok, espresso} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Coffees.create_espresso()

      espresso
    end

    test "list_espressos/0 returns all espressos" do
      espresso = espresso_fixture()
      assert Coffees.list_espressos() == [espresso]
    end

    test "get_espresso!/1 returns the espresso with given id" do
      espresso = espresso_fixture()
      assert Coffees.get_espresso!(espresso.id) == espresso
    end

    test "create_espresso/1 with valid data creates a espresso" do
      assert {:ok, %Espresso{} = espresso} = Coffees.create_espresso(@valid_attrs)
      assert espresso.coffee_id == 42
      assert espresso.dose == 42
      assert espresso.notes == "some notes"
      assert espresso.time == 42
      assert espresso.user_id == 42
      assert espresso.yield == 42
    end

    test "create_espresso/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Coffees.create_espresso(@invalid_attrs)
    end

    test "update_espresso/2 with valid data updates the espresso" do
      espresso = espresso_fixture()
      assert {:ok, espresso} = Coffees.update_espresso(espresso, @update_attrs)
      assert %Espresso{} = espresso
      assert espresso.coffee_id == 43
      assert espresso.dose == 43
      assert espresso.notes == "some updated notes"
      assert espresso.time == 43
      assert espresso.user_id == 43
      assert espresso.yield == 43
    end

    test "update_espresso/2 with invalid data returns error changeset" do
      espresso = espresso_fixture()
      assert {:error, %Ecto.Changeset{}} = Coffees.update_espresso(espresso, @invalid_attrs)
      assert espresso == Coffees.get_espresso!(espresso.id)
    end

    test "delete_espresso/1 deletes the espresso" do
      espresso = espresso_fixture()
      assert {:ok, %Espresso{}} = Coffees.delete_espresso(espresso)
      assert_raise Ecto.NoResultsError, fn -> Coffees.get_espresso!(espresso.id) end
    end

    test "change_espresso/1 returns a espresso changeset" do
      espresso = espresso_fixture()
      assert %Ecto.Changeset{} = Coffees.change_espresso(espresso)
    end
  end
end
