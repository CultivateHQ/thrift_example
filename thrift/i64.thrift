namespace elixir Thrift.Generator.BinaryProtocolTest
struct I64 {
  1: optional i64 val;
  2: optional map<i64, i64> val_map;
  3: optional set<i64> val_set;
  4: optional list<i64> val_list;
}
