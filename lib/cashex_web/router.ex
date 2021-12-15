defmodule CashexWeb.Router do
  use CashexWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", CashexWeb do
    pipe_through :api

    get "/rule/search", RuleController, :search
    resources "/rule", RuleController, only: [:show, :create, :delete, :update]

    get "/transaction/history/:cpf", TransactionController, :history
    resources "/transaction", TransactionController, only: [:show, :create]

    # get "/user/:id", UserController, :show
    # get "/user/spend", UserController, :spend
  end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through [:fetch_session, :protect_from_forgery]
      live_dashboard "/dashboard", metrics: CashexWeb.Telemetry
    end
  end
end
