defmodule EspressoLogWeb.CoffeeController do
  use EspressoLogWeb, :controller

  alias EspressoLog.Coffees
  alias EspressoLog.Coffees.Coffee

  action_fallback EspressoLogWeb.FallbackController

  def index(conn, _params) do
    coffees = Coffees.list_coffees()
    render(conn, "index.json", coffees: coffees)
  end

  def create(conn, %{"coffee" => coffee_params}) do
    with {:ok, %Coffee{} = coffee} <- Coffees.create_coffee(coffee_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", cafe_coffee_path(conn, :show, coffee))
      |> render("show.json", coffee: coffee)
    end
  end

  def show(conn, %{"id" => id}) do
    coffee = Coffees.get_coffee!(id)
    render(conn, "show.json", coffee: coffee)
  end

  def update(conn, %{"id" => id, "coffee" => coffee_params}) do
    coffee = Coffees.get_coffee!(id)

    with {:ok, %Coffee{} = coffee} <- Coffees.update_coffee(coffee, coffee_params) do
      render(conn, "show.json", coffee: coffee)
    end
  end

  def delete(conn, %{"id" => id}) do
    coffee = Coffees.get_coffee!(id)
    with {:ok, %Coffee{}} <- Coffees.delete_coffee(coffee) do
      send_resp(conn, :no_content, "")
    end
  end
end
