defmodule EspressoLog.AccountsTest do
  use EspressoLog.DataCase

  alias EspressoLog.Accounts

  describe "users" do
    alias EspressoLog.Accounts.User

    @valid_attrs %{email: "some email", name: "some name", password_hash: "some password_hash"}
    @update_attrs %{email: "some updated email", name: "some updated name", password_hash: "some updated password_hash"}
    @invalid_attrs %{email: nil, name: nil, password_hash: nil}

    def user_fixture(attrs \\ %{}) do
      {:ok, user} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Accounts.create_user()

      user
    end

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert Accounts.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Accounts.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      assert {:ok, %User{} = user} = Accounts.create_user(@valid_attrs)
      assert user.email == "some email"
      assert user.name == "some name"
      assert user.password_hash == "some password_hash"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      assert {:ok, user} = Accounts.update_user(user, @update_attrs)
      assert %User{} = user
      assert user.email == "some updated email"
      assert user.name == "some updated name"
      assert user.password_hash == "some updated password_hash"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_user(user, @invalid_attrs)
      assert user == Accounts.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Accounts.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Accounts.change_user(user)
    end
  end

  describe "cafes" do
    alias EspressoLog.Accounts.Cafe

    @valid_attrs %{address: "some address", name: "some name"}
    @update_attrs %{address: "some updated address", name: "some updated name"}
    @invalid_attrs %{address: nil, name: nil}

    def cafe_fixture(attrs \\ %{}) do
      {:ok, cafe} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Accounts.create_cafe()

      cafe
    end

    test "list_cafes/0 returns all cafes" do
      cafe = cafe_fixture()
      assert Accounts.list_cafes() == [cafe]
    end

    test "get_cafe!/1 returns the cafe with given id" do
      cafe = cafe_fixture()
      assert Accounts.get_cafe!(cafe.id) == cafe
    end

    test "create_cafe/1 with valid data creates a cafe" do
      assert {:ok, %Cafe{} = cafe} = Accounts.create_cafe(@valid_attrs)
      assert cafe.address == "some address"
      assert cafe.name == "some name"
    end

    test "create_cafe/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_cafe(@invalid_attrs)
    end

    test "update_cafe/2 with valid data updates the cafe" do
      cafe = cafe_fixture()
      assert {:ok, cafe} = Accounts.update_cafe(cafe, @update_attrs)
      assert %Cafe{} = cafe
      assert cafe.address == "some updated address"
      assert cafe.name == "some updated name"
    end

    test "update_cafe/2 with invalid data returns error changeset" do
      cafe = cafe_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_cafe(cafe, @invalid_attrs)
      assert cafe == Accounts.get_cafe!(cafe.id)
    end

    test "delete_cafe/1 deletes the cafe" do
      cafe = cafe_fixture()
      assert {:ok, %Cafe{}} = Accounts.delete_cafe(cafe)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_cafe!(cafe.id) end
    end

    test "change_cafe/1 returns a cafe changeset" do
      cafe = cafe_fixture()
      assert %Ecto.Changeset{} = Accounts.change_cafe(cafe)
    end
  end

  describe "cafe_users" do
    alias EspressoLog.Accounts.Cafe_user

    @valid_attrs %{cafe_id: 42, user_id: 42}
    @update_attrs %{cafe_id: 43, user_id: 43}
    @invalid_attrs %{cafe_id: nil, user_id: nil}

    def cafe_user_fixture(attrs \\ %{}) do
      {:ok, cafe_user} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Accounts.create_cafe_user()

      cafe_user
    end

    test "list_cafe_users/0 returns all cafe_users" do
      cafe_user = cafe_user_fixture()
      assert Accounts.list_cafe_users() == [cafe_user]
    end

    test "get_cafe_user!/1 returns the cafe_user with given id" do
      cafe_user = cafe_user_fixture()
      assert Accounts.get_cafe_user!(cafe_user.id) == cafe_user
    end

    test "create_cafe_user/1 with valid data creates a cafe_user" do
      assert {:ok, %Cafe_user{} = cafe_user} = Accounts.create_cafe_user(@valid_attrs)
      assert cafe_user.cafe_id == 42
      assert cafe_user.user_id == 42
    end

    test "create_cafe_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_cafe_user(@invalid_attrs)
    end

    test "update_cafe_user/2 with valid data updates the cafe_user" do
      cafe_user = cafe_user_fixture()
      assert {:ok, cafe_user} = Accounts.update_cafe_user(cafe_user, @update_attrs)
      assert %Cafe_user{} = cafe_user
      assert cafe_user.cafe_id == 43
      assert cafe_user.user_id == 43
    end

    test "update_cafe_user/2 with invalid data returns error changeset" do
      cafe_user = cafe_user_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_cafe_user(cafe_user, @invalid_attrs)
      assert cafe_user == Accounts.get_cafe_user!(cafe_user.id)
    end

    test "delete_cafe_user/1 deletes the cafe_user" do
      cafe_user = cafe_user_fixture()
      assert {:ok, %Cafe_user{}} = Accounts.delete_cafe_user(cafe_user)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_cafe_user!(cafe_user.id) end
    end

    test "change_cafe_user/1 returns a cafe_user changeset" do
      cafe_user = cafe_user_fixture()
      assert %Ecto.Changeset{} = Accounts.change_cafe_user(cafe_user)
    end
  end
end
