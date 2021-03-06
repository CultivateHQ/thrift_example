defmodule(Thrift.Generator.BinaryProtocolTest.SomeOtherName) do
  _ = "Auto-generated Thrift struct also_includes.SomeOtherName"
  _ = "1: i32 id"
  defstruct(id: nil)
  @type(t :: %__MODULE__{})
  def(new) do
    %__MODULE__{}
  end
  defmodule(BinaryProtocol) do
    @moduledoc(false)
    def(deserialize(binary)) do
      deserialize(binary, %Thrift.Generator.BinaryProtocolTest.SomeOtherName{})
    end
    defp(deserialize(<<0, rest::binary>>, %Thrift.Generator.BinaryProtocolTest.SomeOtherName{} = acc)) do
      {acc, rest}
    end
    defp(deserialize(<<8, 1::16-signed, value::32-signed, rest::binary>>, acc)) do
      deserialize(rest, %{acc | id: value})
    end
    defp(deserialize(<<field_type, _id::16-signed, rest::binary>>, acc)) do
      rest |> Thrift.Protocol.Binary.skip_field(field_type) |> deserialize(acc)
    end
    defp(deserialize(_, _)) do
      :error
    end
    def(serialize(%Thrift.Generator.BinaryProtocolTest.SomeOtherName{id: id})) do
      [case(id) do
        nil ->
          <<>>
        _ ->
          <<8, 1::16-signed, id::32-signed>>
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