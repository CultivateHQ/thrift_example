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


class Ex(TException):
    """
    Attributes:
     - message
     - num
    """


    def __init__(self, message=None, num=None,):
        self.message = message
        self.num = num

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
                if ftype == TType.STRING:
                    self.message = iprot.readString().decode('utf-8') if sys.version_info[0] == 2 else iprot.readString()
                else:
                    iprot.skip(ftype)
            elif fid == 99:
                if ftype == TType.BYTE:
                    self.num = iprot.readByte()
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
        oprot.writeStructBegin('Ex')
        if self.message is not None:
            oprot.writeFieldBegin('message', TType.STRING, 1)
            oprot.writeString(self.message.encode('utf-8') if sys.version_info[0] == 2 else self.message)
            oprot.writeFieldEnd()
        if self.num is not None:
            oprot.writeFieldBegin('num', TType.BYTE, 99)
            oprot.writeByte(self.num)
            oprot.writeFieldEnd()
        oprot.writeFieldStop()
        oprot.writeStructEnd()

    def validate(self):
        return

    def __str__(self):
        return repr(self)

    def __repr__(self):
        L = ['%s=%r' % (key, value)
             for key, value in self.__dict__.items()]
        return '%s(%s)' % (self.__class__.__name__, ', '.join(L))

    def __eq__(self, other):
        return isinstance(other, self.__class__) and self.__dict__ == other.__dict__

    def __ne__(self, other):
        return not (self == other)


class Ex2(TException):
    """
    Attributes:
     - error_code
    """


    def __init__(self, error_code=None,):
        self.error_code = error_code

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
                if ftype == TType.I16:
                    self.error_code = iprot.readI16()
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
        oprot.writeStructBegin('Ex2')
        if self.error_code is not None:
            oprot.writeFieldBegin('error_code', TType.I16, 1)
            oprot.writeI16(self.error_code)
            oprot.writeFieldEnd()
        oprot.writeFieldStop()
        oprot.writeStructEnd()

    def validate(self):
        return

    def __str__(self):
        return repr(self)

    def __repr__(self):
        L = ['%s=%r' % (key, value)
             for key, value in self.__dict__.items()]
        return '%s(%s)' % (self.__class__.__name__, ', '.join(L))

    def __eq__(self, other):
        return isinstance(other, self.__class__) and self.__dict__ == other.__dict__

    def __ne__(self, other):
        return not (self == other)


class TException(object):
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
                if ftype == TType.STRUCT:
                    self.val = Ex()
                    self.val.read(iprot)
                else:
                    iprot.skip(ftype)
            elif fid == 2:
                if ftype == TType.MAP:
                    self.val_map = {}
                    (_ktype1, _vtype2, _size0) = iprot.readMapBegin()
                    for _i4 in range(_size0):
                        _key5 = Ex()
                        _key5.read(iprot)
                        _val6 = Ex()
                        _val6.read(iprot)
                        self.val_map[_key5] = _val6
                    iprot.readMapEnd()
                else:
                    iprot.skip(ftype)
            elif fid == 3:
                if ftype == TType.SET:
                    self.val_set = set()
                    (_etype10, _size7) = iprot.readSetBegin()
                    for _i11 in range(_size7):
                        _elem12 = Ex()
                        _elem12.read(iprot)
                        self.val_set.add(_elem12)
                    iprot.readSetEnd()
                else:
                    iprot.skip(ftype)
            elif fid == 4:
                if ftype == TType.LIST:
                    self.val_list = []
                    (_etype16, _size13) = iprot.readListBegin()
                    for _i17 in range(_size13):
                        _elem18 = Ex()
                        _elem18.read(iprot)
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
        oprot.writeStructBegin('TException')
        if self.val is not None:
            oprot.writeFieldBegin('val', TType.STRUCT, 1)
            self.val.write(oprot)
            oprot.writeFieldEnd()
        if self.val_map is not None:
            oprot.writeFieldBegin('val_map', TType.MAP, 2)
            oprot.writeMapBegin(TType.STRUCT, TType.STRUCT, len(self.val_map))
            for kiter19, viter20 in self.val_map.items():
                kiter19.write(oprot)
                viter20.write(oprot)
            oprot.writeMapEnd()
            oprot.writeFieldEnd()
        if self.val_set is not None:
            oprot.writeFieldBegin('val_set', TType.SET, 3)
            oprot.writeSetBegin(TType.STRUCT, len(self.val_set))
            for iter21 in self.val_set:
                iter21.write(oprot)
            oprot.writeSetEnd()
            oprot.writeFieldEnd()
        if self.val_list is not None:
            oprot.writeFieldBegin('val_list', TType.LIST, 4)
            oprot.writeListBegin(TType.STRUCT, len(self.val_list))
            for iter22 in self.val_list:
                iter22.write(oprot)
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
all_structs.append(Ex)
Ex.thrift_spec = (
    None,  # 0
    (1, TType.STRING, 'message', 'UTF8', None, ),  # 1
    None,  # 2
    None,  # 3
    None,  # 4
    None,  # 5
    None,  # 6
    None,  # 7
    None,  # 8
    None,  # 9
    None,  # 10
    None,  # 11
    None,  # 12
    None,  # 13
    None,  # 14
    None,  # 15
    None,  # 16
    None,  # 17
    None,  # 18
    None,  # 19
    None,  # 20
    None,  # 21
    None,  # 22
    None,  # 23
    None,  # 24
    None,  # 25
    None,  # 26
    None,  # 27
    None,  # 28
    None,  # 29
    None,  # 30
    None,  # 31
    None,  # 32
    None,  # 33
    None,  # 34
    None,  # 35
    None,  # 36
    None,  # 37
    None,  # 38
    None,  # 39
    None,  # 40
    None,  # 41
    None,  # 42
    None,  # 43
    None,  # 44
    None,  # 45
    None,  # 46
    None,  # 47
    None,  # 48
    None,  # 49
    None,  # 50
    None,  # 51
    None,  # 52
    None,  # 53
    None,  # 54
    None,  # 55
    None,  # 56
    None,  # 57
    None,  # 58
    None,  # 59
    None,  # 60
    None,  # 61
    None,  # 62
    None,  # 63
    None,  # 64
    None,  # 65
    None,  # 66
    None,  # 67
    None,  # 68
    None,  # 69
    None,  # 70
    None,  # 71
    None,  # 72
    None,  # 73
    None,  # 74
    None,  # 75
    None,  # 76
    None,  # 77
    None,  # 78
    None,  # 79
    None,  # 80
    None,  # 81
    None,  # 82
    None,  # 83
    None,  # 84
    None,  # 85
    None,  # 86
    None,  # 87
    None,  # 88
    None,  # 89
    None,  # 90
    None,  # 91
    None,  # 92
    None,  # 93
    None,  # 94
    None,  # 95
    None,  # 96
    None,  # 97
    None,  # 98
    (99, TType.BYTE, 'num', None, None, ),  # 99
)
all_structs.append(Ex2)
Ex2.thrift_spec = (
    None,  # 0
    (1, TType.I16, 'error_code', None, None, ),  # 1
)
all_structs.append(TException)
TException.thrift_spec = (
    None,  # 0
    (1, TType.STRUCT, 'val', [Ex, None], None, ),  # 1
    (2, TType.MAP, 'val_map', (TType.STRUCT, [Ex, None], TType.STRUCT, [Ex, None], False), None, ),  # 2
    (3, TType.SET, 'val_set', (TType.STRUCT, [Ex, None], False), None, ),  # 3
    (4, TType.LIST, 'val_list', (TType.STRUCT, [Ex, None], False), None, ),  # 4
)
fix_spec(all_structs)
del all_structs
