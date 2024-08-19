defmodule SseDemoTest do
  use ExUnit.Case
  doctest SseDemo

  test "greets the world" do
    assert SseDemo.hello() == :world
  end
end
