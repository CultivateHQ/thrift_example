defmodule(Thrift.Test.UserService) do
  defmodule(DeleteUserArgs) do
    _ = "Auto-generated Thrift struct Elixir.DeleteUserArgs"
    _ = "1: i64 user_id"
    defstruct(user_id: nil)
    @type(t :: %__MODULE__{})
    def(new) do
      %__MODULE__{}
    end
    defmodule(BinaryProtocol) do
      @moduledoc(false)
      def(deserialize(binary)) do
        deserialize(binary, %DeleteUserArgs{})
      end
      defp(deserialize(<<0, rest::binary>>, %DeleteUserArgs{} = acc)) do
        {acc, rest}
      end
      defp(deserialize(<<10, 1::16-signed, value::64-signed, rest::binary>>, acc)) do
        deserialize(rest, %{acc | user_id: value})
      end
      defp(deserialize(<<field_type, _id::16-signed, rest::binary>>, acc)) do
        rest |> Thrift.Protocol.Binary.skip_field(field_type) |> deserialize(acc)
      end
      defp(deserialize(_, _)) do
        :error
      end
      def(serialize(%DeleteUserArgs{user_id: user_id})) do
        [case(user_id) do
          nil ->
            <<>>
          _ ->
            <<10, 1::16-signed, user_id::64-signed>>
        end | <<0>>]
      end
    end
    def(serialize(struct)) do
      BinaryProtocol.serialize(struct)
    end
    def(serialize(struct, :binary)) do
      BinaryProtocol.serialize(struct)
    end
    def(deserialize(binary)) do
      BinaryProtocol.deserialize(binary)
    end
  end
  defmodule(GetUserByIdArgs) do
    _ = "Auto-generated Thrift struct Elixir.GetUserByIdArgs"
    _ = "1: i64 user_id"
    defstruct(user_id: nil)
    @type(t :: %__MODULE__{})
    def(new) do
      %__MODULE__{}
    end
    defmodule(BinaryProtocol) do
      @moduledoc(false)
      def(deserialize(binary)) do
        deserialize(binary, %GetUserByIdArgs{})
      end
      defp(deserialize(<<0, rest::binary>>, %GetUserByIdArgs{} = acc)) do
        {acc, rest}
      end
      defp(deserialize(<<10, 1::16-signed, value::64-signed, rest::binary>>, acc)) do
        deserialize(rest, %{acc | user_id: value})
      end
      defp(deserialize(<<field_type, _id::16-signed, rest::binary>>, acc)) do
        rest |> Thrift.Protocol.Binary.skip_field(field_type) |> deserialize(acc)
      end
      defp(deserialize(_, _)) do
        :error
      end
      def(serialize(%GetUserByIdArgs{user_id: user_id})) do
        [case(user_id) do
          nil ->
            <<>>
          _ ->
            <<10, 1::16-signed, user_id::64-signed>>
        end | <<0>>]
      end
    end
    def(serialize(struct)) do
      BinaryProtocol.serialize(struct)
    end
    def(serialize(struct, :binary)) do
      BinaryProtocol.serialize(struct)
    end
    def(deserialize(binary)) do
      BinaryProtocol.deserialize(binary)
    end
  end
  defmodule(PingArgs) do
    _ = "Auto-generated Thrift struct Elixir.PingArgs"
    defstruct([])
    @type(t :: %__MODULE__{})
    def(new) do
      %__MODULE__{}
    end
    defmodule(BinaryProtocol) do
      @moduledoc(false)
      def(deserialize(binary)) do
        deserialize(binary, %PingArgs{})
      end
      defp(deserialize(<<0, rest::binary>>, %PingArgs{} = acc)) do
        {acc, rest}
      end
      defp(deserialize(<<field_type, _id::16-signed, rest::binary>>, acc)) do
        rest |> Thrift.Protocol.Binary.skip_field(field_type) |> deserialize(acc)
      end
      defp(deserialize(_, _)) do
        :error
      end
      def(serialize(%PingArgs{})) do
        <<0>>
      end
    end
    def(serialize(struct)) do
      BinaryProtocol.serialize(struct)
    end
    def(serialize(struct, :binary)) do
      BinaryProtocol.serialize(struct)
    end
    def(deserialize(binary)) do
      BinaryProtocol.deserialize(binary)
    end
  end
  defmodule(DeleteUserResponse) do
    _ = "Auto-generated Thrift struct Elixir.DeleteUserResponse"
    _ = "0: bool success"
    defstruct(success: nil)
    @type(t :: %__MODULE__{})
    def(new) do
      %__MODULE__{}
    end
    defmodule(BinaryProtocol) do
      @moduledoc(false)
      def(deserialize(binary)) do
        deserialize(binary, %DeleteUserResponse{})
      end
      defp(deserialize(<<0, rest::binary>>, %DeleteUserResponse{} = acc)) do
        {acc, rest}
      end
      defp(deserialize(<<2, 0::16-signed, 1, rest::binary>>, acc)) do
        deserialize(rest, %{acc | success: true})
      end
      defp(deserialize(<<2, 0::16-signed, 0, rest::binary>>, acc)) do
        deserialize(rest, %{acc | success: false})
      end
      defp(deserialize(<<field_type, _id::16-signed, rest::binary>>, acc)) do
        rest |> Thrift.Protocol.Binary.skip_field(field_type) |> deserialize(acc)
      end
      defp(deserialize(_, _)) do
        :error
      end
      def(serialize(%DeleteUserResponse{success: success})) do
        [case(success) do
          nil ->
            <<>>
          false ->
            <<2, 0::16-signed, 0>>
          true ->
            <<2, 0::16-signed, 1>>
          _ ->
            raise(Thrift.InvalidValueError, "Optional boolean field :success on DeleteUserResponse must be true, false, or nil")
        end | <<0>>]
      end
    end
    def(serialize(struct)) do
      BinaryProtocol.serialize(struct)
    end
    def(serialize(struct, :binary)) do
      BinaryProtocol.serialize(struct)
    end
    def(deserialize(binary)) do
      BinaryProtocol.deserialize(binary)
    end
  end
  defmodule(GetUserByIdResponse) do
    _ = "Auto-generated Thrift struct Elixir.GetUserByIdResponse"
    _ = "0: user.User success"
    _ = "1: user.UserNotFound unf"
    defstruct(success: nil, unf: nil)
    @type(t :: %__MODULE__{})
    def(new) do
      %__MODULE__{}
    end
    defmodule(BinaryProtocol) do
      @moduledoc(false)
      def(deserialize(binary)) do
        deserialize(binary, %GetUserByIdResponse{})
      end
      defp(deserialize(<<0, rest::binary>>, %GetUserByIdResponse{} = acc)) do
        {acc, rest}
      end
      defp(deserialize(<<12, 0::16-signed, rest::binary>>, acc)) do
        case(Elixir.Thrift.Test.User.BinaryProtocol.deserialize(rest)) do
          {value, rest} ->
            deserialize(rest, %{acc | success: value})
          :error ->
            :error
        end
      end
      defp(deserialize(<<12, 1::16-signed, rest::binary>>, acc)) do
        case(Elixir.Thrift.Test.UserNotFound.BinaryProtocol.deserialize(rest)) do
          {value, rest} ->
            deserialize(rest, %{acc | unf: value})
          :error ->
            :error
        end
      end
      defp(deserialize(<<field_type, _id::16-signed, rest::binary>>, acc)) do
        rest |> Thrift.Protocol.Binary.skip_field(field_type) |> deserialize(acc)
      end
      defp(deserialize(_, _)) do
        :error
      end
      def(serialize(%GetUserByIdResponse{success: success, unf: unf})) do
        [case(success) do
          nil ->
            <<>>
          _ ->
            [<<12, 0::16-signed>> | Thrift.Test.User.serialize(success)]
        end, case(unf) do
          nil ->
            <<>>
          _ ->
            [<<12, 1::16-signed>> | Thrift.Test.UserNotFound.serialize(unf)]
        end | <<0>>]
      end
    end
    def(serialize(struct)) do
      BinaryProtocol.serialize(struct)
    end
    def(serialize(struct, :binary)) do
      BinaryProtocol.serialize(struct)
    end
    def(deserialize(binary)) do
      BinaryProtocol.deserialize(binary)
    end
  end
  defmodule(PingResponse) do
    _ = "Auto-generated Thrift struct Elixir.PingResponse"
    _ = "0: bool success"
    defstruct(success: nil)
    @type(t :: %__MODULE__{})
    def(new) do
      %__MODULE__{}
    end
    defmodule(BinaryProtocol) do
      @moduledoc(false)
      def(deserialize(binary)) do
        deserialize(binary, %PingResponse{})
      end
      defp(deserialize(<<0, rest::binary>>, %PingResponse{} = acc)) do
        {acc, rest}
      end
      defp(deserialize(<<2, 0::16-signed, 1, rest::binary>>, acc)) do
        deserialize(rest, %{acc | success: true})
      end
      defp(deserialize(<<2, 0::16-signed, 0, rest::binary>>, acc)) do
        deserialize(rest, %{acc | success: false})
      end
      defp(deserialize(<<field_type, _id::16-signed, rest::binary>>, acc)) do
        rest |> Thrift.Protocol.Binary.skip_field(field_type) |> deserialize(acc)
      end
      defp(deserialize(_, _)) do
        :error
      end
      def(serialize(%PingResponse{success: success})) do
        [case(success) do
          nil ->
            <<>>
          false ->
            <<2, 0::16-signed, 0>>
          true ->
            <<2, 0::16-signed, 1>>
          _ ->
            raise(Thrift.InvalidValueError, "Optional boolean field :success on PingResponse must be true, false, or nil")
        end | <<0>>]
      end
    end
    def(serialize(struct)) do
      BinaryProtocol.serialize(struct)
    end
    def(serialize(struct, :binary)) do
      BinaryProtocol.serialize(struct)
    end
    def(deserialize(binary)) do
      BinaryProtocol.deserialize(binary)
    end
  end
  defmodule(Binary.Framed.Client) do
    @moduledoc(false)
    alias(Thrift.Binary.Framed.Client, as: ClientImpl)
    defdelegate(close(conn), to: ClientImpl)
    defdelegate(connect(conn, opts), to: ClientImpl)
    defdelegate(start_link(host, port, opts \\ []), to: ClientImpl)
    def(unquote(:delete_user)(client, user_id, rpc_opts \\ [])) do
      args = %DeleteUserArgs{user_id: user_id}
      serialized_args = DeleteUserArgs.BinaryProtocol.serialize(args)
      ClientImpl.call(client, "deleteUser", serialized_args, DeleteUserResponse.BinaryProtocol, rpc_opts)
    end
    def(unquote(:delete_user!)(client, user_id, rpc_opts \\ [])) do
      case(unquote(:delete_user)(client, user_id, rpc_opts)) do
        {:ok, rsp} ->
          rsp
        {:error, {:exception, ex}} ->
          raise(ex)
        {:error, _} = err ->
          raise(err)
      end
    end
    def(unquote(:get_user_by_id)(client, user_id, rpc_opts \\ [])) do
      args = %GetUserByIdArgs{user_id: user_id}
      serialized_args = GetUserByIdArgs.BinaryProtocol.serialize(args)
      ClientImpl.call(client, "get_user_by_id", serialized_args, GetUserByIdResponse.BinaryProtocol, rpc_opts)
    end
    def(unquote(:get_user_by_id!)(client, user_id, rpc_opts \\ [])) do
      case(unquote(:get_user_by_id)(client, user_id, rpc_opts)) do
        {:ok, rsp} ->
          rsp
        {:error, {:exception, ex}} ->
          raise(ex)
        {:error, _} = err ->
          raise(err)
      end
    end
    def(unquote(:ping)(client, rpc_opts \\ [])) do
      args = %PingArgs{}
      serialized_args = PingArgs.BinaryProtocol.serialize(args)
      ClientImpl.call(client, "ping", serialized_args, PingResponse.BinaryProtocol, rpc_opts)
    end
    def(unquote(:ping!)(client, rpc_opts \\ [])) do
      case(unquote(:ping)(client, rpc_opts)) do
        {:ok, rsp} ->
          rsp
        {:error, {:exception, ex}} ->
          raise(ex)
        {:error, _} = err ->
          raise(err)
      end
    end
  end
  defmodule(Binary.Framed.Server) do
    @moduledoc(false)
    require(Logger)
    alias(Thrift.Binary.Framed.Server, as: ServerImpl)
    defdelegate(stop(name), to: ServerImpl)
    def(start_link(handler_module, port, opts \\ [])) do
      ServerImpl.start_link(__MODULE__, port, handler_module, opts)
    end
    def(handle_thrift("deleteUser", binary_data, handler_module)) do
      case(Elixir.Thrift.Test.UserService.DeleteUserArgs.BinaryProtocol.deserialize(binary_data)) do
        {%Thrift.Test.UserService.DeleteUserArgs{user_id: user_id}, ""} ->
          try() do
            rsp = handler_module.delete_user(user_id)
            (
              response = %Thrift.Test.UserService.DeleteUserResponse{success: rsp}
              {:reply, Elixir.Thrift.Test.UserService.DeleteUserResponse.BinaryProtocol.serialize(response)}
            )
          rescue
            []
          catch
            kind, reason ->
              formatted_exception = Exception.format(kind, reason, System.stacktrace())
              Logger.error("Exception not defined in thrift spec was thrown: #{formatted_exception}")
              error = Thrift.TApplicationException.exception(type: :internal_error, message: "Server error: #{formatted_exception}")
              {:server_error, error}
          end
        {_, extra} ->
          raise(Thrift.TApplicationException, type: :protocol_error, message: "Could not decode #{inspect(extra)}")
      end
    end
    def(handle_thrift("get_user_by_id", binary_data, handler_module)) do
      case(Elixir.Thrift.Test.UserService.GetUserByIdArgs.BinaryProtocol.deserialize(binary_data)) do
        {%Thrift.Test.UserService.GetUserByIdArgs{user_id: user_id}, ""} ->
          try() do
            rsp = handler_module.get_user_by_id(user_id)
            (
              response = %Thrift.Test.UserService.GetUserByIdResponse{success: rsp}
              {:reply, Elixir.Thrift.Test.UserService.GetUserByIdResponse.BinaryProtocol.serialize(response)}
            )
          rescue
            unf in Thrift.Test.UserNotFound ->
              response = %Thrift.Test.UserService.GetUserByIdResponse{unf: unf}
              {:reply, Elixir.Thrift.Test.UserService.GetUserByIdResponse.BinaryProtocol.serialize(response)}
          catch
            kind, reason ->
              formatted_exception = Exception.format(kind, reason, System.stacktrace())
              Logger.error("Exception not defined in thrift spec was thrown: #{formatted_exception}")
              error = Thrift.TApplicationException.exception(type: :internal_error, message: "Server error: #{formatted_exception}")
              {:server_error, error}
          end
        {_, extra} ->
          raise(Thrift.TApplicationException, type: :protocol_error, message: "Could not decode #{inspect(extra)}")
      end
    end
    def(handle_thrift("ping", _binary_data, handler_module)) do
      try() do
        rsp = handler_module.ping()
        (
          response = %Thrift.Test.UserService.PingResponse{success: rsp}
          {:reply, Elixir.Thrift.Test.UserService.PingResponse.BinaryProtocol.serialize(response)}
        )
      rescue
        []
      catch
        kind, reason ->
          formatted_exception = Exception.format(kind, reason, System.stacktrace())
          Logger.error("Exception not defined in thrift spec was thrown: #{formatted_exception}")
          error = Thrift.TApplicationException.exception(type: :internal_error, message: "Server error: #{formatted_exception}")
          {:server_error, error}
      end
    end
  end
end