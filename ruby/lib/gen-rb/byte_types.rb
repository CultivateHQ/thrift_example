#
# Autogenerated by Thrift Compiler (0.11.0)
#
# DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
#

require 'thrift'

class Byte
  include ::Thrift::Struct, ::Thrift::Struct_Union
  VAL = 1
  VAL_MAP = 2
  VAL_SET = 3
  VAL_LIST = 4

  FIELDS = {
    VAL => {:type => ::Thrift::Types::BYTE, :name => 'val', :optional => true},
    VAL_MAP => {:type => ::Thrift::Types::MAP, :name => 'val_map', :key => {:type => ::Thrift::Types::BYTE}, :value => {:type => ::Thrift::Types::BYTE}, :optional => true},
    VAL_SET => {:type => ::Thrift::Types::SET, :name => 'val_set', :element => {:type => ::Thrift::Types::BYTE}, :optional => true},
    VAL_LIST => {:type => ::Thrift::Types::LIST, :name => 'val_list', :element => {:type => ::Thrift::Types::BYTE}, :optional => true}
  }

  def struct_fields; FIELDS; end

  def validate
  end

  ::Thrift::Struct.generate_accessors self
end

