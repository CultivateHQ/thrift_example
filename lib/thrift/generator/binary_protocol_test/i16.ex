defmodule(Thrift.Generator.BinaryProtocolTest.I16) do
  _ = "Auto-generated Thrift struct i16.I16"
  _ = "1: i16 val"
  _ = "2: map<i16,i16> val_map"
  _ = "3: set<i16> val_set"
  _ = "4: list<i16> val_list"
  defstruct(val: nil, val_map: nil, val_set: nil, val_list: nil)
  @type(t :: %__MODULE__{})
  def(new) do
    %__MODULE__{}
  end
  defmodule(BinaryProtocol) do
    @moduledoc(false)
    def(deserialize(binary)) do
      deserialize(binary, %Thrift.Generator.BinaryProtocolTest.I16{})
    end
    defp(deserialize(<<0, rest::binary>>, %Thrift.Generator.BinaryProtocolTest.I16{} = acc)) do
      {acc, rest}
    end
    defp(deserialize(<<6, 1::16-signed, value::16-signed, rest::binary>>, acc)) do
      deserialize(rest, %{acc | val: value})
    end
    defp(deserialize(<<13, 2::16-signed, 6, 6, map_size::32-signed, rest::binary>>, struct)) do
      deserialize__val_map__key(rest, [%{}, map_size, struct])
    end
    defp(deserialize(<<14, 3::16-signed, 6, remaining::32-signed, rest::binary>>, struct)) do
      deserialize__val_set(rest, [[], remaining, struct])
    end
    defp(deserialize(<<15, 4::16-signed, 6, remaining::32-signed, rest::binary>>, struct)) do
      deserialize__val_list(rest, [[], remaining, struct])
    end
    defp(deserialize(<<field_type, _id::16-signed, rest::binary>>, acc)) do
      rest |> Thrift.Protocol.Binary.skip_field(field_type) |> deserialize(acc)
    end
    defp(deserialize(_, _)) do
      :error
    end
    defp(deserialize__val_list(<<rest::binary>>, [list, 0, struct])) do
      deserialize(rest, %{struct | val_list: Enum.reverse(list)})
    end
    defp(deserialize__val_list(<<element::16-signed, rest::binary>>, [list, remaining | stack])) do
      deserialize__val_list(rest, [[element | list], remaining - 1 | stack])
    end
    defp(deserialize__val_list(_, _)) do
      :error
    end
    defp(deserialize__val_map__key(<<rest::binary>>, [map, 0, struct])) do
      deserialize(rest, %{struct | val_map: map})
    end
    defp(deserialize__val_map__key(<<key::16-signed, rest::binary>>, stack)) do
      deserialize__val_map__value(rest, key, stack)
    end
    defp(deserialize__val_map__key(_, _)) do
      :error
    end
    defp(deserialize__val_map__value(<<value::16-signed, rest::binary>>, key, [map, remaining | stack])) do
      deserialize__val_map__key(rest, [Map.put(map, key, value), remaining - 1 | stack])
    end
    defp(deserialize__val_map__value(_, _, _)) do
      :error
    end
    defp(deserialize__val_set(<<rest::binary>>, [list, 0, struct])) do
      deserialize(rest, %{struct | val_set: MapSet.new(list)})
    end
    defp(deserialize__val_set(<<element::16-signed, rest::binary>>, [list, remaining | stack])) do
      deserialize__val_set(rest, [[element | list], remaining - 1 | stack])
    end
    defp(deserialize__val_set(_, _)) do
      :error
    end
    def(serialize(%Thrift.Generator.BinaryProtocolTest.I16{val: val, val_map: val_map, val_set: val_set, val_list: val_list})) do
      [case(val) do
        nil ->
          <<>>
        _ ->
          <<6, 1::16-signed, val::16-signed>>
      end, case(val_map) do
        nil ->
          <<>>
        _ ->
          [<<13, 2::16-signed, 6, 6, Enum.count(val_map)::32-signed>> | for({k, v} <- val_map) do
            <<k::16-signed, v::16-signed>>
          end]
      end, case(val_set) do
        nil ->
          <<>>
        _ ->
          [<<14, 3::16-signed, 6, Enum.count(val_set)::32-signed>> | for(e <- val_set) do
            <<e::16-signed>>
          end]
      end, case(val_list) do
        nil ->
          <<>>
        _ ->
          [<<15, 4::16-signed, 6, length(val_list)::32-signed>> | for(e <- val_list) do
            <<e::16-signed>>
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