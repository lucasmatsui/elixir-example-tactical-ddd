defmodule ExampleArchTest do
  use ExUnit.Case
  doctest ExampleArch

  test "greets the world" do
    assert ExampleArch.hello() == :world
  end
end
