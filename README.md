# Nui-Helper
A little script to help FiveM Nui Creators!


Is that, The first version of the script, any problems, can be reported in my discord aligoxtoso#8179

It's very simple to use!

First, Download Project, and put it in your resource folder!

Now write in top of your __resource.lua or fxmanifest.lua file!


```lua
  files {
    "NuiHelper_Aligator/NuiHelperJS.js",
  }

  client_script "NuiHelper_Aligator/NuiHelperLua.lua"
```

Before that, to use Nui Helper JS

Put in header of your html page!
```html
      <script src="NuiHelper.js"> </script> <!-- 
        https://github.com/AligatorDev/Nui-Helper
        By Aligator
    --> 
```

Yuup, now Nui Helper already installed!

In Javascript To call Lua Function write this code
```js
  let Caller = LuaCaller(your_resource_name)
  let retorned = Caller.call(funcname,argss)
```
In Lua To call Javascript Function write this code
```lua
   let retorned = Exports:Call(funcname,arggs)
```

In lua to define Functions to call 

```lua
  local Funcs = {}
  
   -- Create Your Functions
  
  Exports:SetTable(Funcs)
```

In js to define Functions to call 

```js
   let exports = {};
      -- Create Your Functions
   new LuaExport(exports);
```



Any Problems Contact me in Discord! 
