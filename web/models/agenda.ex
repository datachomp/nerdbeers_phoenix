defmodule Nerdbeers.Agenda do
  use Nerdbeers.Web, :model

  schema "agendas" do
    field :meeting_date, Ecto.DateTime
    field :venue_id, :integer
    field :beer_1, :string
    field :beer_2, :string
    field :beer_3, :string
    field :topic_1, :string
    field :topic_2, :string
    field :topic_3, :string

    timestamps
  end

  @required_fields ~w(beer_1 beer_2 beer_3 topic_1 topic_2 topic_3)
  @optional_fields ~w(venue_id meeting_date)


  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
