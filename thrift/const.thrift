namespace elixir Thrift.Generator.BinaryProtocolTest
struct ConstStructVal {
  1: byte num
}

const bool ConstBool = true
const byte ConstByte = 5
const double ConstDouble = 5.0
const i16 ConstI16 = 5
const i32 ConstI32 = 5
const i64 ConstI64 = 5
const string ConstString = "abc123"
const binary ConstBinary = "abc123"
const ConstStructVal ConstStruct = {"num": 5}
const map<string, byte> ConstMap = {"a": 1, "b": 2}
const set<string> ConstSet = ["a", "b"]
const list<string> ConstList = ["a", "b"]

struct ConstFieldsStruct {
  1: bool bool_val = ConstBool,
  2: byte byte_val = ConstByte,
  3: double double_val = ConstDouble,
  4: i16 i16_val = ConstI16,
  5: i32 i32_val = ConstI32,
  6: i64 i64_val = ConstI64,
  7: string string_val = ConstString,
  71: binary binary_val = ConstBinary,
  8: ConstStructVal struct_val = ConstStruct,
  13: map<string, byte> map_val = ConstMap,
  14: set<string> set_val = ConstSet,
  15: list<string> list_val = ConstList,
}
