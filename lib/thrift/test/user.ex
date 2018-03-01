defmodule(Thrift.Test.User) do
  _ = "Auto-generated Thrift struct user.User"
  _ = "1: i64 id"
  _ = "2: string username"
  _ = "3: string first_name"
  _ = "4: string last_name"
  defstruct(id: nil, username: nil, first_name: nil, last_name: nil)
  @type(t :: %__MODULE__{})
  def(new) do
    %__MODULE__{}
  end
  defmodule(BinaryProtocol) do
    @moduledoc(false)
    def(deserialize(binary)) do
      deserialize(binary, %Thrift.Test.User{})
    end
    defp(deserialize(<<0, rest::binary>>, %Thrift.Test.User{} = acc)) do
      {acc, rest}
    end
    defp(deserialize(<<10, 1::16-signed, value::64-signed, rest::binary>>, acc)) do
      deserialize(rest, %{acc | id: value})
    end
    defp(deserialize(<<11, 2::16-signed, string_size::32-signed, value::binary-size(string_size), rest::binary>>, acc)) do
      deserialize(rest, %{acc | username: value})
    end
    defp(deserialize(<<11, 3::16-signed, string_size::32-signed, value::binary-size(string_size), rest::binary>>, acc)) do
      deserialize(rest, %{acc | first_name: value})
    end
    defp(deserialize(<<11, 4::16-signed, string_size::32-signed, value::binary-size(string_size), rest::binary>>, acc)) do
      deserialize(rest, %{acc | last_name: value})
    end
    defp(deserialize(<<field_type, _id::16-signed, rest::binary>>, acc)) do
      rest |> Thrift.Protocol.Binary.skip_field(field_type) |> deserialize(acc)
    end
    defp(deserialize(_, _)) do
      :error
    end
    def(serialize(%Thrift.Test.User{id: id, username: username, first_name: first_name, last_name: last_name})) do
      [case(id) do
        nil ->
          <<>>
        _ ->
          <<10, 1::16-signed, id::64-signed>>
      end, case(username) do
        nil ->
          <<>>
        _ ->
          [<<11, 2::16-signed, byte_size(username)::32-signed>> | username]
      end, case(first_name) do
        nil ->
          <<>>
        _ ->
          [<<11, 3::16-signed, byte_size(first_name)::32-signed>> | first_name]
      end, case(last_name) do
        nil ->
          <<>>
        _ ->
          [<<11, 4::16-signed, byte_size(last_name)::32-signed>> | last_name]
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