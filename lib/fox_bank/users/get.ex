defmodule FoxBank.Users.Get do
  alias FoxBank.Users.User
  alias FoxBank.Repo

  def call(id) do
    case Repo.get(User, id) do
      nil -> {:error, :not_found}
      user -> {:ok, user}
    end
  end
end
