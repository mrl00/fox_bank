defmodule FoxBank.Users.Create do
  alias FoxBank.Users.User
  alias FoxBank.Repo

  def call(params) do
    params
    |> User.changeset()
    |> Repo.insert()
  end
end
