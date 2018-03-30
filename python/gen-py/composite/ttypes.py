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


class Composite(object):
    """
    Attributes:
     - map_of_maps
     - map_of_sets
     - map_of_lists
     - set_of_maps
     - set_of_sets
     - set_of_lists
     - list_of_maps
     - list_of_sets
     - list_of_lists
    """


    def __init__(self, map_of_maps=None, map_of_sets=None, map_of_lists=None, set_of_maps=None, set_of_sets=None, set_of_lists=None, list_of_maps=None, list_of_sets=None, list_of_lists=None,):
        self.map_of_maps = map_of_maps
        self.map_of_sets = map_of_sets
        self.map_of_lists = map_of_lists
        self.set_of_maps = set_of_maps
        self.set_of_sets = set_of_sets
        self.set_of_lists = set_of_lists
        self.list_of_maps = list_of_maps
        self.list_of_sets = list_of_sets
        self.list_of_lists = list_of_lists

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
                if ftype == TType.MAP:
                    self.map_of_maps = {}
                    (_ktype1, _vtype2, _size0) = iprot.readMapBegin()
                    for _i4 in range(_size0):
                        _key5 = {}
                        (_ktype8, _vtype9, _size7) = iprot.readMapBegin()
                        for _i11 in range(_size7):
                            _key12 = iprot.readByte()
                            _val13 = iprot.readByte()
                            _key5[_key12] = _val13
                        iprot.readMapEnd()
                        _val6 = {}
                        (_ktype15, _vtype16, _size14) = iprot.readMapBegin()
                        for _i18 in range(_size14):
                            _key19 = iprot.readByte()
                            _val20 = iprot.readByte()
                            _val6[_key19] = _val20
                        iprot.readMapEnd()
                        self.map_of_maps[_key5] = _val6
                    iprot.readMapEnd()
                else:
                    iprot.skip(ftype)
            elif fid == 2:
                if ftype == TType.MAP:
                    self.map_of_sets = {}
                    (_ktype22, _vtype23, _size21) = iprot.readMapBegin()
                    for _i25 in range(_size21):
                        _key26 = set()
                        (_etype31, _size28) = iprot.readSetBegin()
                        for _i32 in range(_size28):
                            _elem33 = iprot.readByte()
                            _key26.add(_elem33)
                        iprot.readSetEnd()
                        _val27 = set()
                        (_etype37, _size34) = iprot.readSetBegin()
                        for _i38 in range(_size34):
                            _elem39 = iprot.readByte()
                            _val27.add(_elem39)
                        iprot.readSetEnd()
                        self.map_of_sets[_key26] = _val27
                    iprot.readMapEnd()
                else:
                    iprot.skip(ftype)
            elif fid == 3:
                if ftype == TType.MAP:
                    self.map_of_lists = {}
                    (_ktype41, _vtype42, _size40) = iprot.readMapBegin()
                    for _i44 in range(_size40):
                        _key45 = []
                        (_etype50, _size47) = iprot.readListBegin()
                        for _i51 in range(_size47):
                            _elem52 = iprot.readByte()
                            _key45.append(_elem52)
                        iprot.readListEnd()
                        _val46 = []
                        (_etype56, _size53) = iprot.readListBegin()
                        for _i57 in range(_size53):
                            _elem58 = iprot.readByte()
                            _val46.append(_elem58)
                        iprot.readListEnd()
                        self.map_of_lists[_key45] = _val46
                    iprot.readMapEnd()
                else:
                    iprot.skip(ftype)
            elif fid == 4:
                if ftype == TType.SET:
                    self.set_of_maps = set()
                    (_etype62, _size59) = iprot.readSetBegin()
                    for _i63 in range(_size59):
                        _elem64 = {}
                        (_ktype66, _vtype67, _size65) = iprot.readMapBegin()
                        for _i69 in range(_size65):
                            _key70 = iprot.readByte()
                            _val71 = iprot.readByte()
                            _elem64[_key70] = _val71
                        iprot.readMapEnd()
                        self.set_of_maps.add(_elem64)
                    iprot.readSetEnd()
                else:
                    iprot.skip(ftype)
            elif fid == 5:
                if ftype == TType.SET:
                    self.set_of_sets = set()
                    (_etype75, _size72) = iprot.readSetBegin()
                    for _i76 in range(_size72):
                        _elem77 = set()
                        (_etype81, _size78) = iprot.readSetBegin()
                        for _i82 in range(_size78):
                            _elem83 = iprot.readByte()
                            _elem77.add(_elem83)
                        iprot.readSetEnd()
                        self.set_of_sets.add(_elem77)
                    iprot.readSetEnd()
                else:
                    iprot.skip(ftype)
            elif fid == 6:
                if ftype == TType.SET:
                    self.set_of_lists = set()
                    (_etype87, _size84) = iprot.readSetBegin()
                    for _i88 in range(_size84):
                        _elem89 = []
                        (_etype93, _size90) = iprot.readListBegin()
                        for _i94 in range(_size90):
                            _elem95 = iprot.readByte()
                            _elem89.append(_elem95)
                        iprot.readListEnd()
                        self.set_of_lists.add(_elem89)
                    iprot.readSetEnd()
                else:
                    iprot.skip(ftype)
            elif fid == 7:
                if ftype == TType.LIST:
                    self.list_of_maps = []
                    (_etype99, _size96) = iprot.readListBegin()
                    for _i100 in range(_size96):
                        _elem101 = {}
                        (_ktype103, _vtype104, _size102) = iprot.readMapBegin()
                        for _i106 in range(_size102):
                            _key107 = iprot.readByte()
                            _val108 = iprot.readByte()
                            _elem101[_key107] = _val108
                        iprot.readMapEnd()
                        self.list_of_maps.append(_elem101)
                    iprot.readListEnd()
                else:
                    iprot.skip(ftype)
            elif fid == 8:
                if ftype == TType.LIST:
                    self.list_of_sets = []
                    (_etype112, _size109) = iprot.readListBegin()
                    for _i113 in range(_size109):
                        _elem114 = set()
                        (_etype118, _size115) = iprot.readSetBegin()
                        for _i119 in range(_size115):
                            _elem120 = iprot.readByte()
                            _elem114.add(_elem120)
                        iprot.readSetEnd()
                        self.list_of_sets.append(_elem114)
                    iprot.readListEnd()
                else:
                    iprot.skip(ftype)
            elif fid == 9:
                if ftype == TType.LIST:
                    self.list_of_lists = []
                    (_etype124, _size121) = iprot.readListBegin()
                    for _i125 in range(_size121):
                        _elem126 = []
                        (_etype130, _size127) = iprot.readListBegin()
                        for _i131 in range(_size127):
                            _elem132 = iprot.readByte()
                            _elem126.append(_elem132)
                        iprot.readListEnd()
                        self.list_of_lists.append(_elem126)
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
        oprot.writeStructBegin('Composite')
        if self.map_of_maps is not None:
            oprot.writeFieldBegin('map_of_maps', TType.MAP, 1)
            oprot.writeMapBegin(TType.MAP, TType.MAP, len(self.map_of_maps))
            for kiter133, viter134 in self.map_of_maps.items():
                oprot.writeMapBegin(TType.BYTE, TType.BYTE, len(kiter133))
                for kiter135, viter136 in kiter133.items():
                    oprot.writeByte(kiter135)
                    oprot.writeByte(viter136)
                oprot.writeMapEnd()
                oprot.writeMapBegin(TType.BYTE, TType.BYTE, len(viter134))
                for kiter137, viter138 in viter134.items():
                    oprot.writeByte(kiter137)
                    oprot.writeByte(viter138)
                oprot.writeMapEnd()
            oprot.writeMapEnd()
            oprot.writeFieldEnd()
        if self.map_of_sets is not None:
            oprot.writeFieldBegin('map_of_sets', TType.MAP, 2)
            oprot.writeMapBegin(TType.SET, TType.SET, len(self.map_of_sets))
            for kiter139, viter140 in self.map_of_sets.items():
                oprot.writeSetBegin(TType.BYTE, len(kiter139))
                for iter141 in kiter139:
                    oprot.writeByte(iter141)
                oprot.writeSetEnd()
                oprot.writeSetBegin(TType.BYTE, len(viter140))
                for iter142 in viter140:
                    oprot.writeByte(iter142)
                oprot.writeSetEnd()
            oprot.writeMapEnd()
            oprot.writeFieldEnd()
        if self.map_of_lists is not None:
            oprot.writeFieldBegin('map_of_lists', TType.MAP, 3)
            oprot.writeMapBegin(TType.LIST, TType.LIST, len(self.map_of_lists))
            for kiter143, viter144 in self.map_of_lists.items():
                oprot.writeListBegin(TType.BYTE, len(kiter143))
                for iter145 in kiter143:
                    oprot.writeByte(iter145)
                oprot.writeListEnd()
                oprot.writeListBegin(TType.BYTE, len(viter144))
                for iter146 in viter144:
                    oprot.writeByte(iter146)
                oprot.writeListEnd()
            oprot.writeMapEnd()
            oprot.writeFieldEnd()
        if self.set_of_maps is not None:
            oprot.writeFieldBegin('set_of_maps', TType.SET, 4)
            oprot.writeSetBegin(TType.MAP, len(self.set_of_maps))
            for iter147 in self.set_of_maps:
                oprot.writeMapBegin(TType.BYTE, TType.BYTE, len(iter147))
                for kiter148, viter149 in iter147.items():
                    oprot.writeByte(kiter148)
                    oprot.writeByte(viter149)
                oprot.writeMapEnd()
            oprot.writeSetEnd()
            oprot.writeFieldEnd()
        if self.set_of_sets is not None:
            oprot.writeFieldBegin('set_of_sets', TType.SET, 5)
            oprot.writeSetBegin(TType.SET, len(self.set_of_sets))
            for iter150 in self.set_of_sets:
                oprot.writeSetBegin(TType.BYTE, len(iter150))
                for iter151 in iter150:
                    oprot.writeByte(iter151)
                oprot.writeSetEnd()
            oprot.writeSetEnd()
            oprot.writeFieldEnd()
        if self.set_of_lists is not None:
            oprot.writeFieldBegin('set_of_lists', TType.SET, 6)
            oprot.writeSetBegin(TType.LIST, len(self.set_of_lists))
            for iter152 in self.set_of_lists:
                oprot.writeListBegin(TType.BYTE, len(iter152))
                for iter153 in iter152:
                    oprot.writeByte(iter153)
                oprot.writeListEnd()
            oprot.writeSetEnd()
            oprot.writeFieldEnd()
        if self.list_of_maps is not None:
            oprot.writeFieldBegin('list_of_maps', TType.LIST, 7)
            oprot.writeListBegin(TType.MAP, len(self.list_of_maps))
            for iter154 in self.list_of_maps:
                oprot.writeMapBegin(TType.BYTE, TType.BYTE, len(iter154))
                for kiter155, viter156 in iter154.items():
                    oprot.writeByte(kiter155)
                    oprot.writeByte(viter156)
                oprot.writeMapEnd()
            oprot.writeListEnd()
            oprot.writeFieldEnd()
        if self.list_of_sets is not None:
            oprot.writeFieldBegin('list_of_sets', TType.LIST, 8)
            oprot.writeListBegin(TType.SET, len(self.list_of_sets))
            for iter157 in self.list_of_sets:
                oprot.writeSetBegin(TType.BYTE, len(iter157))
                for iter158 in iter157:
                    oprot.writeByte(iter158)
                oprot.writeSetEnd()
            oprot.writeListEnd()
            oprot.writeFieldEnd()
        if self.list_of_lists is not None:
            oprot.writeFieldBegin('list_of_lists', TType.LIST, 9)
            oprot.writeListBegin(TType.LIST, len(self.list_of_lists))
            for iter159 in self.list_of_lists:
                oprot.writeListBegin(TType.BYTE, len(iter159))
                for iter160 in iter159:
                    oprot.writeByte(iter160)
                oprot.writeListEnd()
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
all_structs.append(Composite)
Composite.thrift_spec = (
    None,  # 0
    (1, TType.MAP, 'map_of_maps', (TType.MAP, (TType.BYTE, None, TType.BYTE, None, False), TType.MAP, (TType.BYTE, None, TType.BYTE, None, False), False), None, ),  # 1
    (2, TType.MAP, 'map_of_sets', (TType.SET, (TType.BYTE, None, False), TType.SET, (TType.BYTE, None, False), False), None, ),  # 2
    (3, TType.MAP, 'map_of_lists', (TType.LIST, (TType.BYTE, None, False), TType.LIST, (TType.BYTE, None, False), False), None, ),  # 3
    (4, TType.SET, 'set_of_maps', (TType.MAP, (TType.BYTE, None, TType.BYTE, None, False), False), None, ),  # 4
    (5, TType.SET, 'set_of_sets', (TType.SET, (TType.BYTE, None, False), False), None, ),  # 5
    (6, TType.SET, 'set_of_lists', (TType.LIST, (TType.BYTE, None, False), False), None, ),  # 6
    (7, TType.LIST, 'list_of_maps', (TType.MAP, (TType.BYTE, None, TType.BYTE, None, False), False), None, ),  # 7
    (8, TType.LIST, 'list_of_sets', (TType.SET, (TType.BYTE, None, False), False), None, ),  # 8
    (9, TType.LIST, 'list_of_lists', (TType.LIST, (TType.BYTE, None, False), False), None, ),  # 9
)
fix_spec(all_structs)
del all_structs