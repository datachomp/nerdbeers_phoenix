defmodule Nerdbeers.Repo.Migrations.CreateAgenda do
  use Ecto.Migration

  def change do
    create table(:agendas) do
      add :venue, :integer
      add :beer_1, :string
      add :topic_1, :string

      timestamps
    end

  end
end
