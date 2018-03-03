gen_dir = "#{__dir__}/gen-rb"

$:.unshift(gen_dir)
$:.unshift(__dir__)

Dir["#{__dir__}/gen-rb/*.rb"]
  .map{|f| File.basename(f) }
  .map{|f| f.delete_suffix(".rb")}
  .each {|f| require f }

require 'serialising'
