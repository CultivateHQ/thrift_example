defmodule(Thrift.Generator.BinaryProtocolTest.Ex) do
  _ = "Auto-generated Thrift exception exception.Ex"
  _ = "1: string message"
  _ = "99: i8 num"
  defexception(message: nil, num: nil)
  @type(t :: %__MODULE__{})
  def(new) do
    %__MODULE__{}
  end
  defmodule(BinaryProtocol) do
    @moduledoc(false)
    def(deserialize(binary)) do
      deserialize(binary, %Thrift.Generator.BinaryProtocolTest.Ex{})
    end
    defp(deserialize(<<0, rest::binary>>, %Thrift.Generator.BinaryProtocolTest.Ex{} = acc)) do
      {acc, rest}
    end
    defp(deserialize(<<11, 1::16-signed, string_size::32-signed, value::binary-size(string_size), rest::binary>>, acc)) do
      deserialize(rest, %{acc | message: value})
    end
    defp(deserialize(<<3, 99::16-signed, value::8-signed, rest::binary>>, acc)) do
      deserialize(rest, %{acc | num: value})
    end
    defp(deserialize(<<field_type, _id::16-signed, rest::binary>>, acc)) do
      rest |> Thrift.Protocol.Binary.skip_field(field_type) |> deserialize(acc)
    end
    defp(deserialize(_, _)) do
      :error
    end
    def(serialize(%Thrift.Generator.BinaryProtocolTest.Ex{message: message, num: num})) do
      [case(message) do
        nil ->
          <<>>
        _ ->
          [<<11, 1::16-signed, byte_size(message)::32-signed>> | message]
      end, case(num) do
        nil ->
          <<>>
        _ ->
          <<3, 99::16-signed, num::8-signed>>
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