namespace elixir Thrift.Generator.BinaryProtocolTest
struct Bool {
  1: optional bool val;
  2: optional map<bool, bool> val_map;
  3: optional set<bool> val_set;
  4: optional list<bool> val_list;
  16: optional bool large_field_id_val;
}
