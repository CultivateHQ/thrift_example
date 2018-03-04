defmodule(Thrift.Generator.BinaryProtocolTest.Union) do
  _ = "Auto-generated Thrift union unions.Union"
  _ = "1: i64 int_field"
  _ = "2: unions.StructValue struct_field"
  _ = "3: string string_field"
  _ = "4: list<i16> list_field"
  defstruct(int_field: nil, struct_field: nil, string_field: nil, list_field: nil)
  @type(t :: %__MODULE__{})
  def(new) do
    %__MODULE__{}
  end
  defmodule(BinaryProtocol) do
    @moduledoc(false)
    def(deserialize(binary)) do
      deserialize(binary, %Thrift.Generator.BinaryProtocolTest.Union{})
    end
    defp(deserialize(<<0, rest::binary>>, %Thrift.Generator.BinaryProtocolTest.Union{} = acc)) do
      {acc, rest}
    end
    defp(deserialize(<<10, 1::16-signed, value::64-signed, rest::binary>>, acc)) do
      deserialize(rest, %{acc | int_field: value})
    end
    defp(deserialize(<<12, 2::16-signed, rest::binary>>, acc)) do
      case(Elixir.Thrift.Generator.BinaryProtocolTest.StructValue.BinaryProtocol.deserialize(rest)) do
        {value, rest} ->
          deserialize(rest, %{acc | struct_field: value})
        :error ->
          :error
      end
    end
    defp(deserialize(<<11, 3::16-signed, string_size::32-signed, value::binary-size(string_size), rest::binary>>, acc)) do
      deserialize(rest, %{acc | string_field: value})
    end
    defp(deserialize(<<15, 4::16-signed, 6, remaining::32-signed, rest::binary>>, struct)) do
      deserialize__list_field(rest, [[], remaining, struct])
    end
    defp(deserialize(<<field_type, _id::16-signed, rest::binary>>, acc)) do
      rest |> Thrift.Protocol.Binary.skip_field(field_type) |> deserialize(acc)
    end
    defp(deserialize(_, _)) do
      :error
    end
    defp(deserialize__list_field(<<rest::binary>>, [list, 0, struct])) do
      deserialize(rest, %{struct | list_field: Enum.reverse(list)})
    end
    defp(deserialize__list_field(<<element::16-signed, rest::binary>>, [list, remaining | stack])) do
      deserialize__list_field(rest, [[element | list], remaining - 1 | stack])
    end
    defp(deserialize__list_field(_, _)) do
      :error
    end
    def(serialize(%Thrift.Generator.BinaryProtocolTest.Union{int_field: nil, struct_field: nil, string_field: nil, list_field: nil})) do
      <<0>>
    end
    def(serialize(%Thrift.Generator.BinaryProtocolTest.Union{int_field: int_field, struct_field: nil, string_field: nil, list_field: nil})) do
      <<10, 1::16-signed, int_field::64-signed, (<<0>>)>>
    end
    def(serialize(%Thrift.Generator.BinaryProtocolTest.Union{int_field: nil, struct_field: struct_field, string_field: nil, list_field: nil})) do
      [<<12, 2::16-signed>>, Thrift.Generator.BinaryProtocolTest.StructValue.serialize(struct_field) | <<0>>]
    end
    def(serialize(%Thrift.Generator.BinaryProtocolTest.Union{int_field: nil, struct_field: nil, string_field: string_field, list_field: nil})) do
      [<<11, 3::16-signed, byte_size(string_field)::32-signed>>, string_field | <<0>>]
    end
    def(serialize(%Thrift.Generator.BinaryProtocolTest.Union{int_field: nil, struct_field: nil, string_field: nil, list_field: list_field})) do
      [<<15, 4::16-signed, 6, length(list_field)::32-signed>>, for(e <- list_field) do
        <<e::16-signed>>
      end | <<0>>]
    end
    def(serialize(%Thrift.Generator.BinaryProtocolTest.Union{} = value)) do
      set_fields = value |> Map.from_struct() |> Enum.flat_map(fn
        {_, nil} ->
          []
        {key, _} ->
          [key]
      end)
      raise(%Thrift.Union.TooManyFieldsSetError{message: "Thrift union has more than one field set", set_fields: set_fields})
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