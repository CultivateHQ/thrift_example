namespace elixir Thrift.Generator.BinaryProtocolTest
enum ChocolateAdditionsType {
  ALMONDS = 1,
  NOUGAT  = 2,
  HAIR    = 3
}

typedef set<ChocolateAdditionsType> ChocolateAdditions
typedef map<ChocolateAdditionsType, string> ChocolateMapping
