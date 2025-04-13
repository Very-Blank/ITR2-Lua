local Callables = {
    Level = {},
    Enemy = {},
}

local levelSubsystem = nil

---@return string?
function Callables.Level.getCurrentLevelName()
    if levelSubsystem == nil or not levelSubsystem:IsValid() then
        levelSubsystem = FindFirstOf("RadiusLevelSubsystem")
        if levelSubsystem == nil or not levelSubsystem:IsValid() then
            return
        end
    end

    return levelSubsystem:getCurrentLevelName():ToString()
end

-- Example levelTag
-- local LevelTag = {
--     TagName = FName("Level.Radius.Peninsula")
-- }
---@param levelTag LevelTag
function Callables.Level.loadLevel(levelTag)
    if levelSubsystem == nil or not levelSubsystem:IsValid() then
        levelSubsystem = FindFirstOf("RadiusLevelSubsystem")
        if levelSubsystem == nil or not levelSubsystem:IsValid() then
            return
        end
    end

    levelSubsystem:LoadLevel(levelTag, false, true, true)
end

---@param tagName string
---@return string
function Callables.Enemy.enemyTagToName(tagName)
    local npcName = ""

    for value in string.gmatch(tagName, "[^%.]+") do
        npcName = value
    end

    return npcName
end



return Callables