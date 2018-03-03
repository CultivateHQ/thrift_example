namespace elixir Thrift.Generator.BinaryProtocolTest
typedef set<i32> intSet
typedef map<string, string> mapping
typedef list<i64> numList

struct Typedefs {
  1: optional intSet ints,
  2: optional mapping mappings,
  3: optional numList numbers
}
