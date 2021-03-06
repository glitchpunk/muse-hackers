defmodule Api.SessionView do
  use Api, :view
  @moduledoc false

  def render("sign.in.v1.json", %{user: user, jwt: jwt}) do
    %{
      status: :ok,
      data: %{
        token: jwt,
        email: user.email
      },
      message: """
        You are successfully logged in!
        Add this token to authorization header to make authorized requests.
      """
    }
  end

  def render("refresh.token.v1.json", %{user: user, jwt: jwt}) do
    %{
      status: :ok,
      data: %{
        token: jwt,
        email: user.email
      },
      message: """
        Token was successfully re-generated!
      """
    }
  end

  def render("session.status.v1.json", _params) do
    %{
      status: :ok
    }
  end
end
