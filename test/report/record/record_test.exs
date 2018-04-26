defmodule Report.RecordTest do
  use Report.DataCase

  alias Report.Record

  describe "records_of_activities" do
    alias Report.Record.RecordOfActivities

    @valid_attrs %{last_edit_date: ~D[2010-04-17]}
    @update_attrs %{last_edit_date: ~D[2011-05-18]}
    @invalid_attrs %{last_edit_date: nil}

    def record_of_activities_fixture(attrs \\ %{}) do
      {:ok, record_of_activities} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Record.create_record_of_activities()

      record_of_activities
    end

    test "list_records_of_activities/0 returns all records_of_activities" do
      record_of_activities = record_of_activities_fixture()
      assert Record.list_records_of_activities() == [record_of_activities]
    end

    test "get_record_of_activities!/1 returns the record_of_activities with given id" do
      record_of_activities = record_of_activities_fixture()
      assert Record.get_record_of_activities!(record_of_activities.id) == record_of_activities
    end

    test "create_record_of_activities/1 with valid data creates a record_of_activities" do
      assert {:ok, %RecordOfActivities{} = record_of_activities} = Record.create_record_of_activities(@valid_attrs)
      assert record_of_activities.last_edit_date == ~D[2010-04-17]
    end

    test "create_record_of_activities/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Record.create_record_of_activities(@invalid_attrs)
    end

    test "update_record_of_activities/2 with valid data updates the record_of_activities" do
      record_of_activities = record_of_activities_fixture()
      assert {:ok, record_of_activities} = Record.update_record_of_activities(record_of_activities, @update_attrs)
      assert %RecordOfActivities{} = record_of_activities
      assert record_of_activities.last_edit_date == ~D[2011-05-18]
    end

    test "update_record_of_activities/2 with invalid data returns error changeset" do
      record_of_activities = record_of_activities_fixture()
      assert {:error, %Ecto.Changeset{}} = Record.update_record_of_activities(record_of_activities, @invalid_attrs)
      assert record_of_activities == Record.get_record_of_activities!(record_of_activities.id)
    end

    test "delete_record_of_activities/1 deletes the record_of_activities" do
      record_of_activities = record_of_activities_fixture()
      assert {:ok, %RecordOfActivities{}} = Record.delete_record_of_activities(record_of_activities)
      assert_raise Ecto.NoResultsError, fn -> Record.get_record_of_activities!(record_of_activities.id) end
    end

    test "change_record_of_activities/1 returns a record_of_activities changeset" do
      record_of_activities = record_of_activities_fixture()
      assert %Ecto.Changeset{} = Record.change_record_of_activities(record_of_activities)
    end
  end

  describe "entries" do
    alias Report.Record.Entry

    @valid_attrs %{categories: "some categories", delete_deadline: "some delete_deadline", department: "some department", legality: "some legality", origin: "some origin", purpose: "some purpose", receiver: "some receiver", sensitive_categories: "some sensitive_categories", serial_number: 42, title: "some title", type: "some type"}
    @update_attrs %{categories: "some updated categories", delete_deadline: "some updated delete_deadline", department: "some updated department", legality: "some updated legality", origin: "some updated origin", purpose: "some updated purpose", receiver: "some updated receiver", sensitive_categories: "some updated sensitive_categories", serial_number: 43, title: "some updated title", type: "some updated type"}
    @invalid_attrs %{categories: nil, delete_deadline: nil, department: nil, legality: nil, origin: nil, purpose: nil, receiver: nil, sensitive_categories: nil, serial_number: nil, title: nil, type: nil}

    def entry_fixture(attrs \\ %{}) do
      {:ok, entry} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Record.create_entry()

      entry
    end

    test "list_entries/0 returns all entries" do
      entry = entry_fixture()
      assert Record.list_entries() == [entry]
    end

    test "get_entry!/1 returns the entry with given id" do
      entry = entry_fixture()
      assert Record.get_entry!(entry.id) == entry
    end

    test "create_entry/1 with valid data creates a entry" do
      assert {:ok, %Entry{} = entry} = Record.create_entry(@valid_attrs)
      assert entry.categories == "some categories"
      assert entry.delete_deadline == "some delete_deadline"
      assert entry.department == "some department"
      assert entry.legality == "some legality"
      assert entry.origin == "some origin"
      assert entry.purpose == "some purpose"
      assert entry.receiver == "some receiver"
      assert entry.sensitive_categories == "some sensitive_categories"
      assert entry.serial_number == 42
      assert entry.title == "some title"
      assert entry.type == "some type"
    end

    test "create_entry/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Record.create_entry(@invalid_attrs)
    end

    test "update_entry/2 with valid data updates the entry" do
      entry = entry_fixture()
      assert {:ok, entry} = Record.update_entry(entry, @update_attrs)
      assert %Entry{} = entry
      assert entry.categories == "some updated categories"
      assert entry.delete_deadline == "some updated delete_deadline"
      assert entry.department == "some updated department"
      assert entry.legality == "some updated legality"
      assert entry.origin == "some updated origin"
      assert entry.purpose == "some updated purpose"
      assert entry.receiver == "some updated receiver"
      assert entry.sensitive_categories == "some updated sensitive_categories"
      assert entry.serial_number == 43
      assert entry.title == "some updated title"
      assert entry.type == "some updated type"
    end

    test "update_entry/2 with invalid data returns error changeset" do
      entry = entry_fixture()
      assert {:error, %Ecto.Changeset{}} = Record.update_entry(entry, @invalid_attrs)
      assert entry == Record.get_entry!(entry.id)
    end

    test "delete_entry/1 deletes the entry" do
      entry = entry_fixture()
      assert {:ok, %Entry{}} = Record.delete_entry(entry)
      assert_raise Ecto.NoResultsError, fn -> Record.get_entry!(entry.id) end
    end

    test "change_entry/1 returns a entry changeset" do
      entry = entry_fixture()
      assert %Ecto.Changeset{} = Record.change_entry(entry)
    end
  end
end
