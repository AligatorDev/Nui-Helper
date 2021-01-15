sendRes = function(resourceName,CallbackID,content)
{   
    let mandar = {}
    var req = new XMLHttpRequest();
    req.open("post", `http://${resourceName}/CALLBACKS`, false);
    mandar.callbackid = CallbackID
    mandar.retorno = content
    req.send(JSON.stringify(mandar));
    return req
}
class LuaExport {
    resourceName;
    constructor(functions) {
        window.addEventListener("message", function(event) {

            if (event.data.internal) {
                if(event.data.var) {
                    if(event.data.set) 
                        this[event.data.var] = event.data.set;
                } 
            } else {
                let f = functions[event.data.func];
                
                if(f) {
                    this.resourceName = event.data.resname
                    sendRes(event.data.resname,event.data.callbackid,f(...JSON.parse((event.data.args == null) ? {} : event.data.args)));
                }
            }
            
            
        });      
    }
}





class LuaCaller {
    resourceName;
    #CallLuaFunc = function(FunctionName,content)
    {  
        let tbl = {}
        tbl.func = FunctionName
        tbl.args = content;
        var req = new XMLHttpRequest();
        req.open("post", `http://${this.resourceName}/func`, false);
        req.send(JSON.stringify(tbl));

        return JSON.parse(req.responseText);
    }
    constructor(name) {
        this.resourceName = name;
    }
    call(name,...args) {
        return this.#CallLuaFunc(name,[...args]);
    }
}
