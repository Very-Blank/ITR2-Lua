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
        --Register hook calls this with LevelTag
        ---@param func function
        OnLoadLevel = function(func)
            ---@param LevelTag FGameplayTag
            RegisterHook("/Script/IntoTheRadius2.RadiusGameMode:OnLoadLevel", func, function() end)
        end,

        ---@param func function
        OnLevelLoaded = function(func)
            RegisterHook("/Script/IntoTheRadius2.RadiusGameMode:OnLevelLoaded", func, function() end)
        end
    },

    EventSystem = {

    },

    Levels = {
        Forest = {},

        Peninsula = {},

        Hub = {}
    },

    Items = {
        -- Notes:
        -- When modifying Items you should use NotifyOnNewObject after the level has been loaded
        Backpacks = {
            Medium2 = "/Game/ITR2/BPs/Items/Equipment/Backpacks/BP_BackPack_Medium_2.BP_BackPack_Medium_2_C",
            Medium1 = "/Game/ITR2/BPs/Items/Equipment/Backpacks/BP_BackPack_Medium_1.BP_BackPack_Medium_1_C",
        },

        Guns = {
            Saiga = "/Game/ITR2/BPs/Items/Firearms/Primary/Saiga/BP_Saiga.BP_Saiga_C",
        },

        Magazines = {
            SaigaShort = "/Game/ITR2/BPs/Items/Firearms/Primary/Saiga/BP_Saiga_Mag_Short2.BP_Saiga_Mag_Short2_C",
            SaigaLong = "/Game/ITR2/BPs/Items/Firearms/Primary/Saiga/BP_Saiga_Mag_Long.BP_Saiga_Mag_Long_C",
        },
    },

    Player = {
        --Register hook calls this with Controller
        ---@param func function
        RespawnPlayer = function(func)
            ---@param Controller AController
            RegisterHook("/Script/IntoTheRadius2.RadiusGameMode:Server_RespawnPlayer", func)
        end
    }
}

return ITR2