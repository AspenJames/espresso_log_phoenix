defmodule EspressoLogWeb.EspressoControllerTest do
  use EspressoLogWeb.ConnCase

  alias EspressoLog.Coffees
  alias EspressoLog.Coffees.Espresso

  @create_attrs %{coffee_id: 42, dose: 42, notes: "some notes", time: 42, user_id: 42, yield: 42}
  @update_attrs %{coffee_id: 43, dose: 43, notes: "some updated notes", time: 43, user_id: 43, yield: 43}
  @invalid_attrs %{coffee_id: nil, dose: nil, notes: nil, time: nil, user_id: nil, yield: nil}

  def fixture(:espresso) do
    {:ok, espresso} = Coffees.create_espresso(@create_attrs)
    espresso
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all espressos", %{conn: conn} do
      conn = get conn, espresso_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create espresso" do
    test "renders espresso when data is valid", %{conn: conn} do
      conn = post conn, espresso_path(conn, :create), espresso: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, espresso_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "coffee_id" => 42,
        "dose" => 42,
        "notes" => "some notes",
        "time" => 42,
        "user_id" => 42,
        "yield" => 42}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, espresso_path(conn, :create), espresso: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update espresso" do
    setup [:create_espresso]

    test "renders espresso when data is valid", %{conn: conn, espresso: %Espresso{id: id} = espresso} do
      conn = put conn, espresso_path(conn, :update, espresso), espresso: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, espresso_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "coffee_id" => 43,
        "dose" => 43,
        "notes" => "some updated notes",
        "time" => 43,
        "user_id" => 43,
        "yield" => 43}
    end

    test "renders errors when data is invalid", %{conn: conn, espresso: espresso} do
      conn = put conn, espresso_path(conn, :update, espresso), espresso: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete espresso" do
    setup [:create_espresso]

    test "deletes chosen espresso", %{conn: conn, espresso: espresso} do
      conn = delete conn, espresso_path(conn, :delete, espresso)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, espresso_path(conn, :show, espresso)
      end
    end
  end

  defp create_espresso(_) do
    espresso = fixture(:espresso)
    {:ok, espresso: espresso}
  end
end
