local skynet=require "skynet"
local snax=require "snax"
---[[
skynet.start(function()
    --local ps=snax.uniqueservice("redisquery_server","haha")
    --print(ps.req.verifyuser("jamesbond","007"))

    local ps=snax.queryservice("redisquery_server")
    print(ps.req.verifyuser("skynetlogin","007")) 

    print(ps.req.verifyuser("jamesbond","007"))
   --snax.kill(ps)
     skynet.exit()
end )

--]]


--local ps=snax.queryservice("redisquery_server","haha")
--print(ps.req.verifyuser("skynetlogin","007")) 

