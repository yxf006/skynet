local skynet=require "skynet"

function init(...)
    print("redis query server start:",...)
    

end


function response.verifyuser(id,pwd)
    print("start user verify:","id =",id,"pwd = ",pwd)
    return "bingo"

end

function exit(...)
    print("verify user server exit:",...)
end

