defmodule(Thrift.Generator.BinaryProtocolTest.ChocoMappings) do
  _ = "Auto-generated Thrift struct chocolate.ChocoMappings"
  _ = "1: map<additions.ChocolateAdditionsType,string> common_name"
  defstruct(common_name: %{3 => "love"})
  @type(t :: %__MODULE__{})
  def(new) do
    %__MODULE__{}
  end
  defmodule(BinaryProtocol) do
    @moduledoc(false)
    def(deserialize(binary)) do
      deserialize(binary, %Thrift.Generator.BinaryProtocolTest.ChocoMappings{})
    end
    defp(deserialize(<<0, rest::binary>>, %Thrift.Generator.BinaryProtocolTest.ChocoMappings{} = acc)) do
      {acc, rest}
    end
    defp(deserialize(<<13, 1::16-signed, 8, 11, map_size::32-signed, rest::binary>>, struct)) do
      deserialize__common_name__key(rest, [%{}, map_size, struct])
    end
    defp(deserialize(<<field_type, _id::16-signed, rest::binary>>, acc)) do
      rest |> Thrift.Protocol.Binary.skip_field(field_type) |> deserialize(acc)
    end
    defp(deserialize(_, _)) do
      :error
    end
    defp(deserialize__common_name__key(<<rest::binary>>, [map, 0, struct])) do
      deserialize(rest, %{struct | common_name: map})
    end
    defp(deserialize__common_name__key(<<key::32-signed, rest::binary>>, stack)) do
      deserialize__common_name__value(rest, key, stack)
    end
    defp(deserialize__common_name__key(_, _)) do
      :error
    end
    defp(deserialize__common_name__value(<<string_size::32-signed, value::binary-size(string_size), rest::binary>>, key, [map, remaining | stack])) do
      deserialize__common_name__key(rest, [Map.put(map, key, value), remaining - 1 | stack])
    end
    defp(deserialize__common_name__value(_, _, _)) do
      :error
    end
    def(serialize(%Thrift.Generator.BinaryProtocolTest.ChocoMappings{common_name: common_name})) do
      [case(common_name) do
        nil ->
          <<>>
        _ ->
          [<<13, 1::16-signed, 8, 11, Enum.count(common_name)::32-signed>> | for({k, v} <- common_name) do
            [<<k::32-signed, byte_size(v)::32-signed>> | v]
          end]
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