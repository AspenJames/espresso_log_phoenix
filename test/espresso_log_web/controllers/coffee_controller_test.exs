defmodule EspressoLogWeb.CoffeeControllerTest do
  use EspressoLogWeb.ConnCase

  alias EspressoLog.Coffees
  alias EspressoLog.Coffees.Coffee

  @create_attrs %{name: "some name"}
  @update_attrs %{name: "some updated name"}
  @invalid_attrs %{name: nil}

  def fixture(:coffee) do
    {:ok, coffee} = Coffees.create_coffee(@create_attrs)
    coffee
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all coffees", %{conn: conn} do
      conn = get conn, coffee_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create coffee" do
    test "renders coffee when data is valid", %{conn: conn} do
      conn = post conn, coffee_path(conn, :create), coffee: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, coffee_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "name" => "some name"}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, coffee_path(conn, :create), coffee: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update coffee" do
    setup [:create_coffee]

    test "renders coffee when data is valid", %{conn: conn, coffee: %Coffee{id: id} = coffee} do
      conn = put conn, coffee_path(conn, :update, coffee), coffee: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, coffee_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "name" => "some updated name"}
    end

    test "renders errors when data is invalid", %{conn: conn, coffee: coffee} do
      conn = put conn, coffee_path(conn, :update, coffee), coffee: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete coffee" do
    setup [:create_coffee]

    test "deletes chosen coffee", %{conn: conn, coffee: coffee} do
      conn = delete conn, coffee_path(conn, :delete, coffee)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, coffee_path(conn, :show, coffee)
      end
    end
  end

  defp create_coffee(_) do
    coffee = fixture(:coffee)
    {:ok, coffee: coffee}
  end
end
