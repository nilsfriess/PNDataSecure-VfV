defmodule ReportWeb.RecordOfActivitiesControllerTest do
  use ReportWeb.ConnCase

  alias Report.Record

  @create_attrs %{last_edit_date: ~D[2010-04-17]}
  @update_attrs %{last_edit_date: ~D[2011-05-18]}
  @invalid_attrs %{last_edit_date: nil}

  def fixture(:record_of_activities) do
    {:ok, record_of_activities} = Record.create_record_of_activities(@create_attrs)
    record_of_activities
  end

  describe "index" do
    test "lists all records_of_activities", %{conn: conn} do
      conn = get conn, record_of_activities_path(conn, :index)
      assert html_response(conn, 200) =~ "Listing Records of activities"
    end
  end

  describe "new record_of_activities" do
    test "renders form", %{conn: conn} do
      conn = get conn, record_of_activities_path(conn, :new)
      assert html_response(conn, 200) =~ "New Record of activities"
    end
  end

  describe "create record_of_activities" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post conn, record_of_activities_path(conn, :create), record_of_activities: @create_attrs

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == record_of_activities_path(conn, :show, id)

      conn = get conn, record_of_activities_path(conn, :show, id)
      assert html_response(conn, 200) =~ "Show Record of activities"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, record_of_activities_path(conn, :create), record_of_activities: @invalid_attrs
      assert html_response(conn, 200) =~ "New Record of activities"
    end
  end

  describe "edit record_of_activities" do
    setup [:create_record_of_activities]

    test "renders form for editing chosen record_of_activities", %{conn: conn, record_of_activities: record_of_activities} do
      conn = get conn, record_of_activities_path(conn, :edit, record_of_activities)
      assert html_response(conn, 200) =~ "Edit Record of activities"
    end
  end

  describe "update record_of_activities" do
    setup [:create_record_of_activities]

    test "redirects when data is valid", %{conn: conn, record_of_activities: record_of_activities} do
      conn = put conn, record_of_activities_path(conn, :update, record_of_activities), record_of_activities: @update_attrs
      assert redirected_to(conn) == record_of_activities_path(conn, :show, record_of_activities)

      conn = get conn, record_of_activities_path(conn, :show, record_of_activities)
      assert html_response(conn, 200)
    end

    test "renders errors when data is invalid", %{conn: conn, record_of_activities: record_of_activities} do
      conn = put conn, record_of_activities_path(conn, :update, record_of_activities), record_of_activities: @invalid_attrs
      assert html_response(conn, 200) =~ "Edit Record of activities"
    end
  end

  describe "delete record_of_activities" do
    setup [:create_record_of_activities]

    test "deletes chosen record_of_activities", %{conn: conn, record_of_activities: record_of_activities} do
      conn = delete conn, record_of_activities_path(conn, :delete, record_of_activities)
      assert redirected_to(conn) == record_of_activities_path(conn, :index)
      assert_error_sent 404, fn ->
        get conn, record_of_activities_path(conn, :show, record_of_activities)
      end
    end
  end

  defp create_record_of_activities(_) do
    record_of_activities = fixture(:record_of_activities)
    {:ok, record_of_activities: record_of_activities}
  end
end
