defmodule ReportWeb.RecordOfActivitiesController do
  use ReportWeb, :controller

  alias Report.Record
  alias Report.Record.RecordOfActivities
  alias Report.Record.Entry

  def index(conn, _params) do
    records_of_activities = Record.list_records_of_activities()

    conn
    |> assign(:page_title, "Übersicht")
    |> render("index.html", records_of_activities: records_of_activities)
  end

  def new(conn, _params) do
    changeset = Record.change_entry(%Entry{})

    conn
    |> assign(:employees, Report.Administration.list_employees())
    |> render(
      "new.html",
      changeset: changeset,
      page_title: 'Neuen Eintrag erstellen'
    )
  end

  def create(conn, %{"record_of_activities" => record_of_activities_params}) do
    case Record.create_record_of_activities(record_of_activities_params) do
      {:ok, record_of_activities} ->
        conn
        |> put_flash(:info, "Record of activities created successfully.")

      # |> redirect(to: record_of_activities_path(conn, :show, record_of_activities))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    record_of_activities = Record.get_record_of_activities!(id)
    render(conn, "show.html", record_of_activities: record_of_activities)
  end

  def edit(conn, %{"id" => id}) do
    record_of_activities = Record.get_record_of_activities!(id)
    changeset = Record.change_record_of_activities(record_of_activities)
    render(conn, "edit.html", record_of_activities: record_of_activities, changeset: changeset)
  end

  def update(conn, %{"id" => id, "record_of_activities" => record_of_activities_params}) do
    record_of_activities = Record.get_record_of_activities!(id)

    case Record.update_record_of_activities(record_of_activities, record_of_activities_params) do
      {:ok, record_of_activities} ->
        conn
        |> put_flash(:info, "Record of activities updated successfully.")

      # |> redirect(to: record_of_activities_path(conn, :show, record_of_activities))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(
          conn,
          "edit.html",
          record_of_activities: record_of_activities,
          changeset: changeset
        )
    end
  end

  def delete(conn, %{"id" => id}) do
    record_of_activities = Record.get_record_of_activities!(id)
    {:ok, _record_of_activities} = Record.delete_record_of_activities(record_of_activities)

    conn
    |> put_flash(:info, "Record of activities deleted successfully.")

    # |> redirect(to: record_of_activities_path(conn, :index))
  end
end
