# Nui-Helper
A little script to help FiveM Nui Creators!


Is the first version of the script, any problems, can be reported in my discord aligoxtoso#8179

It's very simple to use!

# Installation
First, Download Project, and put it in your resource folder!

Now write on top of your __resource.lua or fxmanifest.lua file!


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


# Define Functions
In lua to define Functions to call 

```lua
local Funcs = {}

 -- Create Your Functions

Exports:SetTable(Funcs)
```

In js to define Functions to call 

```js
let exports = {};
  // Create Your Functions
new LuaExport(exports);
```

# Call Functions
In Javascript To call Lua Function write this code
```js
let Caller = new LuaCaller(your_resource_name)
let retorned = Caller.call(funcname,argss)
```
In Lua To call Javascript Function write this code
```lua
 let retorned = Exports:Call(funcname,arggs)
```


Any Problems Contact me in Discord aligoxtoso#8179! 
