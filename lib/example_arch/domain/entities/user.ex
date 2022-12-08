defmodule ExampleArch.Domain.Entities.User do
  alias __MODULE__, as: User

  alias ExampleArch.Domain.Entities.Wallet
  alias ExampleArch.Domain.{Cpf, Name}

  @required_fields [:id, :name, :cpf]
  @optional_fields [:wallet]

  @enforce_keys @required_fields
  defstruct @required_fields ++ @optional_fields

  @type t :: %User{
          id: String.t(),
          name: Name.t(),
          cpf: Cpf.t(),
          wallet: Wallet.t()
        }

  def new(%Name{} = name, %Cpf{} = cpf) do
    with true <- Cpf.valid?(cpf),
         true <- Name.valid?(name) do
      {:ok,
       %User{
         id: "3efbe053-5f35-4d36-87f3-701c938cdc84",
         name: name,
         cpf: cpf
       }}
    else
      _ -> {:error, "name/cpf invalid"}
    end
  end

  def create_wallet(%User{} = user, %Wallet{} = wallet) do
    %{user | wallet: wallet}
  end
end
