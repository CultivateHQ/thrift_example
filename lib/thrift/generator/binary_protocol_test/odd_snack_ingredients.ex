defmodule(Thrift.Generator.BinaryProtocolTest.OddSnackIngredients) do
  _ = "Auto-generated Thrift struct chocolate.OddSnackIngredients"
  _ = "1: set<additions.ChocolateAdditionsType> other_things"
  defstruct(other_things: MapSet.new([2]))
  @type(t :: %__MODULE__{})
  def(new) do
    %__MODULE__{}
  end
  defmodule(BinaryProtocol) do
    @moduledoc(false)
    def(deserialize(binary)) do
      deserialize(binary, %Thrift.Generator.BinaryProtocolTest.OddSnackIngredients{})
    end
    defp(deserialize(<<0, rest::binary>>, %Thrift.Generator.BinaryProtocolTest.OddSnackIngredients{} = acc)) do
      {acc, rest}
    end
    defp(deserialize(<<14, 1::16-signed, 8, remaining::32-signed, rest::binary>>, struct)) do
      deserialize__other_things(rest, [[], remaining, struct])
    end
    defp(deserialize(<<field_type, _id::16-signed, rest::binary>>, acc)) do
      rest |> Thrift.Protocol.Binary.skip_field(field_type) |> deserialize(acc)
    end
    defp(deserialize(_, _)) do
      :error
    end
    defp(deserialize__other_things(<<rest::binary>>, [list, 0, struct])) do
      deserialize(rest, %{struct | other_things: MapSet.new(list)})
    end
    defp(deserialize__other_things(<<element::32-signed, rest::binary>>, [list, remaining | stack])) do
      deserialize__other_things(rest, [[element | list], remaining - 1 | stack])
    end
    defp(deserialize__other_things(_, _)) do
      :error
    end
    def(serialize(%Thrift.Generator.BinaryProtocolTest.OddSnackIngredients{other_things: other_things})) do
      [case(other_things) do
        nil ->
          <<>>
        _ ->
          [<<14, 1::16-signed, 8, Enum.count(other_things)::32-signed>> | for(e <- other_things) do
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