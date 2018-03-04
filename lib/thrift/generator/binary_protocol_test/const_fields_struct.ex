defmodule(Thrift.Generator.BinaryProtocolTest.ConstFieldsStruct) do
  _ = "Auto-generated Thrift struct const.ConstFieldsStruct"
  _ = "1: bool bool_val"
  _ = "2: i8 byte_val"
  _ = "3: double double_val"
  _ = "4: i16 i16_val"
  _ = "5: i32 i32_val"
  _ = "6: i64 i64_val"
  _ = "7: string string_val"
  _ = "71: binary binary_val"
  _ = "8: const.ConstStructVal struct_val"
  _ = "13: map<string,i8> map_val"
  _ = "14: set<string> set_val"
  _ = "15: list<string> list_val"
  defstruct(bool_val: true, byte_val: 5, double_val: 5.0, i16_val: 5, i32_val: 5, i64_val: 5, string_val: "abc123", binary_val: "abc123", struct_val: %{__struct__: Thrift.Generator.BinaryProtocolTest.ConstStructVal, num: 5}, map_val: %{"a" => 1, "b" => 2}, set_val: MapSet.new(["a", "b"]), list_val: ["a", "b"])
  @type(t :: %__MODULE__{})
  def(new) do
    %__MODULE__{}
  end
  defmodule(BinaryProtocol) do
    @moduledoc(false)
    def(deserialize(binary)) do
      deserialize(binary, %Thrift.Generator.BinaryProtocolTest.ConstFieldsStruct{})
    end
    defp(deserialize(<<0, rest::binary>>, %Thrift.Generator.BinaryProtocolTest.ConstFieldsStruct{} = acc)) do
      {acc, rest}
    end
    defp(deserialize(<<2, 1::16-signed, 1, rest::binary>>, acc)) do
      deserialize(rest, %{acc | bool_val: true})
    end
    defp(deserialize(<<2, 1::16-signed, 0, rest::binary>>, acc)) do
      deserialize(rest, %{acc | bool_val: false})
    end
    defp(deserialize(<<3, 2::16-signed, value::8-signed, rest::binary>>, acc)) do
      deserialize(rest, %{acc | byte_val: value})
    end
    defp(deserialize(<<4, 3::16-signed, value::float-signed, rest::binary>>, acc)) do
      deserialize(rest, %{acc | double_val: value})
    end
    defp(deserialize(<<6, 4::16-signed, value::16-signed, rest::binary>>, acc)) do
      deserialize(rest, %{acc | i16_val: value})
    end
    defp(deserialize(<<8, 5::16-signed, value::32-signed, rest::binary>>, acc)) do
      deserialize(rest, %{acc | i32_val: value})
    end
    defp(deserialize(<<10, 6::16-signed, value::64-signed, rest::binary>>, acc)) do
      deserialize(rest, %{acc | i64_val: value})
    end
    defp(deserialize(<<11, 7::16-signed, string_size::32-signed, value::binary-size(string_size), rest::binary>>, acc)) do
      deserialize(rest, %{acc | string_val: value})
    end
    defp(deserialize(<<11, 71::16-signed, string_size::32-signed, value::binary-size(string_size), rest::binary>>, acc)) do
      deserialize(rest, %{acc | binary_val: value})
    end
    defp(deserialize(<<12, 8::16-signed, rest::binary>>, acc)) do
      case(Elixir.Thrift.Generator.BinaryProtocolTest.ConstStructVal.BinaryProtocol.deserialize(rest)) do
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
    defp(deserialize(<<field_type, _id::16-signed, rest::binary>>, acc)) do
      rest |> Thrift.Protocol.Binary.skip_field(field_type) |> deserialize(acc)
    end
    defp(deserialize(_, _)) do
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
    def(serialize(%Thrift.Generator.BinaryProtocolTest.ConstFieldsStruct{bool_val: bool_val, byte_val: byte_val, double_val: double_val, i16_val: i16_val, i32_val: i32_val, i64_val: i64_val, string_val: string_val, binary_val: binary_val, struct_val: struct_val, map_val: map_val, set_val: set_val, list_val: list_val})) do
      [case(bool_val) do
        nil ->
          <<>>
        false ->
          <<2, 1::16-signed, 0>>
        true ->
          <<2, 1::16-signed, 1>>
        _ ->
          raise(Thrift.InvalidValueError, "Optional boolean field :bool_val on Thrift.Generator.BinaryProtocolTest.ConstFieldsStruct must be true, false, or nil")
      end, case(byte_val) do
        nil ->
          <<>>
        _ ->
          <<3, 2::16-signed, byte_val::8-signed>>
      end, case(double_val) do
        nil ->
          <<>>
        _ ->
          <<4, 3::16-signed, double_val::float-signed>>
      end, case(i16_val) do
        nil ->
          <<>>
        _ ->
          <<6, 4::16-signed, i16_val::16-signed>>
      end, case(i32_val) do
        nil ->
          <<>>
        _ ->
          <<8, 5::16-signed, i32_val::32-signed>>
      end, case(i64_val) do
        nil ->
          <<>>
        _ ->
          <<10, 6::16-signed, i64_val::64-signed>>
      end, case(string_val) do
        nil ->
          <<>>
        _ ->
          [<<11, 7::16-signed, byte_size(string_val)::32-signed>> | string_val]
      end, case(binary_val) do
        nil ->
          <<>>
        _ ->
          [<<11, 71::16-signed, byte_size(binary_val)::32-signed>> | binary_val]
      end, case(struct_val) do
        nil ->
          <<>>
        _ ->
          [<<12, 8::16-signed>> | Thrift.Generator.BinaryProtocolTest.ConstStructVal.serialize(struct_val)]
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