local login = require "snax.loginserver"
local crypt = require "crypt"
local skynet = require "skynet"

local snax=require "snax"
--loginserver
local server = {
	host = "127.0.0.1",
	port = 8001,
	multilogin = false,	-- disallow multilogin
	name = "login_master",
  instance=6
}

local server_list = {}
local user_online = {}
local user_login = {}



function server.auth_handler(token)
	-- the token is base64(user)@base64(server):base64(password)
	local user, server, password = token:match("([^@]+)@([^:]+):(.+)")
	user = crypt.base64decode(user)
	server = crypt.base64decode(server)
	password = crypt.base64decode(password)
	--assert(password == "password")
  local ps=snax.queryservice("redisquery_server")
  if("u100"==ps.req.verifyuser(user,password)) then
    print( "bingo "..user.." verify ok ")
    return server, user
  else 
    print("no user "..user.." verify fail ")
    assert(false)
  end
  
  
  
	
end

function server.login_handler(server, uid, secret)
	print(string.format("%s@%s is login, secret is %s", uid, server, crypt.hexencode(secret)))
	local gameserver = assert(server_list[server], "Unknown server")
	-- only one can login, because disallow multilogin
	local last = user_online[uid]
	if last then
		skynet.call(last.address, "lua", "kick", uid, last.subid)
	end
	if user_online[uid] then
		error(string.format("user %s is already online", uid))
	end

	local subid = tostring(skynet.call(gameserver, "lua", "login", uid, secret))
	user_online[uid] = { address = gameserver, subid = subid , server = server}
  --[[
  for k,v in pairs(user_online) do
    print(k,v)
  end
  --]]
  
	return subid
end

local CMD = {}

function CMD.register_gate(server, address)
	server_list[server] = address
end

function CMD.logout(uid, subid)
	local u = user_online[uid]
	if u then
		print(string.format("%s@%s is logout", uid, u.server))
		user_online[uid] = nil
	end
end

function server.command_handler(command, source, ...)
	local f = assert(CMD[command])
	return f(source, ...)
end

--print("begin to login(server)")
login(server)
