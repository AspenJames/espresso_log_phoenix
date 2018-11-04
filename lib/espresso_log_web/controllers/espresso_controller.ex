defmodule EspressoLogWeb.EspressoController do
  use EspressoLogWeb, :controller

  alias EspressoLog.Coffees
  alias EspressoLog.Coffees.Espresso

  action_fallback EspressoLogWeb.FallbackController

  def index(conn, _params) do
    espressos = Coffees.list_espressos()
    render(conn, "index.json", espressos: espressos)
  end

  # def create(conn, %{"espresso" => espresso_params}) do
  #   with {:ok, %Espresso{} = espresso} <- Coffees.create_espresso(espresso_params) do
  #     conn
  #     |> put_status(:created)
  #     |> put_resp_header("location", cafe_coffee_espresso_path(conn, :show, espresso))
  #     |> render("show.json", espresso: espresso)
  #   end
  # end

  def show(conn, %{"id" => id}) do
    espresso = Coffees.get_espresso!(id)
    render(conn, "show.json", espresso: espresso)
  end

  def update(conn, %{"id" => id, "espresso" => espresso_params}) do
    espresso = Coffees.get_espresso!(id)

    with {:ok, %Espresso{} = espresso} <- Coffees.update_espresso(espresso, espresso_params) do
      render(conn, "show.json", espresso: espresso)
    end
  end

  def delete(conn, %{"id" => id}) do
    espresso = Coffees.get_espresso!(id)
    with {:ok, %Espresso{}} <- Coffees.delete_espresso(espresso) do
      send_resp(conn, :no_content, "")
    end
  end
end
