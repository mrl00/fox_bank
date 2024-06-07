defmodule FoxBankWeb.UsersController do
  use FoxBankWeb, :controller

  alias FoxBank.Users
  alias Users.User

  action_fallback FoxBankWeb.FallbackController

  def create(conn, params) do
    with {:ok, %User{} = user} <- Create.create(params) do
      conn
      |> put_status(:created)
      |> render(:create, user: user)
    end
  end
end
