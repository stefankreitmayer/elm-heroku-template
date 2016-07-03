defmodule ElmHeroku.PageController do
  use ElmHeroku.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
