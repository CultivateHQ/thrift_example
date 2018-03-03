namespace elixir Thrift.Generator.BinaryProtocolTest
include "included_constants.thrift"

struct IncludesConstants {
  1: string name
  2: i8 z = included_constants.Z
}
