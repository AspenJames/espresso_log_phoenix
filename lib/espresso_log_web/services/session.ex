defmodule EspressoLog.Session do 
  alias EspressoLog.Repo
  alias EspressoLog.Accounts.User

  def authenticate(%{"email" => e, "password" => p}) do 
    case EspressoLog.Accounts.get_user_by_email(e) do 
      nil ->
        :error
      user ->
        case verify_password(p, user.password_hash) do 
          true ->
            {:ok, user}
          _ ->
            :error
        end
    end
  end

  defp verify_password(password, pw_hash) do 
    Comeonin.Bcrypt.checkpw(password, pw_hash)
  end
end