namespace elixir Thrift.Generator.BinaryProtocolTest
struct TString {
  1: optional string val;
  2: optional map<string, string> val_map;
  3: optional set<string> val_set;
  4: optional list<string> val_list;
}
