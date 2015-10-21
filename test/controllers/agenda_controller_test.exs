defmodule Nerdbeers.AgendaControllerTest do
  use Nerdbeers.ConnCase

  alias Nerdbeers.Agenda
  @valid_attrs %{beer_1: "some content", topic_1: "some content", venue: 42}
  @invalid_attrs %{}

  setup do
    conn = conn()
    {:ok, conn: conn}
  end

  # test "lists all entries on index", %{conn: conn} do
    # conn = get conn, agenda_path(conn, :index)
    # assert html_response(conn, 200) =~ "Listing agendas"
  # end

end
