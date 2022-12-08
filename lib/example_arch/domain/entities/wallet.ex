defmodule ExampleArch.Domain.Entities.Wallet do
  alias __MODULE__, as: Wallet
  @required_fields [:balance]

  @enforce_keys @required_fields
  defstruct @required_fields

  @type t :: %Wallet{
          balance: number()
        }

  def new() do
    %Wallet{
      balance: 0.0
    }
  end

  def deposit(%Wallet{} = wallet, value) do
    %{wallet | balance: value}
  end
end
