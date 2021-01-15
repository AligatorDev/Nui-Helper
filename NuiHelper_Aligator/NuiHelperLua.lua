
Exports = {}
local funcs = {}
local clbs = {}
local function UpdateResourceName()
    SendNuiMessage({
        internal = true,
        var = "resourceName",
        set = GetCurrentResourceName()
    })  
end
local function AddCallBack(cb,calb)
    clbs[cb] = calb;

end
function Exports:SetTable(ftable) 
    funcs = ftable
end



function Exports:Call(name,...) 
    callbackid = GetGameTimer()
    SendNuiMessage(json.encode({
        internal = false,
        func = name,
        resname = GetCurrentResourceName(),
        callbackid = callbackid,
        args = json.encode({...});
    }))  
    local retorned = false;
    local retorno = nil
    AddCallBack(callbackid,function(...)
        retorned = true;
        retorno = ...;
    end)
    while  retorned == false do
        Citizen.Wait(10)
    end
    return retorno;
end




RegisterNUICallback('CALLBACKS', function(data, cb)
    local f =  clbs[data.callbackid]
    if f then
        f(data.retorno)
        clbs[data.callbackid] = nil;
    end
    cb("ok")
end)
RegisterNUICallback('func', function(data, cb)
    local f =  funcs[data.func]
    if f then
         local retorno = f(table.unpack(data.args))
        if retorno then
            retorno = json.encode(retorno);
        else
            retorno = "null"
        end
        cb(retorno)
    end
end)

