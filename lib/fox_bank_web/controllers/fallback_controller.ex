defmodule FoxBankWeb.FallbackController do
  alias FoxBankWeb.ErrorJSON

  use FoxBankWeb, :controller

  def call(conn, {:error, changeset}) do
    conn
    |> put_status(:bad_request)
    |> put_view(json: ErrorJSON)
    |> render(:error, changeset: changeset)
  end
end
