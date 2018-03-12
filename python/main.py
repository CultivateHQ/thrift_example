import sys
import glob
sys.path.append('gen-py')

from thrift import Thrift
from thrift import TSerialization
from thrift.protocol import TBinaryProtocol
from thrift.protocol import TCompactProtocol
from i16.ttypes import I16


p_binary_factory = TBinaryProtocol.TBinaryProtocolFactory()
p_compact_factory = TCompactProtocol.TCompactProtocolFactory()

obj = I16(val=322768)

encoded = TSerialization.serialize(obj, protocol_factory=p_binary_factory)
print "Binary protocol:"
print map(bin,bytearray(encoded))
print map(hex,bytearray(encoded))
print

encoded = TSerialization.serialize(obj, protocol_factory=p_compact_factory)
print "Compact protocol:"
print map(bin,bytearray(encoded))
print map(hex,bytearray(encoded))

print("We made it!")
