namespace elixir Thrift.Generator.BinaryProtocolTest
struct DefaultStructVal {
  1: byte num
}

struct Defaults {
  1: bool bool_from_true = true
  2: bool bool_from_false = false
  3: bool bool_from_one = 1
  4: bool bool_from_zero = 0
  5: byte byte_val = 5
  6: double double_from_float = 0.0
  7: double double_from_int = 0
  8: i16 i16_val = 5
  9: i32 i32_val = 5
  10: i64 i64_val = 5
  11: string string_val = "abc123"
  12: DefaultStructVal struct_val = {"num": 5}
  13: map<string, byte> map_val = {"a": 1, "b": 2}
  14: set<string> set_val = ["a", "b"]
  15: list<string> list_val = ["a", "b"]
  120: DefaultStructVal empty_struct = {}
  130: map<string, byte> empty_map = {}
  140: set<string> empty_set = []
  150: list<string> empty_list = []
}
