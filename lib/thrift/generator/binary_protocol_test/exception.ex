defmodule(Thrift.Generator.BinaryProtocolTest.Exception) do
  _ = "Auto-generated Thrift struct exception.Exception"
  _ = "1: exception.Ex val"
  _ = "2: map<exception.Ex,exception.Ex> val_map"
  _ = "3: set<exception.Ex> val_set"
  _ = "4: list<exception.Ex> val_list"
  defstruct(val: nil, val_map: nil, val_set: nil, val_list: nil)
  @type(t :: %__MODULE__{})
  def(new) do
    %__MODULE__{}
  end
  defmodule(BinaryProtocol) do
    @moduledoc(false)
    def(deserialize(binary)) do
      deserialize(binary, %Thrift.Generator.BinaryProtocolTest.Exception{})
    end
    defp(deserialize(<<0, rest::binary>>, %Thrift.Generator.BinaryProtocolTest.Exception{} = acc)) do
      {acc, rest}
    end
    defp(deserialize(<<12, 1::16-signed, rest::binary>>, acc)) do
      case(Elixir.Thrift.Generator.BinaryProtocolTest.Ex.BinaryProtocol.deserialize(rest)) do
        {value, rest} ->
          deserialize(rest, %{acc | val: value})
        :error ->
          :error
      end
    end
    defp(deserialize(<<13, 2::16-signed, 12, 12, map_size::32-signed, rest::binary>>, struct)) do
      deserialize__val_map__key(rest, [%{}, map_size, struct])
    end
    defp(deserialize(<<14, 3::16-signed, 12, remaining::32-signed, rest::binary>>, struct)) do
      deserialize__val_set(rest, [[], remaining, struct])
    end
    defp(deserialize(<<15, 4::16-signed, 12, remaining::32-signed, rest::binary>>, struct)) do
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
    defp(deserialize__val_list(<<rest::binary>>, [list, remaining | stack])) do
      case(Elixir.Thrift.Generator.BinaryProtocolTest.Ex.BinaryProtocol.deserialize(rest)) do
        {element, rest} ->
          deserialize__val_list(rest, [[element | list], remaining - 1 | stack])
        :error ->
          :error
      end
    end
    defp(deserialize__val_list(_, _)) do
      :error
    end
    defp(deserialize__val_map__key(<<rest::binary>>, [map, 0, struct])) do
      deserialize(rest, %{struct | val_map: map})
    end
    defp(deserialize__val_map__key(<<rest::binary>>, stack)) do
      case(Elixir.Thrift.Generator.BinaryProtocolTest.Ex.BinaryProtocol.deserialize(rest)) do
        {key, rest} ->
          deserialize__val_map__value(rest, key, stack)
        :error ->
          :error
      end
    end
    defp(deserialize__val_map__key(_, _)) do
      :error
    end
    defp(deserialize__val_map__value(<<rest::binary>>, key, [map, remaining | stack])) do
      case(Elixir.Thrift.Generator.BinaryProtocolTest.Ex.BinaryProtocol.deserialize(rest)) do
        {value, rest} ->
          deserialize__val_map__key(rest, [Map.put(map, key, value), remaining - 1 | stack])
        :error ->
          :error
      end
    end
    defp(deserialize__val_map__value(_, _, _)) do
      :error
    end
    defp(deserialize__val_set(<<rest::binary>>, [list, 0, struct])) do
      deserialize(rest, %{struct | val_set: MapSet.new(list)})
    end
    defp(deserialize__val_set(<<rest::binary>>, [list, remaining | stack])) do
      case(Elixir.Thrift.Generator.BinaryProtocolTest.Ex.BinaryProtocol.deserialize(rest)) do
        {element, rest} ->
          deserialize__val_set(rest, [[element | list], remaining - 1 | stack])
        :error ->
          :error
      end
    end
    defp(deserialize__val_set(_, _)) do
      :error
    end
    def(serialize(%Thrift.Generator.BinaryProtocolTest.Exception{val: val, val_map: val_map, val_set: val_set, val_list: val_list})) do
      [case(val) do
        nil ->
          <<>>
        _ ->
          [<<12, 1::16-signed>> | Thrift.Generator.BinaryProtocolTest.Ex.serialize(val)]
      end, case(val_map) do
        nil ->
          <<>>
        _ ->
          [<<13, 2::16-signed, 12, 12, Enum.count(val_map)::32-signed>> | for({k, v} <- val_map) do
            [Thrift.Generator.BinaryProtocolTest.Ex.serialize(k) | Thrift.Generator.BinaryProtocolTest.Ex.serialize(v)]
          end]
      end, case(val_set) do
        nil ->
          <<>>
        _ ->
          [<<14, 3::16-signed, 12, Enum.count(val_set)::32-signed>> | for(e <- val_set) do
            Thrift.Generator.BinaryProtocolTest.Ex.serialize(e)
          end]
      end, case(val_list) do
        nil ->
          <<>>
        _ ->
          [<<15, 4::16-signed, 12, length(val_list)::32-signed>> | for(e <- val_list) do
            Thrift.Generator.BinaryProtocolTest.Ex.serialize(e)
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