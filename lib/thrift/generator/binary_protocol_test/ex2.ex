defmodule(Thrift.Generator.BinaryProtocolTest.Ex2) do
  _ = "Auto-generated Thrift exception exception.Ex2"
  _ = "1: i16 error_code"
  defexception(error_code: nil)
  @type(t :: %__MODULE__{})
  def(new) do
    %__MODULE__{}
  end
  (
    @spec(message(Exception.t()) :: String.t())
    def(message(exception)) do
      inspect(exception)
    end
  )
  defmodule(BinaryProtocol) do
    @moduledoc(false)
    def(deserialize(binary)) do
      deserialize(binary, %Thrift.Generator.BinaryProtocolTest.Ex2{})
    end
    defp(deserialize(<<0, rest::binary>>, %Thrift.Generator.BinaryProtocolTest.Ex2{} = acc)) do
      {acc, rest}
    end
    defp(deserialize(<<6, 1::16-signed, value::16-signed, rest::binary>>, acc)) do
      deserialize(rest, %{acc | error_code: value})
    end
    defp(deserialize(<<field_type, _id::16-signed, rest::binary>>, acc)) do
      rest |> Thrift.Protocol.Binary.skip_field(field_type) |> deserialize(acc)
    end
    defp(deserialize(_, _)) do
      :error
    end
    def(serialize(%Thrift.Generator.BinaryProtocolTest.Ex2{error_code: error_code})) do
      [case(error_code) do
        nil ->
          <<>>
        _ ->
          <<6, 1::16-signed, error_code::16-signed>>
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