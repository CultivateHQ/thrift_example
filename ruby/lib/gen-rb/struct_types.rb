#
# Autogenerated by Thrift Compiler (0.11.0)
#
# DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
#

require 'thrift'

class Val
  include ::Thrift::Struct, ::Thrift::Struct_Union
  NUM = 99

  FIELDS = {
    NUM => {:type => ::Thrift::Types::BYTE, :name => 'num', :optional => true}
  }

  def struct_fields; FIELDS; end

  def validate
  end

  ::Thrift::Struct.generate_accessors self
end

class TStruct
  include ::Thrift::Struct, ::Thrift::Struct_Union
  VAL = 1
  VAL_MAP = 2
  VAL_SET = 3
  VAL_LIST = 4

  FIELDS = {
    VAL => {:type => ::Thrift::Types::STRUCT, :name => 'val', :class => ::Val, :optional => true},
    VAL_MAP => {:type => ::Thrift::Types::MAP, :name => 'val_map', :key => {:type => ::Thrift::Types::STRUCT, :class => ::Val}, :value => {:type => ::Thrift::Types::STRUCT, :class => ::Val}, :optional => true},
    VAL_SET => {:type => ::Thrift::Types::SET, :name => 'val_set', :element => {:type => ::Thrift::Types::STRUCT, :class => ::Val}, :optional => true},
    VAL_LIST => {:type => ::Thrift::Types::LIST, :name => 'val_list', :element => {:type => ::Thrift::Types::STRUCT, :class => ::Val}, :optional => true}
  }

  def struct_fields; FIELDS; end

  def validate
  end

  ::Thrift::Struct.generate_accessors self
end

