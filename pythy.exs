:ok = File.cd("#{__DIR__}/python")

{out, 0} = System.cmd("python2", ["main.py"])

out
|> String.trim_trailing()
|> IO.inspect()
