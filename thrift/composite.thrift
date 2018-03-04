namespace elixir Thrift.Generator.BinaryProtocolTest
struct Composite {
  1: optional map<map<byte, byte>, map<byte, byte>> map_of_maps;
  2: optional map<set<byte>, set<byte>> map_of_sets;
  3: optional map<list<byte>, list<byte>> map_of_lists;
  4: optional set<map<byte, byte>> set_of_maps;
  5: optional set<set<byte>> set_of_sets;
  6: optional set<list<byte>> set_of_lists;
  7: optional list<map<byte, byte>> list_of_maps;
  8: optional list<set<byte>> list_of_sets;
  9: optional list<list<byte>> list_of_lists;
}
