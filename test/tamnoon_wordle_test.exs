defmodule TamnoonWordleTest do
  use ExUnit.Case
  doctest TamnoonWordle

  test "greets the world" do
    assert TamnoonWordle.hello() == :world
  end
end
