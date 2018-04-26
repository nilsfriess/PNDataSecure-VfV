defmodule ReportWeb.Router do
  use ReportWeb, :router

  pipeline :browser do
    plug(:accepts, ["html"])
    plug(:fetch_session)
    plug(:fetch_flash)
    plug(:protect_from_forgery)
    plug(:put_secure_browser_headers)
  end

  pipeline :api do
    plug(:accepts, ["json"])
  end

  scope "/", ReportWeb do
    # Use the default browser stack
    pipe_through(:browser)

    get("/", PageController, :index)

    resources("/companies", CompanyController)
    resources("/employees", EmployeeController)
    resources("/records_of_activities", RecordOfActivitiesController)
    resources("/entries", EntryController)
  end

  # Other scopes may use custom stacks.
  # scope "/api", ReportWeb do
  #   pipe_through :api
  # end
end
