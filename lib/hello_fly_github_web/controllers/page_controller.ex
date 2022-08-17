defmodule HelloFlyGithubWeb.PageController do
  use HelloFlyGithubWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
