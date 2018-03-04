defmodule(Thrift.Generator.BinaryProtocolTest.Typedefs) do
  _ = "Auto-generated Thrift struct typedefs.Typedefs"
  _ = "1: set<i32> ints"
  _ = "2: map<string,string> mappings"
  _ = "3: list<i64> numbers"
  defstruct(ints: nil, mappings: nil, numbers: nil)
  @type(t :: %__MODULE__{})
  def(new) do
    %__MODULE__{}
  end
  defmodule(BinaryProtocol) do
    @moduledoc(false)
    def(deserialize(binary)) do
      deserialize(binary, %Thrift.Generator.BinaryProtocolTest.Typedefs{})
    end
    defp(deserialize(<<0, rest::binary>>, %Thrift.Generator.BinaryProtocolTest.Typedefs{} = acc)) do
      {acc, rest}
    end
    defp(deserialize(<<14, 1::16-signed, 8, remaining::32-signed, rest::binary>>, struct)) do
      deserialize__ints(rest, [[], remaining, struct])
    end
    defp(deserialize(<<13, 2::16-signed, 11, 11, map_size::32-signed, rest::binary>>, struct)) do
      deserialize__mappings__key(rest, [%{}, map_size, struct])
    end
    defp(deserialize(<<15, 3::16-signed, 10, remaining::32-signed, rest::binary>>, struct)) do
      deserialize__numbers(rest, [[], remaining, struct])
    end
    defp(deserialize(<<field_type, _id::16-signed, rest::binary>>, acc)) do
      rest |> Thrift.Protocol.Binary.skip_field(field_type) |> deserialize(acc)
    end
    defp(deserialize(_, _)) do
      :error
    end
    defp(deserialize__ints(<<rest::binary>>, [list, 0, struct])) do
      deserialize(rest, %{struct | ints: MapSet.new(list)})
    end
    defp(deserialize__ints(<<element::32-signed, rest::binary>>, [list, remaining | stack])) do
      deserialize__ints(rest, [[element | list], remaining - 1 | stack])
    end
    defp(deserialize__ints(_, _)) do
      :error
    end
    defp(deserialize__mappings__key(<<rest::binary>>, [map, 0, struct])) do
      deserialize(rest, %{struct | mappings: map})
    end
    defp(deserialize__mappings__key(<<string_size::32-signed, key::binary-size(string_size), rest::binary>>, stack)) do
      deserialize__mappings__value(rest, key, stack)
    end
    defp(deserialize__mappings__key(_, _)) do
      :error
    end
    defp(deserialize__mappings__value(<<string_size::32-signed, value::binary-size(string_size), rest::binary>>, key, [map, remaining | stack])) do
      deserialize__mappings__key(rest, [Map.put(map, key, value), remaining - 1 | stack])
    end
    defp(deserialize__mappings__value(_, _, _)) do
      :error
    end
    defp(deserialize__numbers(<<rest::binary>>, [list, 0, struct])) do
      deserialize(rest, %{struct | numbers: Enum.reverse(list)})
    end
    defp(deserialize__numbers(<<element::64-signed, rest::binary>>, [list, remaining | stack])) do
      deserialize__numbers(rest, [[element | list], remaining - 1 | stack])
    end
    defp(deserialize__numbers(_, _)) do
      :error
    end
    def(serialize(%Thrift.Generator.BinaryProtocolTest.Typedefs{ints: ints, mappings: mappings, numbers: numbers})) do
      [case(ints) do
        nil ->
          <<>>
        _ ->
          [<<14, 1::16-signed, 8, Enum.count(ints)::32-signed>> | for(e <- ints) do
            <<e::32-signed>>
          end]
      end, case(mappings) do
        nil ->
          <<>>
        _ ->
          [<<13, 2::16-signed, 11, 11, Enum.count(mappings)::32-signed>> | for({k, v} <- mappings) do
            [<<byte_size(k)::32-signed>>, k, <<byte_size(v)::32-signed>> | v]
          end]
      end, case(numbers) do
        nil ->
          <<>>
        _ ->
          [<<15, 3::16-signed, 10, length(numbers)::32-signed>> | for(e <- numbers) do
            <<e::64-signed>>
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