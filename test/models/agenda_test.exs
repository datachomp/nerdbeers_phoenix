defmodule Nerdbeers.AgendaTest do
  use Nerdbeers.ModelCase

  alias Nerdbeers.Agenda

  @valid_attrs %{beer_1: "some content", topic_1: "some content", venue: 42}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Agenda.changeset(%Agenda{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Agenda.changeset(%Agenda{}, @invalid_attrs)
    refute changeset.valid?
  end
end
