defmodule EspressoLogWeb.CafeControllerTest do
  use EspressoLogWeb.ConnCase

  alias EspressoLog.Accounts
  alias EspressoLog.Accounts.Cafe

  @create_attrs %{address: "some address", name: "some name"}
  @update_attrs %{address: "some updated address", name: "some updated name"}
  @invalid_attrs %{address: nil, name: nil}

  def fixture(:cafe) do
    {:ok, cafe} = Accounts.create_cafe(@create_attrs)
    cafe
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all cafes", %{conn: conn} do
      conn = get conn, cafe_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create cafe" do
    test "renders cafe when data is valid", %{conn: conn} do
      conn = post conn, cafe_path(conn, :create), cafe: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, cafe_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "address" => "some address",
        "name" => "some name"}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, cafe_path(conn, :create), cafe: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update cafe" do
    setup [:create_cafe]

    test "renders cafe when data is valid", %{conn: conn, cafe: %Cafe{id: id} = cafe} do
      conn = put conn, cafe_path(conn, :update, cafe), cafe: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, cafe_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "address" => "some updated address",
        "name" => "some updated name"}
    end

    test "renders errors when data is invalid", %{conn: conn, cafe: cafe} do
      conn = put conn, cafe_path(conn, :update, cafe), cafe: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete cafe" do
    setup [:create_cafe]

    test "deletes chosen cafe", %{conn: conn, cafe: cafe} do
      conn = delete conn, cafe_path(conn, :delete, cafe)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, cafe_path(conn, :show, cafe)
      end
    end
  end

  defp create_cafe(_) do
    cafe = fixture(:cafe)
    {:ok, cafe: cafe}
  end
end
