defmodule ThriftExampleTest do
  use ExUnit.Case
  doctest ThriftExample

  test "greets the world" do
    assert ThriftExample.hello() == :world
  end
end
