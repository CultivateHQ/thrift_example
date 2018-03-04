defmodule(Thrift.Generator.BinaryProtocolTest.PowerLevel) do
  @moduledoc("Auto-generated Thrift enum x_man.PowerLevel")
  defmacro(unquote(:alpha)()) do
    1
  end
  defmacro(unquote(:beta)()) do
    2
  end
  defmacro(unquote(:omega)()) do
    3
  end
  def(value_to_name(1)) do
    {:ok, :alpha}
  end
  def(value_to_name(2)) do
    {:ok, :beta}
  end
  def(value_to_name(3)) do
    {:ok, :omega}
  end
  def(value_to_name(v)) do
    {:error, {:invalid_enum_value, v}}
  end
  def(name_to_value(:alpha)) do
    {:ok, 1}
  end
  def(name_to_value(:beta)) do
    {:ok, 2}
  end
  def(name_to_value(:omega)) do
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
    [:alpha, :beta, :omega]
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
  def(name?(:alpha)) do
    true
  end
  def(name?(:beta)) do
    true
  end
  def(name?(:omega)) do
    true
  end
  def(name?(_)) do
    false
  end
end