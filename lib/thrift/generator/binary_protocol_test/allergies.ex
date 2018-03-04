defmodule(Thrift.Generator.BinaryProtocolTest.Allergies) do
  _ = "Auto-generated Thrift struct chocolate.Allergies"
  _ = "1: list<additions.ChocolateAdditionsType> may_contain"
  defstruct(may_contain: [1])
  @type(t :: %__MODULE__{})
  def(new) do
    %__MODULE__{}
  end
  defmodule(BinaryProtocol) do
    @moduledoc(false)
    def(deserialize(binary)) do
      deserialize(binary, %Thrift.Generator.BinaryProtocolTest.Allergies{})
    end
    defp(deserialize(<<0, rest::binary>>, %Thrift.Generator.BinaryProtocolTest.Allergies{} = acc)) do
      {acc, rest}
    end
    defp(deserialize(<<15, 1::16-signed, 8, remaining::32-signed, rest::binary>>, struct)) do
      deserialize__may_contain(rest, [[], remaining, struct])
    end
    defp(deserialize(<<field_type, _id::16-signed, rest::binary>>, acc)) do
      rest |> Thrift.Protocol.Binary.skip_field(field_type) |> deserialize(acc)
    end
    defp(deserialize(_, _)) do
      :error
    end
    defp(deserialize__may_contain(<<rest::binary>>, [list, 0, struct])) do
      deserialize(rest, %{struct | may_contain: Enum.reverse(list)})
    end
    defp(deserialize__may_contain(<<element::32-signed, rest::binary>>, [list, remaining | stack])) do
      deserialize__may_contain(rest, [[element | list], remaining - 1 | stack])
    end
    defp(deserialize__may_contain(_, _)) do
      :error
    end
    def(serialize(%Thrift.Generator.BinaryProtocolTest.Allergies{may_contain: may_contain})) do
      [case(may_contain) do
        nil ->
          <<>>
        _ ->
          [<<15, 1::16-signed, 8, length(may_contain)::32-signed>> | for(e <- may_contain) do
            <<e::32-signed>>
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