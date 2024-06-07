defmodule FoxBank.Users do
  alias FoxBank.Users.Get
  alias FoxBank.Users.Create

  defdelegate create(params), to: Create, as: :call
  defdelegate get(id), to: Get, as: :call
end
