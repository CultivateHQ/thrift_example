defmodule(Thrift.Generator.BinaryProtocolTest.ChocolateAdditionsType) do
  @moduledoc("Auto-generated Thrift enum additions.ChocolateAdditionsType")
  defmacro(unquote(:almonds)()) do
    1
  end
  defmacro(unquote(:nougat)()) do
    2
  end
  defmacro(unquote(:hair)()) do
    3
  end
  def(value_to_name(1)) do
    {:ok, :almonds}
  end
  def(value_to_name(2)) do
    {:ok, :nougat}
  end
  def(value_to_name(3)) do
    {:ok, :hair}
  end
  def(value_to_name(v)) do
    {:error, {:invalid_enum_value, v}}
  end
  def(name_to_value(:almonds)) do
    {:ok, 1}
  end
  def(name_to_value(:nougat)) do
    {:ok, 2}
  end
  def(name_to_value(:hair)) do
    {:ok, 3}
  end
  def(name_to_value(k)) do
    {:error, {:invalid_enum_name, k}}
  end
  def(value_to_name!(value)) do
    {:ok, name} = value_to_name(value)
    name
  end
  def(name_to_value!(name)) do
    {:ok, value} = name_to_value(name)
    value
  end
  def(meta(:names)) do
    [:almonds, :nougat, :hair]
  end
  def(meta(:values)) do
    [1, 2, 3]
  end
  def(member?(1)) do
    true
  end
  def(member?(2)) do
    true
  end
  def(member?(3)) do
    true
  end
  def(member?(_)) do
    false
  end
  def(name?(:almonds)) do
    true
  end
  def(name?(:nougat)) do
    true
  end
  def(name?(:hair)) do
    true
  end
  def(name?(_)) do
    false
  end
end