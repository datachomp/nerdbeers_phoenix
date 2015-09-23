defmodule Nerdbeers.Suggestion do
  use Nerdbeers.Web, :model

  schema "suggestions" do
    field :title, :string

    timestamps
  end

  @required_fields ~w(title)
  @optional_fields ~w()

  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
