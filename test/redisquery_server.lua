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


function response.verifyuser(id,pwd)
    print("start user verify:","id =",id,"pwd = ",pwd)
    --assert (db:get(id) ==pwd,"no user")
    if  (db:get(id) ==pwd) then
        return "bingo"

    else  
        return "no user"
    end


end

function exit(...)
    print("verify user server exit:",...)
    db:disconnect()
end

