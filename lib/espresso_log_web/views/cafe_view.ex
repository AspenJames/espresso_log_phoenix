defmodule EspressoLogWeb.CafeView do
  use EspressoLogWeb, :view
  alias EspressoLogWeb.CafeView

  def render("index.json", %{cafes: cafes}) do
    %{data: render_many(cafes, CafeView, "cafe.json")}
  end

  def render("show.json", %{cafe: cafe}) do
    %{data: render_one(cafe, CafeView, "cafe.json")}
  end

  def render("cafe.json", %{cafe: cafe}) do
    %{id: cafe.id,
      name: cafe.name,
      address: cafe.address}
  end

  def render("error.json", %{changeset: changeset}) do
    # When encoded, the changeset returns its errors
    # as a JSON object. So we just pass it forward.
    %{errors: translate_errors(changeset)}
  end

  def translate_errors(changeset) do
    Ecto.Changeset.traverse_errors(changeset, &translate_error/1)
  end
end
