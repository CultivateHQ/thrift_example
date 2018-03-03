module Serialising

  def self.binary_serialise(thrift_struct)
    Thrift::Serializer.new().serialize(thrift_struct)
  end
end
