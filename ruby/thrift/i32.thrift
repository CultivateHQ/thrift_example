namespace elixir Thrift.Generator.BinaryProtocolTest
struct I32 {
  1: optional i32 val;
  2: optional map<i32, i32> val_map;
  3: optional set<i32> val_set;
  4: optional list<i32> val_list;
}
