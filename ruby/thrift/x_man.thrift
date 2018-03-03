namespace elixir Thrift.Generator.BinaryProtocolTest
enum PowerLevel {
  ALPHA,
  BETA,
  OMEGA
}

const string EARTH_616 = "Earth-616"

struct XMan{
  1: string handle
  2: string name
  3: string universe = EARTH_616
  4: PowerLevel power_level
}

const XMan Wolverine = {"handle": "Wolverine", "name": "Logan", "power_level": PowerLevel.BETA}
const XMan Cyclops = {"handle": "Cyclops", "name": "Scott Summers", "power_level": PowerLevel.BETA}
const XMan Storm = {"handle": "Storm", "name": "Ororo Monroe", "power_level": PowerLevel.ALPHA}
const XMan Phoenix = {"handle": "Phoenix", "name": "Jean Grey", "power_level": PowerLevel.OMEGA}
