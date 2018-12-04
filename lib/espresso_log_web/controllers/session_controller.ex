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

    case Guardian.decode_and_verify(TokenImpl, jwt) do
      {:ok, claims} ->
        case TokenImpl.resource_from_claims(claims) do
          {:ok, user} -> 
            conn
              |> put_status(:found)
              |> render("show.json", jwt: jwt, user: user)
          {:error, _error} ->
            conn
              |> put_status(:not_found)
              |> render("error.json")
        end
      {:error, _error} ->
        conn
          |> put_status(:unprocessable_entity)
          |> render("error.json")
    end
  end

  def unauthenticated(conn, _params) do 
    conn
    |> put_status(:forbidden)
    |> render(EspressoLogWeb.SessionView, "forbidden.json", error: "Not authenticated")
  end
end
