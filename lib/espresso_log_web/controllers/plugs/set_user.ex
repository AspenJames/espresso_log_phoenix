defmodule EspressoLogWeb.Plugs.SetUser do
  import Plug.Conn
  import Phoenix.Controller

  alias EspressoLog.TokenImpl

  def init(_params) do
    
  end

  def call(%{req_headers: headers} = conn, _params) do
    {"jwt", jwt} = headers
      |> List.keyfind("jwt", 0)

    case Guardian.decode_and_verify(TokenImpl, jwt) do
      {:ok, claims} -> 
        case TokenImpl.resource_from_claims(claims) do
          {:ok, user} ->
            assign(conn, :user, user)
          {:error, _error} ->
            assign(conn, :user, nil)
        end
      {:error, _error} -> 
        assign(conn, :user, nil)
    end
  end
end