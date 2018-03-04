defmodule(Thrift.Generator.BinaryProtocolTest.DefaultRequiredField) do
  _ = "Auto-generated Thrift struct requiredness.DefaultRequiredField"
  _ = "1: i8 val"
  defstruct(val: nil)
  @type(t :: %__MODULE__{})
  def(new) do
    %__MODULE__{}
  end
  defmodule(BinaryProtocol) do
    @moduledoc(false)
    def(deserialize(binary)) do
      deserialize(binary, %Thrift.Generator.BinaryProtocolTest.DefaultRequiredField{})
    end
    defp(deserialize(<<0, rest::binary>>, %Thrift.Generator.BinaryProtocolTest.DefaultRequiredField{} = acc)) do
      {acc, rest}
    end
    defp(deserialize(<<3, 1::16-signed, value::8-signed, rest::binary>>, acc)) do
      deserialize(rest, %{acc | val: value})
    end
    defp(deserialize(<<field_type, _id::16-signed, rest::binary>>, acc)) do
      rest |> Thrift.Protocol.Binary.skip_field(field_type) |> deserialize(acc)
    end
    defp(deserialize(_, _)) do
      :error
    end
    def(serialize(%Thrift.Generator.BinaryProtocolTest.DefaultRequiredField{val: val})) do
      [case(val) do
        nil ->
          <<>>
        _ ->
          <<3, 1::16-signed, val::8-signed>>
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