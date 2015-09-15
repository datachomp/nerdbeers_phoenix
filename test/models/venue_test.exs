defmodule Nerdbeers.VenueTest do
  use Nerdbeers.ModelCase

  alias Nerdbeers.Venue

  @valid_attrs %{map_link: "some content", venue: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Venue.changeset(%Venue{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Venue.changeset(%Venue{}, @invalid_attrs)
    refute changeset.valid?
  end
end
