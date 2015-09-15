defmodule Nerdbeers.AgendaController do
  use Nerdbeers.Web, :controller

  alias Nerdbeers.Agenda

  plug :scrub_params, "agenda" when action in [:create, :update]

  def index(conn, _params) do
    agendas = Repo.all(Agenda)
    render(conn, "index.html", agendas: agendas)
  end

end
