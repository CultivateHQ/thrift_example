defmodule(Thrift.Generator.BinaryProtocolTest.UStruct) do
  _ = "Auto-generated Thrift struct unions.UStruct"
  _ = "1: unions.Union my_union"
  _ = "2: map<unions.Union,unions.Union> u_map"
  _ = "3: set<unions.Union> u_set"
  _ = "4: list<unions.Union> u_list"
  defstruct(my_union: nil, u_map: nil, u_set: nil, u_list: nil)
  @type(t :: %__MODULE__{})
  def(new) do
    %__MODULE__{}
  end
  defmodule(BinaryProtocol) do
    @moduledoc(false)
    def(deserialize(binary)) do
      deserialize(binary, %Thrift.Generator.BinaryProtocolTest.UStruct{})
    end
    defp(deserialize(<<0, rest::binary>>, %Thrift.Generator.BinaryProtocolTest.UStruct{} = acc)) do
      {acc, rest}
    end
    defp(deserialize(<<12, 1::16-signed, rest::binary>>, acc)) do
      case(Elixir.Thrift.Generator.BinaryProtocolTest.Union.BinaryProtocol.deserialize(rest)) do
        {value, rest} ->
          deserialize(rest, %{acc | my_union: value})
        :error ->
          :error
      end
    end
    defp(deserialize(<<13, 2::16-signed, 12, 12, map_size::32-signed, rest::binary>>, struct)) do
      deserialize__u_map__key(rest, [%{}, map_size, struct])
    end
    defp(deserialize(<<14, 3::16-signed, 12, remaining::32-signed, rest::binary>>, struct)) do
      deserialize__u_set(rest, [[], remaining, struct])
    end
    defp(deserialize(<<15, 4::16-signed, 12, remaining::32-signed, rest::binary>>, struct)) do
      deserialize__u_list(rest, [[], remaining, struct])
    end
    defp(deserialize(<<field_type, _id::16-signed, rest::binary>>, acc)) do
      rest |> Thrift.Protocol.Binary.skip_field(field_type) |> deserialize(acc)
    end
    defp(deserialize(_, _)) do
      :error
    end
    defp(deserialize__u_list(<<rest::binary>>, [list, 0, struct])) do
      deserialize(rest, %{struct | u_list: Enum.reverse(list)})
    end
    defp(deserialize__u_list(<<rest::binary>>, [list, remaining | stack])) do
      case(Elixir.Thrift.Generator.BinaryProtocolTest.Union.BinaryProtocol.deserialize(rest)) do
        {element, rest} ->
          deserialize__u_list(rest, [[element | list], remaining - 1 | stack])
        :error ->
          :error
      end
    end
    defp(deserialize__u_list(_, _)) do
      :error
    end
    defp(deserialize__u_map__key(<<rest::binary>>, [map, 0, struct])) do
      deserialize(rest, %{struct | u_map: map})
    end
    defp(deserialize__u_map__key(<<rest::binary>>, stack)) do
      case(Elixir.Thrift.Generator.BinaryProtocolTest.Union.BinaryProtocol.deserialize(rest)) do
        {key, rest} ->
          deserialize__u_map__value(rest, key, stack)
        :error ->
          :error
      end
    end
    defp(deserialize__u_map__key(_, _)) do
      :error
    end
    defp(deserialize__u_map__value(<<rest::binary>>, key, [map, remaining | stack])) do
      case(Elixir.Thrift.Generator.BinaryProtocolTest.Union.BinaryProtocol.deserialize(rest)) do
        {value, rest} ->
          deserialize__u_map__key(rest, [Map.put(map, key, value), remaining - 1 | stack])
        :error ->
          :error
      end
    end
    defp(deserialize__u_map__value(_, _, _)) do
      :error
    end
    defp(deserialize__u_set(<<rest::binary>>, [list, 0, struct])) do
      deserialize(rest, %{struct | u_set: MapSet.new(list)})
    end
    defp(deserialize__u_set(<<rest::binary>>, [list, remaining | stack])) do
      case(Elixir.Thrift.Generator.BinaryProtocolTest.Union.BinaryProtocol.deserialize(rest)) do
        {element, rest} ->
          deserialize__u_set(rest, [[element | list], remaining - 1 | stack])
        :error ->
          :error
      end
    end
    defp(deserialize__u_set(_, _)) do
      :error
    end
    def(serialize(%Thrift.Generator.BinaryProtocolTest.UStruct{my_union: my_union, u_map: u_map, u_set: u_set, u_list: u_list})) do
      [case(my_union) do
        nil ->
          <<>>
        _ ->
          [<<12, 1::16-signed>> | Thrift.Generator.BinaryProtocolTest.Union.serialize(my_union)]
      end, case(u_map) do
        nil ->
          <<>>
        _ ->
          [<<13, 2::16-signed, 12, 12, Enum.count(u_map)::32-signed>> | for({k, v} <- u_map) do
            [Thrift.Generator.BinaryProtocolTest.Union.serialize(k) | Thrift.Generator.BinaryProtocolTest.Union.serialize(v)]
          end]
      end, case(u_set) do
        nil ->
          <<>>
        _ ->
          [<<14, 3::16-signed, 12, Enum.count(u_set)::32-signed>> | for(e <- u_set) do
            Thrift.Generator.BinaryProtocolTest.Union.serialize(e)
          end]
      end, case(u_list) do
        nil ->
          <<>>
        _ ->
          [<<15, 4::16-signed, 12, length(u_list)::32-signed>> | for(e <- u_list) do
            Thrift.Generator.BinaryProtocolTest.Union.serialize(e)
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