defmodule Nerdbeers.Repo.Migrations.CreateVenue do
  use Ecto.Migration

  def change do
    create table(:venues) do
      add :venue, :string
      add :map_link, :string

      timestamps
    end

  end
end
