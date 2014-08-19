package.cpath = "luaclib/?.so"
local snax=require "snax"
--local skynet=require "skynet"


--skynet.call("redisquery_server","lua","verifyuser","skynetlogin","007")

--[[
skynet.start(function()
   -- local ps=snax.uniqueservice("redisquery_server","haha")
    --print(ps.req.verifyuser("jamesbond","007"))

    local ps=snax.queryservice("redisquery_server")
    print(ps.req.verifyuser("skynetlogin","007")) 

    print(ps.req.verifyuser("jamesbond","007"))
    skynet.exit()
end )

--]]

--ps=snax.queryservice("redisquery_server")
--print(ps.req.verifyuser("skynetlogin","007")) 

