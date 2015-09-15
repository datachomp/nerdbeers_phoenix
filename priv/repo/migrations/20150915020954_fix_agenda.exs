defmodule Nerdbeers.Repo.Migrations.FixAgenda do
  use Ecto.Migration

  def change do
    execute "drop table agendas"
    execute "CREATE TABLE agendas
      (
        id serial PRIMARY KEY NOT NULL,
        meeting_date timestamp without time zone NOT NULL,
        venue_id integer NOT NULL,
        beer_1 text NOT NULL,
        beer_2 text NOT NULL,
        beer_3 text NOT NULL,
        topic_1 text NOT NULL,
        topic_2 text NOT NULL,
        topic_3 text NOT NULL,
        inserted_at timestamp without time zone NOT NULL,
        updated_at timestamp without time zone NOT NULL
      )"
  end
end
