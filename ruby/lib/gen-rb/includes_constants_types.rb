#
# Autogenerated by Thrift Compiler (0.11.0)
#
# DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
#

require 'thrift'
require 'included_constants_types'


class IncludesConstants
  include ::Thrift::Struct, ::Thrift::Struct_Union
  NAME = 1
  Z = 2

  FIELDS = {
    NAME => {:type => ::Thrift::Types::STRING, :name => 'name'},
    Z => {:type => ::Thrift::Types::BYTE, :name => 'z', :default => 26}
  }

  def struct_fields; FIELDS; end

  def validate
  end

  ::Thrift::Struct.generate_accessors self
end

