defmodule(Thrift.Generator.BinaryProtocolTest.Defaults) do
  _ = "Auto-generated Thrift struct defaults.Defaults"
  _ = "1: bool bool_from_true"
  _ = "2: bool bool_from_false"
  _ = "3: bool bool_from_one"
  _ = "4: bool bool_from_zero"
  _ = "5: i8 byte_val"
  _ = "6: double double_from_float"
  _ = "7: double double_from_int"
  _ = "8: i16 i16_val"
  _ = "9: i32 i32_val"
  _ = "10: i64 i64_val"
  _ = "11: string string_val"
  _ = "12: defaults.DefaultStructVal struct_val"
  _ = "13: map<string,i8> map_val"
  _ = "14: set<string> set_val"
  _ = "15: list<string> list_val"
  _ = "120: defaults.DefaultStructVal empty_struct"
  _ = "130: map<string,i8> empty_map"
  _ = "140: set<string> empty_set"
  _ = "150: list<string> empty_list"
  defstruct(bool_from_true: true, bool_from_false: false, bool_from_one: true, bool_from_zero: false, byte_val: 5, double_from_float: 0.0, double_from_int: 0, i16_val: 5, i32_val: 5, i64_val: 5, string_val: "abc123", struct_val: %{__struct__: Thrift.Generator.BinaryProtocolTest.DefaultStructVal, num: 5}, map_val: %{"a" => 1, "b" => 2}, set_val: MapSet.new(["a", "b"]), list_val: ["a", "b"], empty_struct: %{__struct__: Thrift.Generator.BinaryProtocolTest.DefaultStructVal, num: nil}, empty_map: %{}, empty_set: MapSet.new([]), empty_list: [])
  @type(t :: %__MODULE__{})
  def(new) do
    %__MODULE__{}
  end
  defmodule(BinaryProtocol) do
    @moduledoc(false)
    def(deserialize(binary)) do
      deserialize(binary, %Thrift.Generator.BinaryProtocolTest.Defaults{})
    end
    defp(deserialize(<<0, rest::binary>>, %Thrift.Generator.BinaryProtocolTest.Defaults{} = acc)) do
      {acc, rest}
    end
    defp(deserialize(<<2, 1::16-signed, 1, rest::binary>>, acc)) do
      deserialize(rest, %{acc | bool_from_true: true})
    end
    defp(deserialize(<<2, 1::16-signed, 0, rest::binary>>, acc)) do
      deserialize(rest, %{acc | bool_from_true: false})
    end
    defp(deserialize(<<2, 2::16-signed, 1, rest::binary>>, acc)) do
      deserialize(rest, %{acc | bool_from_false: true})
    end
    defp(deserialize(<<2, 2::16-signed, 0, rest::binary>>, acc)) do
      deserialize(rest, %{acc | bool_from_false: false})
    end
    defp(deserialize(<<2, 3::16-signed, 1, rest::binary>>, acc)) do
      deserialize(rest, %{acc | bool_from_one: true})
    end
    defp(deserialize(<<2, 3::16-signed, 0, rest::binary>>, acc)) do
      deserialize(rest, %{acc | bool_from_one: false})
    end
    defp(deserialize(<<2, 4::16-signed, 1, rest::binary>>, acc)) do
      deserialize(rest, %{acc | bool_from_zero: true})
    end
    defp(deserialize(<<2, 4::16-signed, 0, rest::binary>>, acc)) do
      deserialize(rest, %{acc | bool_from_zero: false})
    end
    defp(deserialize(<<3, 5::16-signed, value::8-signed, rest::binary>>, acc)) do
      deserialize(rest, %{acc | byte_val: value})
    end
    defp(deserialize(<<4, 6::16-signed, value::float-signed, rest::binary>>, acc)) do
      deserialize(rest, %{acc | double_from_float: value})
    end
    defp(deserialize(<<4, 7::16-signed, value::float-signed, rest::binary>>, acc)) do
      deserialize(rest, %{acc | double_from_int: value})
    end
    defp(deserialize(<<6, 8::16-signed, value::16-signed, rest::binary>>, acc)) do
      deserialize(rest, %{acc | i16_val: value})
    end
    defp(deserialize(<<8, 9::16-signed, value::32-signed, rest::binary>>, acc)) do
      deserialize(rest, %{acc | i32_val: value})
    end
    defp(deserialize(<<10, 10::16-signed, value::64-signed, rest::binary>>, acc)) do
      deserialize(rest, %{acc | i64_val: value})
    end
    defp(deserialize(<<11, 11::16-signed, string_size::32-signed, value::binary-size(string_size), rest::binary>>, acc)) do
      deserialize(rest, %{acc | string_val: value})
    end
    defp(deserialize(<<12, 12::16-signed, rest::binary>>, acc)) do
      case(Elixir.Thrift.Generator.BinaryProtocolTest.DefaultStructVal.BinaryProtocol.deserialize(rest)) do
        {value, rest} ->
          deserialize(rest, %{acc | struct_val: value})
        :error ->
          :error
      end
    end
    defp(deserialize(<<13, 13::16-signed, 11, 3, map_size::32-signed, rest::binary>>, struct)) do
      deserialize__map_val__key(rest, [%{}, map_size, struct])
    end
    defp(deserialize(<<14, 14::16-signed, 11, remaining::32-signed, rest::binary>>, struct)) do
      deserialize__set_val(rest, [[], remaining, struct])
    end
    defp(deserialize(<<15, 15::16-signed, 11, remaining::32-signed, rest::binary>>, struct)) do
      deserialize__list_val(rest, [[], remaining, struct])
    end
    defp(deserialize(<<12, 120::16-signed, rest::binary>>, acc)) do
      case(Elixir.Thrift.Generator.BinaryProtocolTest.DefaultStructVal.BinaryProtocol.deserialize(rest)) do
        {value, rest} ->
          deserialize(rest, %{acc | empty_struct: value})
        :error ->
          :error
      end
    end
    defp(deserialize(<<13, 130::16-signed, 11, 3, map_size::32-signed, rest::binary>>, struct)) do
      deserialize__empty_map__key(rest, [%{}, map_size, struct])
    end
    defp(deserialize(<<14, 140::16-signed, 11, remaining::32-signed, rest::binary>>, struct)) do
      deserialize__empty_set(rest, [[], remaining, struct])
    end
    defp(deserialize(<<15, 150::16-signed, 11, remaining::32-signed, rest::binary>>, struct)) do
      deserialize__empty_list(rest, [[], remaining, struct])
    end
    defp(deserialize(<<field_type, _id::16-signed, rest::binary>>, acc)) do
      rest |> Thrift.Protocol.Binary.skip_field(field_type) |> deserialize(acc)
    end
    defp(deserialize(_, _)) do
      :error
    end
    defp(deserialize__empty_list(<<rest::binary>>, [list, 0, struct])) do
      deserialize(rest, %{struct | empty_list: Enum.reverse(list)})
    end
    defp(deserialize__empty_list(<<string_size::32-signed, element::binary-size(string_size), rest::binary>>, [list, remaining | stack])) do
      deserialize__empty_list(rest, [[element | list], remaining - 1 | stack])
    end
    defp(deserialize__empty_list(_, _)) do
      :error
    end
    defp(deserialize__empty_map__key(<<rest::binary>>, [map, 0, struct])) do
      deserialize(rest, %{struct | empty_map: map})
    end
    defp(deserialize__empty_map__key(<<string_size::32-signed, key::binary-size(string_size), rest::binary>>, stack)) do
      deserialize__empty_map__value(rest, key, stack)
    end
    defp(deserialize__empty_map__key(_, _)) do
      :error
    end
    defp(deserialize__empty_map__value(<<value::8-signed, rest::binary>>, key, [map, remaining | stack])) do
      deserialize__empty_map__key(rest, [Map.put(map, key, value), remaining - 1 | stack])
    end
    defp(deserialize__empty_map__value(_, _, _)) do
      :error
    end
    defp(deserialize__empty_set(<<rest::binary>>, [list, 0, struct])) do
      deserialize(rest, %{struct | empty_set: MapSet.new(list)})
    end
    defp(deserialize__empty_set(<<string_size::32-signed, element::binary-size(string_size), rest::binary>>, [list, remaining | stack])) do
      deserialize__empty_set(rest, [[element | list], remaining - 1 | stack])
    end
    defp(deserialize__empty_set(_, _)) do
      :error
    end
    defp(deserialize__list_val(<<rest::binary>>, [list, 0, struct])) do
      deserialize(rest, %{struct | list_val: Enum.reverse(list)})
    end
    defp(deserialize__list_val(<<string_size::32-signed, element::binary-size(string_size), rest::binary>>, [list, remaining | stack])) do
      deserialize__list_val(rest, [[element | list], remaining - 1 | stack])
    end
    defp(deserialize__list_val(_, _)) do
      :error
    end
    defp(deserialize__map_val__key(<<rest::binary>>, [map, 0, struct])) do
      deserialize(rest, %{struct | map_val: map})
    end
    defp(deserialize__map_val__key(<<string_size::32-signed, key::binary-size(string_size), rest::binary>>, stack)) do
      deserialize__map_val__value(rest, key, stack)
    end
    defp(deserialize__map_val__key(_, _)) do
      :error
    end
    defp(deserialize__map_val__value(<<value::8-signed, rest::binary>>, key, [map, remaining | stack])) do
      deserialize__map_val__key(rest, [Map.put(map, key, value), remaining - 1 | stack])
    end
    defp(deserialize__map_val__value(_, _, _)) do
      :error
    end
    defp(deserialize__set_val(<<rest::binary>>, [list, 0, struct])) do
      deserialize(rest, %{struct | set_val: MapSet.new(list)})
    end
    defp(deserialize__set_val(<<string_size::32-signed, element::binary-size(string_size), rest::binary>>, [list, remaining | stack])) do
      deserialize__set_val(rest, [[element | list], remaining - 1 | stack])
    end
    defp(deserialize__set_val(_, _)) do
      :error
    end
    def(serialize(%Thrift.Generator.BinaryProtocolTest.Defaults{bool_from_true: bool_from_true, bool_from_false: bool_from_false, bool_from_one: bool_from_one, bool_from_zero: bool_from_zero, byte_val: byte_val, double_from_float: double_from_float, double_from_int: double_from_int, i16_val: i16_val, i32_val: i32_val, i64_val: i64_val, string_val: string_val, struct_val: struct_val, map_val: map_val, set_val: set_val, list_val: list_val, empty_struct: empty_struct, empty_map: empty_map, empty_set: empty_set, empty_list: empty_list})) do
      [case(bool_from_true) do
        nil ->
          <<>>
        false ->
          <<2, 1::16-signed, 0>>
        true ->
          <<2, 1::16-signed, 1>>
        _ ->
          raise(Thrift.InvalidValueError, "Optional boolean field :bool_from_true on Thrift.Generator.BinaryProtocolTest.Defaults must be true, false, or nil")
      end, case(bool_from_false) do
        nil ->
          <<>>
        false ->
          <<2, 2::16-signed, 0>>
        true ->
          <<2, 2::16-signed, 1>>
        _ ->
          raise(Thrift.InvalidValueError, "Optional boolean field :bool_from_false on Thrift.Generator.BinaryProtocolTest.Defaults must be true, false, or nil")
      end, case(bool_from_one) do
        nil ->
          <<>>
        false ->
          <<2, 3::16-signed, 0>>
        true ->
          <<2, 3::16-signed, 1>>
        _ ->
          raise(Thrift.InvalidValueError, "Optional boolean field :bool_from_one on Thrift.Generator.BinaryProtocolTest.Defaults must be true, false, or nil")
      end, case(bool_from_zero) do
        nil ->
          <<>>
        false ->
          <<2, 4::16-signed, 0>>
        true ->
          <<2, 4::16-signed, 1>>
        _ ->
          raise(Thrift.InvalidValueError, "Optional boolean field :bool_from_zero on Thrift.Generator.BinaryProtocolTest.Defaults must be true, false, or nil")
      end, case(byte_val) do
        nil ->
          <<>>
        _ ->
          <<3, 5::16-signed, byte_val::8-signed>>
      end, case(double_from_float) do
        nil ->
          <<>>
        _ ->
          <<4, 6::16-signed, double_from_float::float-signed>>
      end, case(double_from_int) do
        nil ->
          <<>>
        _ ->
          <<4, 7::16-signed, double_from_int::float-signed>>
      end, case(i16_val) do
        nil ->
          <<>>
        _ ->
          <<6, 8::16-signed, i16_val::16-signed>>
      end, case(i32_val) do
        nil ->
          <<>>
        _ ->
          <<8, 9::16-signed, i32_val::32-signed>>
      end, case(i64_val) do
        nil ->
          <<>>
        _ ->
          <<10, 10::16-signed, i64_val::64-signed>>
      end, case(string_val) do
        nil ->
          <<>>
        _ ->
          [<<11, 11::16-signed, byte_size(string_val)::32-signed>> | string_val]
      end, case(struct_val) do
        nil ->
          <<>>
        _ ->
          [<<12, 12::16-signed>> | Thrift.Generator.BinaryProtocolTest.DefaultStructVal.serialize(struct_val)]
      end, case(map_val) do
        nil ->
          <<>>
        _ ->
          [<<13, 13::16-signed, 11, 3, Enum.count(map_val)::32-signed>> | for({k, v} <- map_val) do
            [<<byte_size(k)::32-signed>>, k | <<v::8-signed>>]
          end]
      end, case(set_val) do
        nil ->
          <<>>
        _ ->
          [<<14, 14::16-signed, 11, Enum.count(set_val)::32-signed>> | for(e <- set_val) do
            [<<byte_size(e)::32-signed>> | e]
          end]
      end, case(list_val) do
        nil ->
          <<>>
        _ ->
          [<<15, 15::16-signed, 11, length(list_val)::32-signed>> | for(e <- list_val) do
            [<<byte_size(e)::32-signed>> | e]
          end]
      end, case(empty_struct) do
        nil ->
          <<>>
        _ ->
          [<<12, 120::16-signed>> | Thrift.Generator.BinaryProtocolTest.DefaultStructVal.serialize(empty_struct)]
      end, case(empty_map) do
        nil ->
          <<>>
        _ ->
          [<<13, 130::16-signed, 11, 3, Enum.count(empty_map)::32-signed>> | for({k, v} <- empty_map) do
            [<<byte_size(k)::32-signed>>, k | <<v::8-signed>>]
          end]
      end, case(empty_set) do
        nil ->
          <<>>
        _ ->
          [<<14, 140::16-signed, 11, Enum.count(empty_set)::32-signed>> | for(e <- empty_set) do
            [<<byte_size(e)::32-signed>> | e]
          end]
      end, case(empty_list) do
        nil ->
          <<>>
        _ ->
          [<<15, 150::16-signed, 11, length(empty_list)::32-signed>> | for(e <- empty_list) do
            [<<byte_size(e)::32-signed>> | e]
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