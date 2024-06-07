defmodule FoxBank.Users do
  alias FoxBank.Users.Create
  alias FoxBank.Users.Get
  alias FoxBank.Users.Update

  defdelegate create(params), to: Create, as: :call
  defdelegate get(id), to: Get, as: :call
  defdelegate update(params), to: Update, as: :call
end
