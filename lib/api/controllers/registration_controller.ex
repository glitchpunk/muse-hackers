defmodule Api.RegistrationController do
  use Api, :controller
  @moduledoc false

  alias Db.Accounts
  alias Db.Accounts.User

  action_fallback Api.FallbackController

  def sign_up(conn, %{"user" => user_params}) do
    with {:ok, %User{} = user} <- Accounts.register_user(user_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", api_user_path(conn, :get_current_user))
      |> render("registration.success.v1.json", user: user)
    end
  end
end
