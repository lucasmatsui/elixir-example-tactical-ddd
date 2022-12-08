defmodule ExampleArch.Application.Service.CreateUser do
  alias ExampleArch.Domain.{Cpf, Name}
  alias ExampleArch.Domain.Entities.{User, Wallet}

  alias ExampleArch.Domain.Repositories.UserRepo

  def exec(%{name: name, cpf: cpf}) do
    with cpf <- Cpf.new(cpf),
         name <- Name.new(name),
         {:ok, user} <- User.new(name, cpf) do
      user
      |> User.create_wallet(Wallet.new())
      |> UserRepo.create_user()
    end
  end
end
