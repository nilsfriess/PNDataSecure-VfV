defmodule Report.Record do
  @moduledoc """
  The Record context.
  """

  import Ecto.Query, warn: false
  alias Report.Repo

  alias Report.Record.RecordOfActivities

  @doc """
  Returns the list of records_of_activities.

  ## Examples

      iex> list_records_of_activities()
      [%RecordOfActivities{}, ...]

  """
  def list_records_of_activities do
    Repo.all(RecordOfActivities)
  end

  @doc """
  Gets a single record_of_activities.

  Raises `Ecto.NoResultsError` if the Record of activities does not exist.

  ## Examples

      iex> get_record_of_activities!(123)
      %RecordOfActivities{}

      iex> get_record_of_activities!(456)
      ** (Ecto.NoResultsError)

  """
  def get_record_of_activities!(id), do: Repo.get!(RecordOfActivities, id)

  @doc """
  Creates a record_of_activities.

  ## Examples

      iex> create_record_of_activities(%{field: value})
      {:ok, %RecordOfActivities{}}

      iex> create_record_of_activities(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_record_of_activities(attrs \\ %{}) do
    %RecordOfActivities{}
    |> RecordOfActivities.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a record_of_activities.

  ## Examples

      iex> update_record_of_activities(record_of_activities, %{field: new_value})
      {:ok, %RecordOfActivities{}}

      iex> update_record_of_activities(record_of_activities, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_record_of_activities(%RecordOfActivities{} = record_of_activities, attrs) do
    record_of_activities
    |> RecordOfActivities.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a RecordOfActivities.

  ## Examples

      iex> delete_record_of_activities(record_of_activities)
      {:ok, %RecordOfActivities{}}

      iex> delete_record_of_activities(record_of_activities)
      {:error, %Ecto.Changeset{}}

  """
  def delete_record_of_activities(%RecordOfActivities{} = record_of_activities) do
    Repo.delete(record_of_activities)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking record_of_activities changes.

  ## Examples

      iex> change_record_of_activities(record_of_activities)
      %Ecto.Changeset{source: %RecordOfActivities{}}

  """
  def change_record_of_activities(%RecordOfActivities{} = record_of_activities) do
    RecordOfActivities.changeset(record_of_activities, %{})
  end

  alias Report.Record.Entry

  @doc """
  Returns the list of entries.

  ## Examples

      iex> list_entries()
      [%Entry{}, ...]

  """
  def list_entries(%RecordOfActivities{} = record) do
    Repo.all(Ecto.assoc(record, :entries))
  end

  @doc """
  Gets a single entry.

  Raises `Ecto.NoResultsError` if the Entry does not exist.

  ## Examples

      iex> get_entry!(123)
      %Entry{}

      iex> get_entry!(456)
      ** (Ecto.NoResultsError)

  """
  def get_entry!(id), do: Repo.get!(Entry, id)

  @doc """
  Creates a entry.

  ## Examples

      iex> create_entry(%{field: value})
      {:ok, %Entry{}}

      iex> create_entry(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_entry(attrs \\ %{}) do
    %Entry{}
    |> Entry.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a entry.

  ## Examples

      iex> update_entry(entry, %{field: new_value})
      {:ok, %Entry{}}

      iex> update_entry(entry, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_entry(%Entry{} = entry, attrs) do
    entry
    |> Entry.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Entry.

  ## Examples

      iex> delete_entry(entry)
      {:ok, %Entry{}}

      iex> delete_entry(entry)
      {:error, %Ecto.Changeset{}}

  """
  def delete_entry(%Entry{} = entry) do
    Repo.delete(entry)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking entry changes.

  ## Examples

      iex> change_entry(entry)
      %Ecto.Changeset{source: %Entry{}}

  """
  def change_entry(%Entry{} = entry) do
    Entry.changeset(entry, %{})
  end

  @doc """
  Returns a new serial number
  """
  def generate_serial_number() do
  end
end
