local skynet=require "skynet"
local snax=require "snax"
---[[
skynet.start(function()
   -- local ps=snax.uniqueservice("redisquery_server","haha")
    --print(ps.req.verifyuser("jamesbond","007"))

    local ps=snax.queryservice("redisquery_server")
    print(ps.req.verifyuser("skynetlogin","007")) 

    print(ps.req.verifyuser("jamesbond","007"))
    skynet.exit()
end )

--]]

--skynet.call()
--local ps=snax.queryservice("redisquery_server")
--print(ps.req.verifyuser("skynetlogin","007")) 
