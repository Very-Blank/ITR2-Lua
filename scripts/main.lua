local ITR2 = require("shared.ITR2")

local function dummyFunc()
end

local function testLibrary(library)
    for key, value in pairs(library) do
        if type(value) == "function" then
            print("Testing function:", key)
            value(dummyFunc)
        elseif type(value) == "table" then
            print("Entering table:", key)
            testLibrary(value)
        end
    end
end

ExecuteWithDelay(3000, function ()
    testLibrary(ITR2)
end)

