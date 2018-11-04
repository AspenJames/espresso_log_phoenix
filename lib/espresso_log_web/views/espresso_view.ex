defmodule EspressoLogWeb.EspressoView do
  use EspressoLogWeb, :view
  alias EspressoLogWeb.EspressoView

  def render("index.json", %{espressos: espressos}) do
    %{data: render_many(espressos, EspressoView, "espresso.json")}
  end

  def render("show.json", %{espresso: espresso}) do
    %{data: render_one(espresso, EspressoView, "espresso.json")}
  end

  def render("espresso.json", %{espresso: espresso}) do
    %{id: espresso.id,
      dose: espresso.dose,
      yield: espresso.yield,
      time: espresso.time,
      notes: espresso.notes,
      coffee_id: espresso.coffee_id,
      user_id: espresso.user_id}
  end
end
