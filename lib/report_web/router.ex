defmodule ReportWeb.Router do
  use ReportWeb, :router

  pipeline :browser do
    plug(:accepts, ["html"])
    plug(:fetch_session)
    plug(:fetch_flash)
    plug(:protect_from_forgery)
    plug(:put_secure_browser_headers)
  end

  pipeline :auth do
    plug(Report.Auth.Pipeline)
    plug(Report.Auth.CurrentUser)
  end

  pipeline :ensure_auth do
    plug(Guardian.Plug.EnsureAuthenticated)
  end

  scope "/", ReportWeb do
    # Use the default browser stack
    pipe_through([:browser, :auth])

    get("/", SessionController, :index)
    post("/login", SessionController, :login)

    get("/logout", SessionController, :logout)
  end

  scope "/", ReportWeb do
    pipe_through([:browser, :auth, :ensure_auth])

    get("/overview", RecordOfActivitiesController, :index)
    get("/records", RecordOfActivitiesController, :list)
    post("/records", RecordOfActivitiesController, :create)
    get("/records/new", RecordOfActivitiesController, :new)
    get("/records/export", RecordOfActivitiesController, :export)

    get("/masterdata", RecordOfActivitiesController, :master_data)
  end
end
