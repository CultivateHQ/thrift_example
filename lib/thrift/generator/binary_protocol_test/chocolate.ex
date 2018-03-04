defmodule(Thrift.Generator.BinaryProtocolTest.Chocolate) do
  _ = "Auto-generated Thrift struct chocolate.Chocolate"
  _ = "1: set<additions.ChocolateAdditionsType> extra_stuff"
  _ = "2: additions.ChocolateAdditionsType secret_ingredient"
  defstruct(extra_stuff: MapSet.new([3]), secret_ingredient: 3)
  @type(t :: %__MODULE__{})
  def(new) do
    %__MODULE__{}
  end
  defmodule(BinaryProtocol) do
    @moduledoc(false)
    def(deserialize(binary)) do
      deserialize(binary, %Thrift.Generator.BinaryProtocolTest.Chocolate{})
    end
    defp(deserialize(<<0, rest::binary>>, %Thrift.Generator.BinaryProtocolTest.Chocolate{} = acc)) do
      {acc, rest}
    end
    defp(deserialize(<<14, 1::16-signed, 8, remaining::32-signed, rest::binary>>, struct)) do
      deserialize__extra_stuff(rest, [[], remaining, struct])
    end
    defp(deserialize(<<8, 2::16-signed, value::32-signed, rest::binary>>, acc)) do
      deserialize(rest, %{acc | secret_ingredient: value})
    end
    defp(deserialize(<<field_type, _id::16-signed, rest::binary>>, acc)) do
      rest |> Thrift.Protocol.Binary.skip_field(field_type) |> deserialize(acc)
    end
    defp(deserialize(_, _)) do
      :error
    end
    defp(deserialize__extra_stuff(<<rest::binary>>, [list, 0, struct])) do
      deserialize(rest, %{struct | extra_stuff: MapSet.new(list)})
    end
    defp(deserialize__extra_stuff(<<element::32-signed, rest::binary>>, [list, remaining | stack])) do
      deserialize__extra_stuff(rest, [[element | list], remaining - 1 | stack])
    end
    defp(deserialize__extra_stuff(_, _)) do
      :error
    end
    def(serialize(%Thrift.Generator.BinaryProtocolTest.Chocolate{extra_stuff: extra_stuff, secret_ingredient: secret_ingredient})) do
      [case(extra_stuff) do
        nil ->
          <<>>
        _ ->
          [<<14, 1::16-signed, 8, Enum.count(extra_stuff)::32-signed>> | for(e <- extra_stuff) do
            <<e::32-signed>>
          end]
      end, case(secret_ingredient) do
        nil ->
          <<>>
        _ ->
          <<8, 2::16-signed, secret_ingredient::32-signed>>
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