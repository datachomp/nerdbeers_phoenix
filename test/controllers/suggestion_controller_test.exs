defmodule Nerdbeers.SuggestionControllerTest do
  use Nerdbeers.ConnCase

  alias Nerdbeers.Suggestion
  @valid_attrs %{title: "some content"}
  @invalid_attrs %{}

  setup do
    conn = conn()
    {:ok, conn: conn}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, suggestion_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing suggestions"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, suggestion_path(conn, :new)
    assert html_response(conn, 200) =~ "New suggestion"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, suggestion_path(conn, :create), suggestion: @valid_attrs
    assert redirected_to(conn) == suggestion_path(conn, :index)
    assert Repo.get_by(Suggestion, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, suggestion_path(conn, :create), suggestion: @invalid_attrs
    assert html_response(conn, 200) =~ "New suggestion"
  end

  test "shows chosen resource", %{conn: conn} do
    suggestion = Repo.insert! %Suggestion{}
    conn = get conn, suggestion_path(conn, :show, suggestion)
    assert html_response(conn, 200) =~ "Show suggestion"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_raise Ecto.NoResultsError, fn ->
      get conn, suggestion_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    suggestion = Repo.insert! %Suggestion{}
    conn = get conn, suggestion_path(conn, :edit, suggestion)
    assert html_response(conn, 200) =~ "Edit suggestion"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    suggestion = Repo.insert! %Suggestion{}
    conn = put conn, suggestion_path(conn, :update, suggestion), suggestion: @valid_attrs
    assert redirected_to(conn) == suggestion_path(conn, :show, suggestion)
    assert Repo.get_by(Suggestion, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    suggestion = Repo.insert! %Suggestion{}
    conn = put conn, suggestion_path(conn, :update, suggestion), suggestion: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit suggestion"
  end

  test "deletes chosen resource", %{conn: conn} do
    suggestion = Repo.insert! %Suggestion{}
    conn = delete conn, suggestion_path(conn, :delete, suggestion)
    assert redirected_to(conn) == suggestion_path(conn, :index)
    refute Repo.get(Suggestion, suggestion.id)
  end
end
