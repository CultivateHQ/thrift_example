namespace elixir Thrift.Generator.BinaryProtocolTest
exception Ex {
   1: optional string message,
  99: optional byte num;
}
exception Ex2 {
  1: optional i16 error_code;
}
struct TException {
  1: optional Ex val;
  2: optional map<Ex, Ex> val_map;
  3: optional set<Ex> val_set;
  4: optional list<Ex> val_list;
}
