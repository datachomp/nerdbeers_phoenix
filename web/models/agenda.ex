defmodule Nerdbeers.Agenda do
  use Nerdbeers.Web, :model

  schema "agendas" do
    field :venue, :integer
    field :beer_1, :string
    field :topic_1, :string

    timestamps
  end

  @required_fields ~w(venue beer_1 topic_1)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
