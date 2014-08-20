local skynet=require "skynet"

local redis =require "redis"

local redisconf={
    host="127.0.0.1",
    port=6379,
    db=0

}



function init(...)
    print("redis query server start:",...)
    db=redis.connect(redisconf)
    print("redis connect success ")

end


function response.verifyuser(uid,pwd)
    print("start user verify:","uid =",uid,"pwd = ",pwd)
    --assert (db:get(id) ==pwd,"no user")
    if  (db:get(uid) ==pwd) then
        --print( "bingo "..uid.." verify ok ")
        return "u100"

    else  
        --print("no user "..uid.." verify fail ")
        return "u404"
    end


end

function exit(...)
    print("verify user server exit:",...)
    db:disconnect()
end

