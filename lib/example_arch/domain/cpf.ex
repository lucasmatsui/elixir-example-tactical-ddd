defmodule ExampleArch.Domain.Cpf do
  alias __MODULE__, as: Cpf
  @required_fields [:value]

  @enforce_keys @required_fields
  defstruct @required_fields

  @type t :: %Cpf{
          value: String.t()
        }

  def new(cpf) do
    %Cpf{
      value: cpf
    }
  end

  def valid?(%Cpf{value: value}) do
    case String.contains?(value, ".") do
      true -> true
      _ -> false
    end
  end
end
