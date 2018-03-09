defmodule(Thrift.Generator.BinaryProtocolTest.Bool) do
  _ = "Auto-generated Thrift struct bool.Bool"
  _ = "1: bool val"
  _ = "2: map<bool,bool> val_map"
  _ = "3: set<bool> val_set"
  _ = "4: list<bool> val_list"
  _ = "16: bool large_field_id_val"
  defstruct(val: nil, val_map: nil, val_set: nil, val_list: nil, large_field_id_val: nil)
  @type(t :: %__MODULE__{})
  def(new) do
    %__MODULE__{}
  end
  defmodule(BinaryProtocol) do
    @moduledoc(false)
    def(deserialize(binary)) do
      deserialize(binary, %Thrift.Generator.BinaryProtocolTest.Bool{})
    end
    defp(deserialize(<<0, rest::binary>>, %Thrift.Generator.BinaryProtocolTest.Bool{} = acc)) do
      {acc, rest}
    end
    defp(deserialize(<<2, 1::16-signed, 1, rest::binary>>, acc)) do
      deserialize(rest, %{acc | val: true})
    end
    defp(deserialize(<<2, 1::16-signed, 0, rest::binary>>, acc)) do
      deserialize(rest, %{acc | val: false})
    end
    defp(deserialize(<<13, 2::16-signed, 2, 2, map_size::32-signed, rest::binary>>, struct)) do
      deserialize__val_map__key(rest, [%{}, map_size, struct])
    end
    defp(deserialize(<<14, 3::16-signed, 2, remaining::32-signed, rest::binary>>, struct)) do
      deserialize__val_set(rest, [[], remaining, struct])
    end
    defp(deserialize(<<15, 4::16-signed, 2, remaining::32-signed, rest::binary>>, struct)) do
      deserialize__val_list(rest, [[], remaining, struct])
    end
    defp(deserialize(<<2, 16::16-signed, 1, rest::binary>>, acc)) do
      deserialize(rest, %{acc | large_field_id_val: true})
    end
    defp(deserialize(<<2, 16::16-signed, 0, rest::binary>>, acc)) do
      deserialize(rest, %{acc | large_field_id_val: false})
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
    defp(deserialize__val_list(<<0, rest::binary>>, [list, remaining | stack])) do
      deserialize__val_list(rest, [[false | list], remaining - 1 | stack])
    end
    defp(deserialize__val_list(<<1, rest::binary>>, [list, remaining | stack])) do
      deserialize__val_list(rest, [[true | list], remaining - 1 | stack])
    end
    defp(deserialize__val_list(_, _)) do
      :error
    end
    defp(deserialize__val_map__key(<<rest::binary>>, [map, 0, struct])) do
      deserialize(rest, %{struct | val_map: map})
    end
    defp(deserialize__val_map__key(<<0, rest::binary>>, stack)) do
      deserialize__val_map__value(rest, false, stack)
    end
    defp(deserialize__val_map__key(<<1, rest::binary>>, stack)) do
      deserialize__val_map__value(rest, true, stack)
    end
    defp(deserialize__val_map__key(_, _)) do
      :error
    end
    defp(deserialize__val_map__value(<<0, rest::binary>>, key, [map, remaining | stack])) do
      deserialize__val_map__key(rest, [Map.put(map, key, false), remaining - 1 | stack])
    end
    defp(deserialize__val_map__value(<<1, rest::binary>>, key, [map, remaining | stack])) do
      deserialize__val_map__key(rest, [Map.put(map, key, true), remaining - 1 | stack])
    end
    defp(deserialize__val_map__value(_, _, _)) do
      :error
    end
    defp(deserialize__val_set(<<rest::binary>>, [list, 0, struct])) do
      deserialize(rest, %{struct | val_set: MapSet.new(list)})
    end
    defp(deserialize__val_set(<<0, rest::binary>>, [list, remaining | stack])) do
      deserialize__val_set(rest, [[false | list], remaining - 1 | stack])
    end
    defp(deserialize__val_set(<<1, rest::binary>>, [list, remaining | stack])) do
      deserialize__val_set(rest, [[true | list], remaining - 1 | stack])
    end
    defp(deserialize__val_set(_, _)) do
      :error
    end
    def(serialize(%Thrift.Generator.BinaryProtocolTest.Bool{val: val, val_map: val_map, val_set: val_set, val_list: val_list, large_field_id_val: large_field_id_val})) do
      [case(val) do
        nil ->
          <<>>
        false ->
          <<2, 1::16-signed, 0>>
        true ->
          <<2, 1::16-signed, 1>>
        _ ->
          raise(Thrift.InvalidValueError, "Optional boolean field :val on Thrift.Generator.BinaryProtocolTest.Bool must be true, false, or nil")
      end, case(val_map) do
        nil ->
          <<>>
        _ ->
          [<<13, 2::16-signed, 2, 2, Enum.count(val_map)::32-signed>> | for({k, v} <- val_map) do
            [case(k) do
              nil ->
                <<0>>
              false ->
                <<0>>
              _ ->
                <<1>>
            end | case(v) do
              nil ->
                <<0>>
              false ->
                <<0>>
              _ ->
                <<1>>
            end]
          end]
      end, case(val_set) do
        nil ->
          <<>>
        _ ->
          [<<14, 3::16-signed, 2, Enum.count(val_set)::32-signed>> | for(e <- val_set) do
            case(e) do
              nil ->
                <<0>>
              false ->
                <<0>>
              _ ->
                <<1>>
            end
          end]
      end, case(val_list) do
        nil ->
          <<>>
        _ ->
          [<<15, 4::16-signed, 2, length(val_list)::32-signed>> | for(e <- val_list) do
            case(e) do
              nil ->
                <<0>>
              false ->
                <<0>>
              _ ->
                <<1>>
            end
          end]
      end, case(large_field_id_val) do
        nil ->
          <<>>
        false ->
          <<2, 16::16-signed, 0>>
        true ->
          <<2, 16::16-signed, 1>>
        _ ->
          raise(Thrift.InvalidValueError, "Optional boolean field :large_field_id_val on Thrift.Generator.BinaryProtocolTest.Bool must be true, false, or nil")
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