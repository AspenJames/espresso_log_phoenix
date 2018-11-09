defmodule EspressoLog.TokenImpl do
  use Guardian, otp_app: :espresso_log

  alias EspressoLog.Accounts.User

  def subject_for_token(%User{} = user, _claims) do
    {:ok, "User:#{user.id}"}
  end

  def subject_for_token(_, _), do: {:error, :unhandled_resource_type}
  
  def resource_from_claims(%{"sub" => "User:" <> id}) do
    case Repo.get_by(User, %{id: id}) do
      nil -> {:error, :user_not_found}
      user -> {:ok, user}
    end
  end

  def resource_from_claims(_), do: {:error, :unhandled_resource_type}
end