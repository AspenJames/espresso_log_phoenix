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
    plug EspressoLogWeb.Plugs.SetUser
  end

  scope "/api/v1", EspressoLogWeb do
    pipe_through :api

    post "/login", SessionController, :create 
    post "/session_retrieve", SessionController, :retrieve

    resources "/users", UserController, except: [:index]
    resources "/cafes", CafeController do 
      resources "/coffees", CoffeeController do 
        resources "/espressos", EspressoController
      end
    end

    get "/users/:id/cafes", CafeController, :user_cafes
    get "/users/:id/cafe_users", Cafe_userController, :cafe_users

    resources "/cafe_users", Cafe_userController
  end
end
