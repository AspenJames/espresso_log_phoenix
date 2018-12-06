defmodule EspressoLogWeb.CafeController do
  use EspressoLogWeb, :controller

  alias EspressoLog.Accounts
  alias EspressoLog.Accounts.Cafe

  action_fallback EspressoLogWeb.FallbackController

  def index(conn, _params) do
    cafes = Accounts.list_cafes()
    render(conn, "index.json", cafes: cafes)
  end

  def create(conn, %{"cafe" => cafe_params}) do
    cafe = %Cafe{}
      |> Cafe.changeset(cafe_params)
      |> Repo.insert()

    IO.inspect cafe
    # with {:ok, %Cafe{} = cafe} <- Accounts.create_cafe(cafe_params) do
    #   conn
    #   |> put_status(:created)
    #   |> put_resp_header("location", cafe_path(conn, :show, cafe))
    #   |> render("show.json", cafe: cafe)
    # end
  end

  def show(conn, %{"id" => id}) do
    cafe = Accounts.get_cafe!(id)
    render(conn, "show.json", cafe: cafe)
  end

  def update(conn, %{"id" => id, "cafe" => cafe_params}) do
    cafe = Accounts.get_cafe!(id)

    with {:ok, %Cafe{} = cafe} <- Accounts.update_cafe(cafe, cafe_params) do
      render(conn, "show.json", cafe: cafe)
    end
  end

  def delete(conn, %{"id" => id}) do
    cafe = Accounts.get_cafe!(id)
    with {:ok, %Cafe{}} <- Accounts.delete_cafe(cafe) do
      send_resp(conn, :no_content, "")
    end
  end
end
