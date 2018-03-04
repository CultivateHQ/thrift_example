defmodule(Thrift.Generator.BinaryProtocolTest.IncludesConstants) do
  _ = "Auto-generated Thrift struct includes_constants.IncludesConstants"
  _ = "1: string name"
  _ = "2: i8 z"
  defstruct(name: nil, z: 26)
  @type(t :: %__MODULE__{})
  def(new) do
    %__MODULE__{}
  end
  defmodule(BinaryProtocol) do
    @moduledoc(false)
    def(deserialize(binary)) do
      deserialize(binary, %Thrift.Generator.BinaryProtocolTest.IncludesConstants{})
    end
    defp(deserialize(<<0, rest::binary>>, %Thrift.Generator.BinaryProtocolTest.IncludesConstants{} = acc)) do
      {acc, rest}
    end
    defp(deserialize(<<11, 1::16-signed, string_size::32-signed, value::binary-size(string_size), rest::binary>>, acc)) do
      deserialize(rest, %{acc | name: value})
    end
    defp(deserialize(<<3, 2::16-signed, value::8-signed, rest::binary>>, acc)) do
      deserialize(rest, %{acc | z: value})
    end
    defp(deserialize(<<field_type, _id::16-signed, rest::binary>>, acc)) do
      rest |> Thrift.Protocol.Binary.skip_field(field_type) |> deserialize(acc)
    end
    defp(deserialize(_, _)) do
      :error
    end
    def(serialize(%Thrift.Generator.BinaryProtocolTest.IncludesConstants{name: name, z: z})) do
      [case(name) do
        nil ->
          <<>>
        _ ->
          [<<11, 1::16-signed, byte_size(name)::32-signed>> | name]
      end, case(z) do
        nil ->
          <<>>
        _ ->
          <<3, 2::16-signed, z::8-signed>>
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