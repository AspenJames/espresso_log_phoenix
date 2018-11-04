defmodule EspressoLogWeb.Router do
  use EspressoLogWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api/v1", EspressoLogWeb do
    pipe_through :api

    resources "/users", UserController, except: [:index]
    resources "/cafes", CafeController do 
      resources "/coffees", CoffeeController
    end
  end
end
