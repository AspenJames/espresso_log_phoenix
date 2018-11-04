defmodule EspressoLogWeb.Cafe_userView do
  use EspressoLogWeb, :view
  alias EspressoLogWeb.Cafe_userView

  def render("index.json", %{cafe_users: cafe_users}) do
    %{data: render_many(cafe_users, Cafe_userView, "cafe_user.json")}
  end

  def render("show.json", %{cafe_user: cafe_user}) do
    %{data: render_one(cafe_user, Cafe_userView, "cafe_user.json")}
  end

  def render("cafe_user.json", %{cafe_user: cafe_user}) do
    %{id: cafe_user.id,
      user_id: cafe_user.user_id,
      cafe_id: cafe_user.cafe_id}
  end
end
