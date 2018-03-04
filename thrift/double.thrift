namespace elixir Thrift.Generator.BinaryProtocolTest
struct Double {
  1: optional double val;
  2: optional map<double, double> val_map;
  3: optional set<double> val_set;
  4: optional list<double> val_list;
}
