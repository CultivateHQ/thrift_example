defmodule(Thrift.Generator.BinaryProtocolTest.XMan) do
  defmacro(cyclops) do
    Macro.escape(%{__struct__: Thrift.Generator.BinaryProtocolTest.XMan, universe: "Earth-616", handle: "Cyclops", name: "Scott Summers", power_level: 2})
  end
  defmacro(earth_616) do
    Macro.escape("Earth-616")
  end
  defmacro(phoenix) do
    Macro.escape(%{__struct__: Thrift.Generator.BinaryProtocolTest.XMan, universe: "Earth-616", handle: "Phoenix", name: "Jean Grey", power_level: 3})
  end
  defmacro(storm) do
    Macro.escape(%{__struct__: Thrift.Generator.BinaryProtocolTest.XMan, universe: "Earth-616", handle: "Storm", name: "Ororo Monroe", power_level: 1})
  end
  defmacro(wolverine) do
    Macro.escape(%{__struct__: Thrift.Generator.BinaryProtocolTest.XMan, universe: "Earth-616", handle: "Wolverine", name: "Logan", power_level: 2})
  end
  _ = "Auto-generated Thrift struct x_man.XMan"
  _ = "1: string handle"
  _ = "2: string name"
  _ = "3: string universe"
  _ = "4: x_man.PowerLevel power_level"
  defstruct(handle: nil, name: nil, universe: "Earth-616", power_level: nil)
  @type(t :: %__MODULE__{})
  def(new) do
    %__MODULE__{}
  end
  defmodule(BinaryProtocol) do
    @moduledoc(false)
    def(deserialize(binary)) do
      deserialize(binary, %Thrift.Generator.BinaryProtocolTest.XMan{})
    end
    defp(deserialize(<<0, rest::binary>>, %Thrift.Generator.BinaryProtocolTest.XMan{} = acc)) do
      {acc, rest}
    end
    defp(deserialize(<<11, 1::16-signed, string_size::32-signed, value::binary-size(string_size), rest::binary>>, acc)) do
      deserialize(rest, %{acc | handle: value})
    end
    defp(deserialize(<<11, 2::16-signed, string_size::32-signed, value::binary-size(string_size), rest::binary>>, acc)) do
      deserialize(rest, %{acc | name: value})
    end
    defp(deserialize(<<11, 3::16-signed, string_size::32-signed, value::binary-size(string_size), rest::binary>>, acc)) do
      deserialize(rest, %{acc | universe: value})
    end
    defp(deserialize(<<8, 4::16-signed, value::32-signed, rest::binary>>, acc)) do
      deserialize(rest, %{acc | power_level: value})
    end
    defp(deserialize(<<field_type, _id::16-signed, rest::binary>>, acc)) do
      rest |> Thrift.Protocol.Binary.skip_field(field_type) |> deserialize(acc)
    end
    defp(deserialize(_, _)) do
      :error
    end
    def(serialize(%Thrift.Generator.BinaryProtocolTest.XMan{handle: handle, name: name, universe: universe, power_level: power_level})) do
      [case(handle) do
        nil ->
          <<>>
        _ ->
          [<<11, 1::16-signed, byte_size(handle)::32-signed>> | handle]
      end, case(name) do
        nil ->
          <<>>
        _ ->
          [<<11, 2::16-signed, byte_size(name)::32-signed>> | name]
      end, case(universe) do
        nil ->
          <<>>
        _ ->
          [<<11, 3::16-signed, byte_size(universe)::32-signed>> | universe]
      end, case(power_level) do
        nil ->
          <<>>
        _ ->
          <<8, 4::16-signed, power_level::32-signed>>
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