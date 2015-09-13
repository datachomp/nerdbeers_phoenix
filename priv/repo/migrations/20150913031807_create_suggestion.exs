defmodule Nerdbeers.Repo.Migrations.CreateSuggestion do
  use Ecto.Migration

  def change do
    create table(:suggestions) do
      add :title, :string

      timestamps
    end

  end
end
