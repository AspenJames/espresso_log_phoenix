defmodule EspressoLogWeb.CoffeeView do
  use EspressoLogWeb, :view
  alias EspressoLogWeb.CoffeeView

  def render("index.json", %{coffees: coffees}) do
    %{data: render_many(coffees, CoffeeView, "coffee.json")}
  end

  def render("show.json", %{coffee: coffee}) do
    %{data: render_one(coffee, CoffeeView, "coffee.json")}
  end

  def render("coffee.json", %{coffee: coffee}) do
    %{id: coffee.id,
      name: coffee.name}
  end
end
