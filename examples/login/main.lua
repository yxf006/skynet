local skynet = require "skynet"

skynet.start(function()
  print("Logind Server start")
  
	local loginserver = skynet.newservice("logind-y")
	local gate = skynet.newservice("gated", loginserver)
  
	local console = skynet.newservice("console")
	skynet.newservice("debug_console",8000)
	--skynet.newservice("simpledb")
	--local watchdog = skynet.newservice("watchdog")
  
  

	skynet.call(gate, "lua", "open" , {
		port = 8888,
		maxclient = 64,
		servername = "sample",
	})
end)
