defmodule ThriftExample do
  alias Thrift.Test.UserService.Binary.Framed.Client

  @moduledoc """
  Documentation for ThriftExample.
  """

  @doc """
  Hello world.

  ## Examples

      iex> ThriftExample.hello
      :world

  """
  def hello do
    :world
  end

  def start_client do
    Client.start_link("localhost", 2345, tcp_opts: [], gen_server_opts: [timeout: 10_000])
  end
end
