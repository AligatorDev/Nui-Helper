
local Exports = {}
(function()
    function UpdateResourceName()
        SendNuiMessage({
            internal = true,
            var = "resourceName",
            set = GetCurrentResourceName()
        })  
    end
    local funcs = {}
    function Exports:SetTable(ftable) 
        funcs = ftable
        UpdateResourceName()
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
        local retorno = nil
        AddCallBack(callbackid,function(...)
            retorno = ...;
        end)
        while  retorno == nil do
            Citizen.Wait(10)
        end
        return retorno;
    end
    local clbs = {}


    function AddCallBack(cb,calb)
        clbs[cb] = calb;

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
            cb(json.encode(f(table.unpack(data.args))))
        end
    end)

end)()
