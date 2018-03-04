namespace elixir Thrift.Generator.BinaryProtocolTest
struct BinaryStruct {
  1: optional binary val;
  2: optional map<binary, binary> val_map;
  3: optional set<binary> val_set;
  4: optional list<binary> val_list;
}
