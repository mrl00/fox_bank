defmodule FoxBank.Users.User do
  use Ecto.Schema

  import Ecto.Changeset
  import EctoCommons.EmailValidator

  alias Ecto.Changeset

  @required_create_params [:name, :password, :email, :cep]
  @required_update_params [:name, :email, :cep]

  schema "tb_users" do
    field :name, :string
    field :password, :string, virtual: true
    field :password_hash, :string
    field :email, :string
    field :cep, :string

    timestamps()
  end

  def changeset(params) do
    %__MODULE__{}
    |> cast(params, @required_create_params)
    |> validate_required(@required_create_params)
    |> validate_length(:name, min: 3, max: 124)
    |> validate_email(:email)
    |> validate_length(:cep, is: 8)
    |> add_password_hash()
  end

  def changeset(user, params) do
    user
    |> cast(params, @required_create_params)
    |> validate_required(@required_update_params)
    |> validate_length(:name, min: 3, max: 124)
    |> validate_email(:email)
    |> validate_length(:cep, is: 8)
    |> add_password_hash()
  end

  defp add_password_hash(%Changeset{valid?: true, changes: %{password: password}} = changeset) do
    change(changeset, password_hash: Argon2.hash_pwd_salt(password))
  end

  defp add_password_hash(changeset), do: changeset
end
