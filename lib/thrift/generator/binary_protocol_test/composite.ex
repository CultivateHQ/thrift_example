defmodule(Thrift.Generator.BinaryProtocolTest.Composite) do
  _ = "Auto-generated Thrift struct composite.Composite"
  _ = "1: map<map<i8,i8>,map<i8,i8>> map_of_maps"
  _ = "2: map<set<i8>,set<i8>> map_of_sets"
  _ = "3: map<list<i8>,list<i8>> map_of_lists"
  _ = "4: set<map<i8,i8>> set_of_maps"
  _ = "5: set<set<i8>> set_of_sets"
  _ = "6: set<list<i8>> set_of_lists"
  _ = "7: list<map<i8,i8>> list_of_maps"
  _ = "8: list<set<i8>> list_of_sets"
  _ = "9: list<list<i8>> list_of_lists"
  defstruct(map_of_maps: nil, map_of_sets: nil, map_of_lists: nil, set_of_maps: nil, set_of_sets: nil, set_of_lists: nil, list_of_maps: nil, list_of_sets: nil, list_of_lists: nil)
  @type(t :: %__MODULE__{})
  def(new) do
    %__MODULE__{}
  end
  defmodule(BinaryProtocol) do
    @moduledoc(false)
    def(deserialize(binary)) do
      deserialize(binary, %Thrift.Generator.BinaryProtocolTest.Composite{})
    end
    defp(deserialize(<<0, rest::binary>>, %Thrift.Generator.BinaryProtocolTest.Composite{} = acc)) do
      {acc, rest}
    end
    defp(deserialize(<<13, 1::16-signed, 13, 13, map_size::32-signed, rest::binary>>, struct)) do
      deserialize__map_of_maps__key(rest, [%{}, map_size, struct])
    end
    defp(deserialize(<<13, 2::16-signed, 14, 14, map_size::32-signed, rest::binary>>, struct)) do
      deserialize__map_of_sets__key(rest, [%{}, map_size, struct])
    end
    defp(deserialize(<<13, 3::16-signed, 15, 15, map_size::32-signed, rest::binary>>, struct)) do
      deserialize__map_of_lists__key(rest, [%{}, map_size, struct])
    end
    defp(deserialize(<<14, 4::16-signed, 13, remaining::32-signed, rest::binary>>, struct)) do
      deserialize__set_of_maps(rest, [[], remaining, struct])
    end
    defp(deserialize(<<14, 5::16-signed, 14, remaining::32-signed, rest::binary>>, struct)) do
      deserialize__set_of_sets(rest, [[], remaining, struct])
    end
    defp(deserialize(<<14, 6::16-signed, 15, remaining::32-signed, rest::binary>>, struct)) do
      deserialize__set_of_lists(rest, [[], remaining, struct])
    end
    defp(deserialize(<<15, 7::16-signed, 13, remaining::32-signed, rest::binary>>, struct)) do
      deserialize__list_of_maps(rest, [[], remaining, struct])
    end
    defp(deserialize(<<15, 8::16-signed, 14, remaining::32-signed, rest::binary>>, struct)) do
      deserialize__list_of_sets(rest, [[], remaining, struct])
    end
    defp(deserialize(<<15, 9::16-signed, 15, remaining::32-signed, rest::binary>>, struct)) do
      deserialize__list_of_lists(rest, [[], remaining, struct])
    end
    defp(deserialize(<<field_type, _id::16-signed, rest::binary>>, acc)) do
      rest |> Thrift.Protocol.Binary.skip_field(field_type) |> deserialize(acc)
    end
    defp(deserialize(_, _)) do
      :error
    end
    defp(deserialize__list_of_lists(<<rest::binary>>, [list, 0, struct])) do
      deserialize(rest, %{struct | list_of_lists: Enum.reverse(list)})
    end
    defp(deserialize__list_of_lists(<<3, inner_remaining::32-signed, rest::binary>>, [list, remaining | stack])) do
      deserialize__list_of_lists__element(rest, [[], inner_remaining, list, remaining | stack])
    end
    defp(deserialize__list_of_lists(_, _)) do
      :error
    end
    defp(deserialize__list_of_lists__element(<<rest::binary>>, [inner_list, 0, list, remaining | stack])) do
      deserialize__list_of_lists(rest, [[Enum.reverse(inner_list) | list], remaining - 1 | stack])
    end
    defp(deserialize__list_of_lists__element(<<element::8-signed, rest::binary>>, [list, remaining | stack])) do
      deserialize__list_of_lists__element(rest, [[element | list], remaining - 1 | stack])
    end
    defp(deserialize__list_of_lists__element(_, _)) do
      :error
    end
    defp(deserialize__list_of_maps(<<rest::binary>>, [list, 0, struct])) do
      deserialize(rest, %{struct | list_of_maps: Enum.reverse(list)})
    end
    defp(deserialize__list_of_maps(<<3, 3, inner_remaining::32-signed, rest::binary>>, [list, remaining | stack])) do
      deserialize__list_of_maps__key(rest, [%{}, inner_remaining, list, remaining | stack])
    end
    defp(deserialize__list_of_maps(_, _)) do
      :error
    end
    defp(deserialize__list_of_maps__key(<<rest::binary>>, [map, 0, list, remaining | stack])) do
      deserialize__list_of_maps(rest, [[map | list], remaining - 1 | stack])
    end
    defp(deserialize__list_of_maps__key(<<key::8-signed, rest::binary>>, stack)) do
      deserialize__list_of_maps__value(rest, key, stack)
    end
    defp(deserialize__list_of_maps__key(_, _)) do
      :error
    end
    defp(deserialize__list_of_maps__value(<<value::8-signed, rest::binary>>, key, [map, remaining | stack])) do
      deserialize__list_of_maps__key(rest, [Map.put(map, key, value), remaining - 1 | stack])
    end
    defp(deserialize__list_of_maps__value(_, _, _)) do
      :error
    end
    defp(deserialize__list_of_sets(<<rest::binary>>, [list, 0, struct])) do
      deserialize(rest, %{struct | list_of_sets: Enum.reverse(list)})
    end
    defp(deserialize__list_of_sets(<<3, inner_remaining::32-signed, rest::binary>>, [list, remaining | stack])) do
      deserialize__list_of_sets__element(rest, [[], inner_remaining, list, remaining | stack])
    end
    defp(deserialize__list_of_sets(_, _)) do
      :error
    end
    defp(deserialize__list_of_sets__element(<<rest::binary>>, [inner_list, 0, list, remaining | stack])) do
      deserialize__list_of_sets(rest, [[MapSet.new(inner_list) | list], remaining - 1 | stack])
    end
    defp(deserialize__list_of_sets__element(<<element::8-signed, rest::binary>>, [list, remaining | stack])) do
      deserialize__list_of_sets__element(rest, [[element | list], remaining - 1 | stack])
    end
    defp(deserialize__list_of_sets__element(_, _)) do
      :error
    end
    defp(deserialize__map_of_lists__key(<<rest::binary>>, [map, 0, struct])) do
      deserialize(rest, %{struct | map_of_lists: map})
    end
    defp(deserialize__map_of_lists__key(<<3, remaining::32-signed, rest::binary>>, stack)) do
      deserialize__map_of_lists__key__element(rest, [[], remaining | stack])
    end
    defp(deserialize__map_of_lists__key(_, _)) do
      :error
    end
    defp(deserialize__map_of_lists__key__element(<<rest::binary>>, [key, 0 | stack])) do
      deserialize__map_of_lists__value(rest, Enum.reverse(key), stack)
    end
    defp(deserialize__map_of_lists__key__element(<<element::8-signed, rest::binary>>, [list, remaining | stack])) do
      deserialize__map_of_lists__key__element(rest, [[element | list], remaining - 1 | stack])
    end
    defp(deserialize__map_of_lists__key__element(_, _)) do
      :error
    end
    defp(deserialize__map_of_lists__value(<<3, remaining::32-signed, rest::binary>>, key, stack)) do
      deserialize__map_of_lists__value__element(rest, [[], remaining, key | stack])
    end
    defp(deserialize__map_of_lists__value(_, _, _)) do
      :error
    end
    defp(deserialize__map_of_lists__value__element(<<rest::binary>>, [value, 0, key, map, remaining | stack])) do
      deserialize__map_of_lists__key(rest, [Map.put(map, key, Enum.reverse(value)), remaining - 1 | stack])
    end
    defp(deserialize__map_of_lists__value__element(<<element::8-signed, rest::binary>>, [list, remaining | stack])) do
      deserialize__map_of_lists__value__element(rest, [[element | list], remaining - 1 | stack])
    end
    defp(deserialize__map_of_lists__value__element(_, _)) do
      :error
    end
    defp(deserialize__map_of_maps__key(<<rest::binary>>, [map, 0, struct])) do
      deserialize(rest, %{struct | map_of_maps: map})
    end
    defp(deserialize__map_of_maps__key(<<3, 3, remaining::32-signed, rest::binary>>, stack)) do
      deserialize__map_of_maps__key__key(rest, [%{}, remaining | stack])
    end
    defp(deserialize__map_of_maps__key(_, _)) do
      :error
    end
    defp(deserialize__map_of_maps__key__key(<<rest::binary>>, [key, 0 | stack])) do
      deserialize__map_of_maps__value(rest, key, stack)
    end
    defp(deserialize__map_of_maps__key__key(<<key::8-signed, rest::binary>>, stack)) do
      deserialize__map_of_maps__key__value(rest, key, stack)
    end
    defp(deserialize__map_of_maps__key__key(_, _)) do
      :error
    end
    defp(deserialize__map_of_maps__key__value(<<value::8-signed, rest::binary>>, key, [map, remaining | stack])) do
      deserialize__map_of_maps__key__key(rest, [Map.put(map, key, value), remaining - 1 | stack])
    end
    defp(deserialize__map_of_maps__key__value(_, _, _)) do
      :error
    end
    defp(deserialize__map_of_maps__value(<<3, 3, remaining::32-signed, rest::binary>>, key, stack)) do
      deserialize__map_of_maps__value__key(rest, [%{}, remaining, key | stack])
    end
    defp(deserialize__map_of_maps__value(_, _, _)) do
      :error
    end
    defp(deserialize__map_of_maps__value__key(<<rest::binary>>, [value, 0, key, map, remaining | stack])) do
      deserialize__map_of_maps__key(rest, [Map.put(map, key, value), remaining - 1 | stack])
    end
    defp(deserialize__map_of_maps__value__key(<<key::8-signed, rest::binary>>, stack)) do
      deserialize__map_of_maps__value__value(rest, key, stack)
    end
    defp(deserialize__map_of_maps__value__key(_, _)) do
      :error
    end
    defp(deserialize__map_of_maps__value__value(<<value::8-signed, rest::binary>>, key, [map, remaining | stack])) do
      deserialize__map_of_maps__value__key(rest, [Map.put(map, key, value), remaining - 1 | stack])
    end
    defp(deserialize__map_of_maps__value__value(_, _, _)) do
      :error
    end
    defp(deserialize__map_of_sets__key(<<rest::binary>>, [map, 0, struct])) do
      deserialize(rest, %{struct | map_of_sets: map})
    end
    defp(deserialize__map_of_sets__key(<<3, remaining::32-signed, rest::binary>>, stack)) do
      deserialize__map_of_sets__key__element(rest, [[], remaining | stack])
    end
    defp(deserialize__map_of_sets__key(_, _)) do
      :error
    end
    defp(deserialize__map_of_sets__key__element(<<rest::binary>>, [key, 0 | stack])) do
      deserialize__map_of_sets__value(rest, MapSet.new(key), stack)
    end
    defp(deserialize__map_of_sets__key__element(<<element::8-signed, rest::binary>>, [list, remaining | stack])) do
      deserialize__map_of_sets__key__element(rest, [[element | list], remaining - 1 | stack])
    end
    defp(deserialize__map_of_sets__key__element(_, _)) do
      :error
    end
    defp(deserialize__map_of_sets__value(<<3, remaining::32-signed, rest::binary>>, key, stack)) do
      deserialize__map_of_sets__value__element(rest, [[], remaining, key | stack])
    end
    defp(deserialize__map_of_sets__value(_, _, _)) do
      :error
    end
    defp(deserialize__map_of_sets__value__element(<<rest::binary>>, [value, 0, key, map, remaining | stack])) do
      deserialize__map_of_sets__key(rest, [Map.put(map, key, MapSet.new(value)), remaining - 1 | stack])
    end
    defp(deserialize__map_of_sets__value__element(<<element::8-signed, rest::binary>>, [list, remaining | stack])) do
      deserialize__map_of_sets__value__element(rest, [[element | list], remaining - 1 | stack])
    end
    defp(deserialize__map_of_sets__value__element(_, _)) do
      :error
    end
    defp(deserialize__set_of_lists(<<rest::binary>>, [list, 0, struct])) do
      deserialize(rest, %{struct | set_of_lists: MapSet.new(list)})
    end
    defp(deserialize__set_of_lists(<<3, inner_remaining::32-signed, rest::binary>>, [list, remaining | stack])) do
      deserialize__set_of_lists__element(rest, [[], inner_remaining, list, remaining | stack])
    end
    defp(deserialize__set_of_lists(_, _)) do
      :error
    end
    defp(deserialize__set_of_lists__element(<<rest::binary>>, [inner_list, 0, list, remaining | stack])) do
      deserialize__set_of_lists(rest, [[Enum.reverse(inner_list) | list], remaining - 1 | stack])
    end
    defp(deserialize__set_of_lists__element(<<element::8-signed, rest::binary>>, [list, remaining | stack])) do
      deserialize__set_of_lists__element(rest, [[element | list], remaining - 1 | stack])
    end
    defp(deserialize__set_of_lists__element(_, _)) do
      :error
    end
    defp(deserialize__set_of_maps(<<rest::binary>>, [list, 0, struct])) do
      deserialize(rest, %{struct | set_of_maps: MapSet.new(list)})
    end
    defp(deserialize__set_of_maps(<<3, 3, inner_remaining::32-signed, rest::binary>>, [list, remaining | stack])) do
      deserialize__set_of_maps__key(rest, [%{}, inner_remaining, list, remaining | stack])
    end
    defp(deserialize__set_of_maps(_, _)) do
      :error
    end
    defp(deserialize__set_of_maps__key(<<rest::binary>>, [map, 0, list, remaining | stack])) do
      deserialize__set_of_maps(rest, [[map | list], remaining - 1 | stack])
    end
    defp(deserialize__set_of_maps__key(<<key::8-signed, rest::binary>>, stack)) do
      deserialize__set_of_maps__value(rest, key, stack)
    end
    defp(deserialize__set_of_maps__key(_, _)) do
      :error
    end
    defp(deserialize__set_of_maps__value(<<value::8-signed, rest::binary>>, key, [map, remaining | stack])) do
      deserialize__set_of_maps__key(rest, [Map.put(map, key, value), remaining - 1 | stack])
    end
    defp(deserialize__set_of_maps__value(_, _, _)) do
      :error
    end
    defp(deserialize__set_of_sets(<<rest::binary>>, [list, 0, struct])) do
      deserialize(rest, %{struct | set_of_sets: MapSet.new(list)})
    end
    defp(deserialize__set_of_sets(<<3, inner_remaining::32-signed, rest::binary>>, [list, remaining | stack])) do
      deserialize__set_of_sets__element(rest, [[], inner_remaining, list, remaining | stack])
    end
    defp(deserialize__set_of_sets(_, _)) do
      :error
    end
    defp(deserialize__set_of_sets__element(<<rest::binary>>, [inner_list, 0, list, remaining | stack])) do
      deserialize__set_of_sets(rest, [[MapSet.new(inner_list) | list], remaining - 1 | stack])
    end
    defp(deserialize__set_of_sets__element(<<element::8-signed, rest::binary>>, [list, remaining | stack])) do
      deserialize__set_of_sets__element(rest, [[element | list], remaining - 1 | stack])
    end
    defp(deserialize__set_of_sets__element(_, _)) do
      :error
    end
    def(serialize(%Thrift.Generator.BinaryProtocolTest.Composite{map_of_maps: map_of_maps, map_of_sets: map_of_sets, map_of_lists: map_of_lists, set_of_maps: set_of_maps, set_of_sets: set_of_sets, set_of_lists: set_of_lists, list_of_maps: list_of_maps, list_of_sets: list_of_sets, list_of_lists: list_of_lists})) do
      [case(map_of_maps) do
        nil ->
          <<>>
        _ ->
          [<<13, 1::16-signed, 13, 13, Enum.count(map_of_maps)::32-signed>> | for({k, v} <- map_of_maps) do
            [<<3, 3, Enum.count(k)::32-signed>>, for({k, v} <- k) do
              <<k::8-signed, v::8-signed>>
            end, <<3, 3, Enum.count(v)::32-signed>> | for({k, v} <- v) do
              <<k::8-signed, v::8-signed>>
            end]
          end]
      end, case(map_of_sets) do
        nil ->
          <<>>
        _ ->
          [<<13, 2::16-signed, 14, 14, Enum.count(map_of_sets)::32-signed>> | for({k, v} <- map_of_sets) do
            [<<3, Enum.count(k)::32-signed>>, for(e <- k) do
              <<e::8-signed>>
            end, <<3, Enum.count(v)::32-signed>> | for(e <- v) do
              <<e::8-signed>>
            end]
          end]
      end, case(map_of_lists) do
        nil ->
          <<>>
        _ ->
          [<<13, 3::16-signed, 15, 15, Enum.count(map_of_lists)::32-signed>> | for({k, v} <- map_of_lists) do
            [<<3, length(k)::32-signed>>, for(e <- k) do
              <<e::8-signed>>
            end, <<3, length(v)::32-signed>> | for(e <- v) do
              <<e::8-signed>>
            end]
          end]
      end, case(set_of_maps) do
        nil ->
          <<>>
        _ ->
          [<<14, 4::16-signed, 13, Enum.count(set_of_maps)::32-signed>> | for(e <- set_of_maps) do
            [<<3, 3, Enum.count(e)::32-signed>> | for({k, v} <- e) do
              <<k::8-signed, v::8-signed>>
            end]
          end]
      end, case(set_of_sets) do
        nil ->
          <<>>
        _ ->
          [<<14, 5::16-signed, 14, Enum.count(set_of_sets)::32-signed>> | for(e <- set_of_sets) do
            [<<3, Enum.count(e)::32-signed>> | for(e <- e) do
              <<e::8-signed>>
            end]
          end]
      end, case(set_of_lists) do
        nil ->
          <<>>
        _ ->
          [<<14, 6::16-signed, 15, Enum.count(set_of_lists)::32-signed>> | for(e <- set_of_lists) do
            [<<3, length(e)::32-signed>> | for(e <- e) do
              <<e::8-signed>>
            end]
          end]
      end, case(list_of_maps) do
        nil ->
          <<>>
        _ ->
          [<<15, 7::16-signed, 13, length(list_of_maps)::32-signed>> | for(e <- list_of_maps) do
            [<<3, 3, Enum.count(e)::32-signed>> | for({k, v} <- e) do
              <<k::8-signed, v::8-signed>>
            end]
          end]
      end, case(list_of_sets) do
        nil ->
          <<>>
        _ ->
          [<<15, 8::16-signed, 14, length(list_of_sets)::32-signed>> | for(e <- list_of_sets) do
            [<<3, Enum.count(e)::32-signed>> | for(e <- e) do
              <<e::8-signed>>
            end]
          end]
      end, case(list_of_lists) do
        nil ->
          <<>>
        _ ->
          [<<15, 9::16-signed, 15, length(list_of_lists)::32-signed>> | for(e <- list_of_lists) do
            [<<3, length(e)::32-signed>> | for(e <- e) do
              <<e::8-signed>>
            end]
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