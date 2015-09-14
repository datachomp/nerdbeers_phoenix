defmodule Nerdbeers.AgendaControllerTest do
  use Nerdbeers.ConnCase

  alias Nerdbeers.Agenda
  @valid_attrs %{beer_1: "some content", topic_1: "some content", venue: 42}
  @invalid_attrs %{}

  setup do
    conn = conn()
    {:ok, conn: conn}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, agenda_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing agendas"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, agenda_path(conn, :new)
    assert html_response(conn, 200) =~ "New agenda"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, agenda_path(conn, :create), agenda: @valid_attrs
    assert redirected_to(conn) == agenda_path(conn, :index)
    assert Repo.get_by(Agenda, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, agenda_path(conn, :create), agenda: @invalid_attrs
    assert html_response(conn, 200) =~ "New agenda"
  end

  test "shows chosen resource", %{conn: conn} do
    agenda = Repo.insert! %Agenda{}
    conn = get conn, agenda_path(conn, :show, agenda)
    assert html_response(conn, 200) =~ "Show agenda"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_raise Ecto.NoResultsError, fn ->
      get conn, agenda_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    agenda = Repo.insert! %Agenda{}
    conn = get conn, agenda_path(conn, :edit, agenda)
    assert html_response(conn, 200) =~ "Edit agenda"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    agenda = Repo.insert! %Agenda{}
    conn = put conn, agenda_path(conn, :update, agenda), agenda: @valid_attrs
    assert redirected_to(conn) == agenda_path(conn, :show, agenda)
    assert Repo.get_by(Agenda, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    agenda = Repo.insert! %Agenda{}
    conn = put conn, agenda_path(conn, :update, agenda), agenda: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit agenda"
  end

  test "deletes chosen resource", %{conn: conn} do
    agenda = Repo.insert! %Agenda{}
    conn = delete conn, agenda_path(conn, :delete, agenda)
    assert redirected_to(conn) == agenda_path(conn, :index)
    refute Repo.get(Agenda, agenda.id)
  end
end
