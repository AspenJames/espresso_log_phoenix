defmodule EspressoLogWeb.CafeController do
  use EspressoLogWeb, :controller

  alias EspressoLog.Accounts
  alias EspressoLog.Accounts.{Cafe, Cafe_user}
  alias EspressoLog.Repo

  action_fallback EspressoLogWeb.FallbackController

  def index(conn, _params) do
    cafes = Accounts.list_cafes()
    render(conn, "index.json", cafes: cafes)
  end

  def user_cafes(conn, %{"id" => id}) do
    user = Accounts.get_user!(id)
           |> Repo.preload(:cafes)
    render(conn, "index.json", cafes: user.cafes)
  end

  def create(conn, %{"cafe" => cafe_params}) do
    case %Cafe{}
      |> Cafe.changeset(cafe_params)
      |> Repo.insert() do
        {:ok, cafe} ->
          %Cafe_user{
            user_id: conn.assigns.user.id,
            cafe_id: cafe.id,
            admin: true,
            approved: true
          } |> Repo.insert!()

          conn
            |> put_status(:created)
            |> render("show.json", cafe: cafe)
        {:error, changeset} ->
          conn
            |> put_status(:unprocessable_entity)
            |> render("error.json", changeset: changeset)
    end
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
