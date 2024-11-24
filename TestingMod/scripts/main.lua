local ITR2 = require("ITR2")

local function dummyFunc() end

local function testLibrary(library)
    for key, value in pairs(library) do
        if type(value) == "function" then
            print("Testing function: " .. key .. "\n")
            value(dummyFunc)
        elseif type(value) == "table" then
            print("----------\n")
            print("Entering table: " .. key .. '\n')
            testLibrary(value)
        end
    end
end

ExecuteWithDelay(3000, function() testLibrary(ITR2.Events) end)
