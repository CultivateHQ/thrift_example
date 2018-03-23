namespace elixir Thrift.Generator.BinaryProtocolTest
struct Val {
  99: optional byte num;
}
struct TStruct {
  1: optional Val val;
  2: optional map<Val, Val> val_map;
  3: optional set<Val> val_set;
  4: optional list<Val> val_list;
}
