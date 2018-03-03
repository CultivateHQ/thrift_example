namespace elixir Thrift.Generator.BinaryProtocolTest
include "additions.thrift"

struct Chocolate {
  1: optional additions.ChocolateAdditions extra_stuff = [ChocolateAdditionsType.HAIR]
  2: optional additions.ChocolateAdditionsType secret_ingredient = ChocolateAdditionsType.HAIR
}

struct Allergies {
   1: optional list<additions.ChocolateAdditionsType> may_contain = [ChocolateAdditionsType.ALMONDS]
}

struct OddSnackIngredients {
   1: optional set<additions.ChocolateAdditionsType> other_things = [ChocolateAdditionsType.NOUGAT]
}

struct ChocoMappings {
  1: optional map<additions.ChocolateAdditionsType, string> common_name = {ChocolateAdditionsType.HAIR: "love"}
}

struct AdditionalMappings {
  1: optional additions.ChocolateMapping mapping = {ChocolateAdditionsType.ALMONDS: "almonds",
                                                    ChocolateAdditionsType.NOUGAT: "nougat"}
}

struct AlreadyNamespaced {
  1: optional additions.ChocolateAdditionsType namespaced = additions.ChocolateAdditionsType.ALMONDS
}
