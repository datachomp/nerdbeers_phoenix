defmodule Nerdbeers.AgendaController do
  use Nerdbeers.Web, :controller

  alias Nerdbeers.Agenda

  plug :scrub_params, "agenda" when action in [:create, :update]

  def index(conn, _params) do
    agendas = Repo.all(Agenda)
    render(conn, "index.html", agendas: agendas)
  end

  def new(conn, _params) do
    changeset = Agenda.changeset(%Agenda{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"agenda" => agenda_params}) do
    changeset = Agenda.changeset(%Agenda{}, agenda_params)

    case Repo.insert(changeset) do
      {:ok, _agenda} ->
        conn
        |> put_flash(:info, "Agenda created successfully.")
        |> redirect(to: agenda_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    agenda = Repo.get!(Agenda, id)
    render(conn, "show.html", agenda: agenda)
  end

  def edit(conn, %{"id" => id}) do
    agenda = Repo.get!(Agenda, id)
    changeset = Agenda.changeset(agenda)
    render(conn, "edit.html", agenda: agenda, changeset: changeset)
  end

  def update(conn, %{"id" => id, "agenda" => agenda_params}) do
    agenda = Repo.get!(Agenda, id)
    changeset = Agenda.changeset(agenda, agenda_params)

    case Repo.update(changeset) do
      {:ok, agenda} ->
        conn
        |> put_flash(:info, "Agenda updated successfully.")
        |> redirect(to: agenda_path(conn, :show, agenda))
      {:error, changeset} ->
        render(conn, "edit.html", agenda: agenda, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    agenda = Repo.get!(Agenda, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(agenda)

    conn
    |> put_flash(:info, "Agenda deleted successfully.")
    |> redirect(to: agenda_path(conn, :index))
  end
end
