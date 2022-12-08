defmodule ExampleArch.Domain.Name do
  alias __MODULE__, as: Name
  @required_fields [:value]

  @enforce_keys @required_fields
  defstruct @required_fields

  @type t :: %Name{
          value: String.t()
        }

  def new(name) do
    %Name{
      value: name
    }
  end

  def valid?(%Name{value: value}) do
    case String.contains?(value, "/") do
      false -> true
      _ -> false
    end
  end
end
