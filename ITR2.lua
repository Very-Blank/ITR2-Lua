local ITR2 = {
    version = "0.10.2", -- version this was last updated for

    GameInstance = {
        ---@param func function
        OnLevelLoaded = function(func)
            RegisterHook("/Script/IntoTheRadius2.RadiusGameInstance:OnLevelLoaded", func, function() end)
        end,

        ---@param func function
        OnGameStart = function(func)
            RegisterHook("/Script/IntoTheRadius2.RadiusGameInstance:OnGameStart", func, function() end)
        end,

        ---@param func function
        ExitGame = function(func)
            RegisterHook("/Script/IntoTheRadius2.RadiusGameInstance:ExitGame", func, function() end)
        end
    },

    GameMode = {
        ---@param LevelTag FGameplayTag
        ---@param func function
        OnLoadLevel = function(LevelTag, func)
            RegisterHook("/Script/IntoTheRadius2.RadiusGameMode:OnLoadLevel", function(LevelTag)
                func()
            end, function() end)
        end,

        ---@param func function
        OnLevelLoaded = function(func)
            RegisterHook("/Script/IntoTheRadius2.RadiusGameMode:OnLevelLoaded", func, function() end)
        end
    },

    Levels = {
        Forest = {},

        Peninsula = {},

        Hub = {}
    },

    Items = {
        Backpacks = {
            -- Medium Firepower
            -- /Game/ITR2/BPs/Items/Equipment/Backpacks/BP_BackPack_Medium_2.BP_BackPack_Medium_2_C
            -- Medium Pouch
            -- /Game/ITR2/BPs/Items/Equipment/Backpacks/BP_BackPack_Medium_1.BP_BackPack_Medium_1_C
        }
        -- Notes:
        -- When modifying Items you should use NotifyOnNewObject after level has been loaded
    },

    Player = {
        ---@param Controller AController
        ---@param func function
        RespawnPlayer = function(Controller, func)
            RegisterHook("/Script/IntoTheRadius2.RadiusGameMode:Server_RespawnPlayer", function(Controller)
                func()
            end)
        end
    }
}

return ITR2
