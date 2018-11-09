defmodule EspressoLogWeb.SessionView do 
  use EspressoLogWeb, :view

  def render("show.json", %{jwt: jwt, user: user}) do
    %{
      data: %{
        jwt: jwt,
        user: user
      }
    }
  end

  def render("error.json", _) do
    %{error: "Invalid email or password"}
  end

  def render("forbidden.json", %{error: error}) do
    %{
      data: %{
        error: error
      }
    }
  end
end