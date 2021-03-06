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


class I64(object):
    """
    Attributes:
     - val
     - val_map
     - val_set
     - val_list
    """


    def __init__(self, val=None, val_map=None, val_set=None, val_list=None,):
        self.val = val
        self.val_map = val_map
        self.val_set = val_set
        self.val_list = val_list

    def read(self, iprot):
        if iprot._fast_decode is not None and isinstance(iprot.trans, TTransport.CReadableTransport) and self.thrift_spec is not None:
            iprot._fast_decode(self, iprot, [self.__class__, self.thrift_spec])
            return
        iprot.readStructBegin()
        while True:
            (fname, ftype, fid) = iprot.readFieldBegin()
            if ftype == TType.STOP:
                break
            if fid == 1:
                if ftype == TType.I64:
                    self.val = iprot.readI64()
                else:
                    iprot.skip(ftype)
            elif fid == 2:
                if ftype == TType.MAP:
                    self.val_map = {}
                    (_ktype1, _vtype2, _size0) = iprot.readMapBegin()
                    for _i4 in range(_size0):
                        _key5 = iprot.readI64()
                        _val6 = iprot.readI64()
                        self.val_map[_key5] = _val6
                    iprot.readMapEnd()
                else:
                    iprot.skip(ftype)
            elif fid == 3:
                if ftype == TType.SET:
                    self.val_set = set()
                    (_etype10, _size7) = iprot.readSetBegin()
                    for _i11 in range(_size7):
                        _elem12 = iprot.readI64()
                        self.val_set.add(_elem12)
                    iprot.readSetEnd()
                else:
                    iprot.skip(ftype)
            elif fid == 4:
                if ftype == TType.LIST:
                    self.val_list = []
                    (_etype16, _size13) = iprot.readListBegin()
                    for _i17 in range(_size13):
                        _elem18 = iprot.readI64()
                        self.val_list.append(_elem18)
                    iprot.readListEnd()
                else:
                    iprot.skip(ftype)
            else:
                iprot.skip(ftype)
            iprot.readFieldEnd()
        iprot.readStructEnd()

    def write(self, oprot):
        if oprot._fast_encode is not None and self.thrift_spec is not None:
            oprot.trans.write(oprot._fast_encode(self, [self.__class__, self.thrift_spec]))
            return
        oprot.writeStructBegin('I64')
        if self.val is not None:
            oprot.writeFieldBegin('val', TType.I64, 1)
            oprot.writeI64(self.val)
            oprot.writeFieldEnd()
        if self.val_map is not None:
            oprot.writeFieldBegin('val_map', TType.MAP, 2)
            oprot.writeMapBegin(TType.I64, TType.I64, len(self.val_map))
            for kiter19, viter20 in self.val_map.items():
                oprot.writeI64(kiter19)
                oprot.writeI64(viter20)
            oprot.writeMapEnd()
            oprot.writeFieldEnd()
        if self.val_set is not None:
            oprot.writeFieldBegin('val_set', TType.SET, 3)
            oprot.writeSetBegin(TType.I64, len(self.val_set))
            for iter21 in self.val_set:
                oprot.writeI64(iter21)
            oprot.writeSetEnd()
            oprot.writeFieldEnd()
        if self.val_list is not None:
            oprot.writeFieldBegin('val_list', TType.LIST, 4)
            oprot.writeListBegin(TType.I64, len(self.val_list))
            for iter22 in self.val_list:
                oprot.writeI64(iter22)
            oprot.writeListEnd()
            oprot.writeFieldEnd()
        oprot.writeFieldStop()
        oprot.writeStructEnd()

    def validate(self):
        return

    def __repr__(self):
        L = ['%s=%r' % (key, value)
             for key, value in self.__dict__.items()]
        return '%s(%s)' % (self.__class__.__name__, ', '.join(L))

    def __eq__(self, other):
        return isinstance(other, self.__class__) and self.__dict__ == other.__dict__

    def __ne__(self, other):
        return not (self == other)
all_structs.append(I64)
I64.thrift_spec = (
    None,  # 0
    (1, TType.I64, 'val', None, None, ),  # 1
    (2, TType.MAP, 'val_map', (TType.I64, None, TType.I64, None, False), None, ),  # 2
    (3, TType.SET, 'val_set', (TType.I64, None, False), None, ),  # 3
    (4, TType.LIST, 'val_list', (TType.I64, None, False), None, ),  # 4
)
fix_spec(all_structs)
del all_structs
