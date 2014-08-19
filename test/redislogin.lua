local skynet=require "skynet"
local snax=require "snax"

skynet.start(function()
    local ps=snax.uniqueservice("redisquery_server","haha")
   -- print(ps.req.verifyuser("jamesbond","007"))
    skynet.exit()    
end )
