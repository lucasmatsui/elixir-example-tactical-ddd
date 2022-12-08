defmodule ExampleArch.Domain.Repositories.UserRepo do
  alias ExampleArch.Domain.Entities.User

  @callback create_user(User.t()) :: {:ok, User.t()} | {:error, String.t()}

  def create_user(user), do: impl().create_user(user)

  defp impl() do
    Application.get_env(:example_arch, :user_repository)
  end
end
