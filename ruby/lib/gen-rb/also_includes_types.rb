#
# Autogenerated by Thrift Compiler (0.11.0)
#
# DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
#

require 'thrift'
require 'included_constants_types'


class SomeOtherName
  include ::Thrift::Struct, ::Thrift::Struct_Union
  ID = 1

  FIELDS = {
    ID => {:type => ::Thrift::Types::I32, :name => 'id'}
  }

  def struct_fields; FIELDS; end

  def validate
  end

  ::Thrift::Struct.generate_accessors self
end

