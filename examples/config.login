root = "./"
thread = 8
logger = nil
harbor = 0
start = "main"
bootstrap = "snlua bootstrap"	-- The service for bootstrap
luaservice = "./service/?.lua;./examples/login/?.lua;./test/?.lua"
lualoader = "lualib/loader.lua"
cpath = "./cservice/?.so"
snax = root.."examples/?.lua;"..root.."test/?.lua"

