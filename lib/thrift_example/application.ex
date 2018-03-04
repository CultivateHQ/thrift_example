defmodule ThriftExample.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    import Supervisor.Spec

    children = [
      # worker(Thrift.Test.UserService.Binary.Framed.Server, [ThriftExample.Server, 2345, []])
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: ThriftExample.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
