defmodule ExampleArch.Infra.Repositories.Oracle.UserRepo do
  @behaviour ExampleArch.Domain.Repositories.UserRepo

  alias ExampleArch.Domain.Entities.User

  def create_user(%User{} = user) do
    {:ok, user}
  end
end
