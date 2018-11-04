defmodule EspressoLogWeb.Cafe_userController do
  use EspressoLogWeb, :controller

  alias EspressoLog.Accounts
  alias EspressoLog.Accounts.Cafe_user

  action_fallback EspressoLogWeb.FallbackController

  def index(conn, _params) do
    cafe_users = Accounts.list_cafe_users()
    render(conn, "index.json", cafe_users: cafe_users)
  end

  def create(conn, %{"cafe_user" => cafe_user_params}) do
    with {:ok, %Cafe_user{} = cafe_user} <- Accounts.create_cafe_user(cafe_user_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", cafe_user_path(conn, :show, cafe_user))
      |> render("show.json", cafe_user: cafe_user)
    end
  end

  def show(conn, %{"id" => id}) do
    cafe_user = Accounts.get_cafe_user!(id)
    render(conn, "show.json", cafe_user: cafe_user)
  end

  def update(conn, %{"id" => id, "cafe_user" => cafe_user_params}) do
    cafe_user = Accounts.get_cafe_user!(id)

    with {:ok, %Cafe_user{} = cafe_user} <- Accounts.update_cafe_user(cafe_user, cafe_user_params) do
      render(conn, "show.json", cafe_user: cafe_user)
    end
  end

  def delete(conn, %{"id" => id}) do
    cafe_user = Accounts.get_cafe_user!(id)
    with {:ok, %Cafe_user{}} <- Accounts.delete_cafe_user(cafe_user) do
      send_resp(conn, :no_content, "")
    end
  end
end
