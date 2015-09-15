defmodule Nerdbeers.MistakeController do
  use Nerdbeers.Web, :controller

  def index(conn, _params) do
    try do
      DoesNotExist.for_sure()
    rescue
      exception ->
        Rollbax.report(exception, System.stacktrace())
    end
  end
end
