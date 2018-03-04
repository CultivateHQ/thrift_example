if length(System.argv()) < 1 do
  IO.puts("Nope!")
  System.halt()
end

[ruby_struct | arg_rest] = System.argv()

:ok = File.cd("#{__DIR__}/ruby")

protocol =
  case arg_rest do
    ["bin"] -> "bin"
    _ -> "compact"
  end

{out, 0} = System.cmd("ruby", ["ser.rb", protocol, ruby_struct])

IO.inspect(out)
