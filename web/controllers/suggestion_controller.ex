defmodule Nerdbeers.SuggestionController do
  use Nerdbeers.Web, :controller

  alias Nerdbeers.Suggestion

  plug :scrub_params, "suggestion" when action in [:create, :update]

  def index(conn, _params) do
    suggestions = Repo.all(Suggestion)
    render(conn, "index.html", suggestions: suggestions)
  end

  def new(conn, _params) do
    changeset = Suggestion.changeset(%Suggestion{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"suggestion" => suggestion_params}) do
    changeset = Suggestion.changeset(%Suggestion{}, suggestion_params)

    case Repo.insert(changeset) do
      {:ok, _suggestion} ->
        conn
        |> put_flash(:info, "Suggestion created successfully.")
        |> redirect(to: suggestion_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    suggestion = Repo.get!(Suggestion, id)
    render(conn, "show.html", suggestion: suggestion)
  end

  def edit(conn, %{"id" => id}) do
    suggestion = Repo.get!(Suggestion, id)
    changeset = Suggestion.changeset(suggestion)
    render(conn, "edit.html", suggestion: suggestion, changeset: changeset)
  end

  def update(conn, %{"id" => id, "suggestion" => suggestion_params}) do
    suggestion = Repo.get!(Suggestion, id)
    changeset = Suggestion.changeset(suggestion, suggestion_params)

    case Repo.update(changeset) do
      {:ok, suggestion} ->
        conn
        |> put_flash(:info, "Suggestion updated successfully.")
        |> redirect(to: suggestion_path(conn, :show, suggestion))
      {:error, changeset} ->
        render(conn, "edit.html", suggestion: suggestion, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    suggestion = Repo.get!(Suggestion, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(suggestion)

    conn
    |> put_flash(:info, "Suggestion deleted successfully.")
    |> redirect(to: suggestion_path(conn, :index))
  end
end
