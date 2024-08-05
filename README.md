# ITR2-Lua
This repository provides common functions and item names to facilitate starting Lua mod development for ITR2. It will be continuously updated as new information is discovered or researched. While it may not cover everything comprehensively, we strive to include as much as possible.

If you find something missing, please contribute by making a pull request. Include proof to support your suggestion, unless you have an established good reputation.

To use as a library and not a reference, just `local ITR2 = require("ITR2")` and put the file next to your code.
The "hook" functions take an function input, and whatever input they normally require 

```lua
local ITR2 = require("ITR2")

-- Define the hook function
local function myLevelLoadHook() -- these functions can be renamed however you like
    print("Level Loaded")
end

-- Register the hook
ITR2.Hooks.OnLevelLoaded(myLevelLoadHook) -- func goes here

-- Define another hook function
local function myGameStartHook()
    print("Game Started")
end

-- Register the hook
ITR2.Hooks.OnGameStart(myGameStartHook)
```