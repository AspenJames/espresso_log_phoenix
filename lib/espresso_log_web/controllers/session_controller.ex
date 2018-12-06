defmodule EspressoLogWeb.SessionController do 
  use EspressoLogWeb, :controller 

  alias EspressoLog.Repo
  alias EspressoLog.Accounts.User
  alias EspressoLog.TokenImpl

  plug :scrub_params, "user" when action in [:create]

  def create(conn, %{"user" => session_params}) do 
    case EspressoLog.Session.authenticate(session_params) do 
      {:ok, user} ->
        {:ok, jwt, _full_claims} = user |> TokenImpl.encode_and_sign
        conn
          |> put_status(:created)
          |> render("show.json", jwt: jwt, user: user)
      :error ->
        conn
        |> put_status(:unprocessable_entity)
        |> render("error.json")
    end
  end

  def retrieve(%{req_headers: headers} = conn, _params) do
    {"jwt", jwt} = headers
      |> List.keyfind("jwt", 0)

    conn
      |> put_status(:found)
      |> render("show.json", jwt: jwt, user: conn.assigns.user)
  end

  def unauthenticated(conn, _params) do 
    conn
    |> put_status(:forbidden)
    |> render(EspressoLogWeb.SessionView, "forbidden.json", error: "Not authenticated")
  end
end
