defmodule(Thrift.Generator.BinaryProtocolTest.AdditionalMappings) do
  _ = "Auto-generated Thrift struct chocolate.AdditionalMappings"
  _ = "1: map<additions.ChocolateAdditionsType,string> mapping"
  defstruct(mapping: %{1 => "almonds", 2 => "nougat"})
  @type(t :: %__MODULE__{})
  def(new) do
    %__MODULE__{}
  end
  defmodule(BinaryProtocol) do
    @moduledoc(false)
    def(deserialize(binary)) do
      deserialize(binary, %Thrift.Generator.BinaryProtocolTest.AdditionalMappings{})
    end
    defp(deserialize(<<0, rest::binary>>, %Thrift.Generator.BinaryProtocolTest.AdditionalMappings{} = acc)) do
      {acc, rest}
    end
    defp(deserialize(<<13, 1::16-signed, 8, 11, map_size::32-signed, rest::binary>>, struct)) do
      deserialize__mapping__key(rest, [%{}, map_size, struct])
    end
    defp(deserialize(<<field_type, _id::16-signed, rest::binary>>, acc)) do
      rest |> Thrift.Protocol.Binary.skip_field(field_type) |> deserialize(acc)
    end
    defp(deserialize(_, _)) do
      :error
    end
    defp(deserialize__mapping__key(<<rest::binary>>, [map, 0, struct])) do
      deserialize(rest, %{struct | mapping: map})
    end
    defp(deserialize__mapping__key(<<key::32-signed, rest::binary>>, stack)) do
      deserialize__mapping__value(rest, key, stack)
    end
    defp(deserialize__mapping__key(_, _)) do
      :error
    end
    defp(deserialize__mapping__value(<<string_size::32-signed, value::binary-size(string_size), rest::binary>>, key, [map, remaining | stack])) do
      deserialize__mapping__key(rest, [Map.put(map, key, value), remaining - 1 | stack])
    end
    defp(deserialize__mapping__value(_, _, _)) do
      :error
    end
    def(serialize(%Thrift.Generator.BinaryProtocolTest.AdditionalMappings{mapping: mapping})) do
      [case(mapping) do
        nil ->
          <<>>
        _ ->
          [<<13, 1::16-signed, 8, 11, Enum.count(mapping)::32-signed>> | for({k, v} <- mapping) do
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