#
# Autogenerated by Thrift Compiler (0.11.0)
#
# DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
#
#  options string: py
#

from thrift.Thrift import TType, TMessageType, TFrozenDict, TException, TApplicationException
from thrift.protocol.TProtocol import TProtocolException
from thrift.TRecursive import fix_spec

import sys

from thrift.transport import TTransport
all_structs = []


class ChocolateAdditionsType(object):
    ALMONDS = 1
    NOUGAT = 2
    HAIR = 3

    _VALUES_TO_NAMES = {
        1: "ALMONDS",
        2: "NOUGAT",
        3: "HAIR",
    }

    _NAMES_TO_VALUES = {
        "ALMONDS": 1,
        "NOUGAT": 2,
        "HAIR": 3,
    }
fix_spec(all_structs)
del all_structs
