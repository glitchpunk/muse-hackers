defmodule Api.RegistrationView do
  use Api, :view
  @moduledoc false

  def render("registration.success.v1.json", %{user: _user}) do
    %{
      status: :ok,
      message: """
        Now you can sign in using your email and password at /api/v1/login. You will receive JWT token.
        Please put this token into Authorization header for all authorized requests.
      """
    }
  end
end
