defmodule EspressoLogWeb.PageController do
  use EspressoLogWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
