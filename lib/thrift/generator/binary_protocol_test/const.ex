defmodule(Thrift.Generator.BinaryProtocolTest.Const) do
  defmacro(const_binary) do
    Macro.escape("abc123")
  end
  defmacro(const_bool) do
    Macro.escape(true)
  end
  defmacro(const_byte) do
    Macro.escape(5)
  end
  defmacro(const_double) do
    Macro.escape(5.0)
  end
  defmacro(const_i16) do
    Macro.escape(5)
  end
  defmacro(const_i32) do
    Macro.escape(5)
  end
  defmacro(const_i64) do
    Macro.escape(5)
  end
  defmacro(const_list) do
    Macro.escape(["a", "b"])
  end
  defmacro(const_map) do
    Macro.escape(%{"a" => 1, "b" => 2})
  end
  defmacro(const_set) do
    Macro.escape(MapSet.new(["a", "b"]))
  end
  defmacro(const_string) do
    Macro.escape("abc123")
  end
  defmacro(const_struct) do
    Macro.escape(%{__struct__: Thrift.Generator.BinaryProtocolTest.ConstStructVal, num: 5})
  end
end