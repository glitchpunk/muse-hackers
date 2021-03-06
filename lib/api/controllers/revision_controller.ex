defmodule Api.RevisionController do
  use Api, :controller

  alias Db.VersionControl
  alias Db.VersionControl.Revision

  action_fallback Api.FallbackController

  def show(conn, %{"id" => id}) do
    revision = VersionControl.get_revision!(id)
    conn
    |> put_status(:ok)
    |> render("show.v1.json", revision: revision)
  end

  def create(conn, %{"id" => id, "revision" => revision_params}) do
    with attrs <- Map.put(revision_params, "id", id),
        {:ok, %Revision{} = _} <- VersionControl.create_revision(attrs) do
      conn
      |> send_resp(:created, "")
      |> halt()
    end
  end
end
