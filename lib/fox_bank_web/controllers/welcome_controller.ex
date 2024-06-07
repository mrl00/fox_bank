defmodule FoxBankWeb.WelcomeController do
  use FoxBankWeb, :controller

  def index(connection, _params) do
    connection
    |> json(%{message: "Welcome to Fox Bank", status: :ok})
  end
end
