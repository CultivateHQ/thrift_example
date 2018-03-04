#!/usr/bin/env ruby

require "./lib/require_the_things"

thrift_struct = eval(ARGV[1])

if ARGV[0] == "bin"
  puts Serialising.binary_serialise(thrift_struct)
else
  puts Serialising.compact_serialise(thrift_struct)
end
