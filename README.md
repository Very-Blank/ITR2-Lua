# ITR2-Lua
This repository provides common functions and item names to facilitate starting Lua mod development for ITR2. It will be continuously updated as new information is discovered or researched. While it may not cover everything comprehensively, we strive to include as much as possible.

If you find something missing, please contribute by making a pull request. Include proof to support your suggestion, unless you have an established good reputation.

To use the ITR2 library locally, simply place the ITR2 file in the same directory as your code and include it with local ITR2 = require("ITR2"). 
ITR2 can also but into the shared folder so all mods can share the same lib.

```lua
local ITR2 = require("ITR2")

ITR2.Events.RadiusGameInstance.OnLevelLoaded(function()
    NotifyOnNewObject(ITR2.Items.Firearms.Primary.Saiga.Saiga_Mag_Long, function(mag)
        ExecuteWithDelay(100, function ()
            print("Saiga long mag")
            print(#mag.BulletComponentArr)
        end)
    end)

    NotifyOnNewObject(ITR2.Items.Firearms.Primary.Saiga.Saiga, function(context)
        ExecuteWithDelay(100, function ()
            print("Saiga")
        end)
    end)
end)
```
