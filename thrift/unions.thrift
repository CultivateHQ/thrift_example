namespace elixir Thrift.Generator.CompactProtocolTest
struct StructValue {
  1: optional string username;
}
union Union {
  1: i64 int_field,
  2: StructValue struct_field,
  3: string string_field,
  4: list<i16> list_field;
  5: bool bool_field;
  6: map<byte, bool> map_field;
}

struct UStruct {
  1: optional Union my_union,
  2: optional map<Union, Union> u_map,
  3: optional set<Union> u_set,
  4: optional list<Union> u_list,
}
