defmodule FoxBankWeb.WelcomeController do
  use FoxBankWeb, :controller

  def index(conn, _params) do
    conn
    |> json(%{message: "Welcome to Fox Bank", status: :ok})
  end
end
