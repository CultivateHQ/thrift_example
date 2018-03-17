namespace elixir Thrift.Generator.BinaryProtocolTest
struct Multifield {
  1: optional bool bool_one;
  2: optional bool bool_two;
  3: optional bool bool_three;
  4: optional map<bool, bool> map_four;
  5: optional list<bool> list_five;
  6: optional byte byte_six;
  17: optional bool bool_seventeen;
}