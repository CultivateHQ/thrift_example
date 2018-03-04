namespace elixir Thrift.Generator.BinaryProtocolTest
struct Byte {
  1: optional byte val;
  2: optional map<byte, byte> val_map;
  3: optional set<byte> val_set;
  4: optional list<byte> val_list;
}
