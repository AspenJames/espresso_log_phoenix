defmodule EspressoLogWeb.Cafe_userControllerTest do
  use EspressoLogWeb.ConnCase

  alias EspressoLog.Accounts
  alias EspressoLog.Accounts.Cafe_user

  @create_attrs %{cafe_id: 42, user_id: 42}
  @update_attrs %{cafe_id: 43, user_id: 43}
  @invalid_attrs %{cafe_id: nil, user_id: nil}

  def fixture(:cafe_user) do
    {:ok, cafe_user} = Accounts.create_cafe_user(@create_attrs)
    cafe_user
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all cafe_users", %{conn: conn} do
      conn = get conn, cafe_user_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create cafe_user" do
    test "renders cafe_user when data is valid", %{conn: conn} do
      conn = post conn, cafe_user_path(conn, :create), cafe_user: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, cafe_user_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "cafe_id" => 42,
        "user_id" => 42}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, cafe_user_path(conn, :create), cafe_user: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update cafe_user" do
    setup [:create_cafe_user]

    test "renders cafe_user when data is valid", %{conn: conn, cafe_user: %Cafe_user{id: id} = cafe_user} do
      conn = put conn, cafe_user_path(conn, :update, cafe_user), cafe_user: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, cafe_user_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "cafe_id" => 43,
        "user_id" => 43}
    end

    test "renders errors when data is invalid", %{conn: conn, cafe_user: cafe_user} do
      conn = put conn, cafe_user_path(conn, :update, cafe_user), cafe_user: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete cafe_user" do
    setup [:create_cafe_user]

    test "deletes chosen cafe_user", %{conn: conn, cafe_user: cafe_user} do
      conn = delete conn, cafe_user_path(conn, :delete, cafe_user)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, cafe_user_path(conn, :show, cafe_user)
      end
    end
  end

  defp create_cafe_user(_) do
    cafe_user = fixture(:cafe_user)
    {:ok, cafe_user: cafe_user}
  end
end
