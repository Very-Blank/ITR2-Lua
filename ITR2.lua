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

        PrimaryFirearms = {
            Saiga = "/Game/ITR2/BPs/Items/Firearms/Primary/Saiga/BP_Saiga.BP_Saiga_C",
            Izh27 = "/Game/ITR2/BPs/Items/Firearms/Primary/IZh-27/BP_Iz27.BP_Iz27_C",
            Izh27Mod = "/Game/ITR2/BPs/Items/Firearms/Primary/IZh-27/BP_Iz27_M.BP_Iz27_M_C",
            Bizon = "/Game/ITR2/BPs/Items/Firearms/Primary/Bizon/BP_Bizon.BP_Bizon_C",
            AK74U = "/Game/ITR2/BPs/Items/Firearms/Primary/AK74/BP_AKSu74N.BP_AKSu74N_C",
            AK74N = "/Game/ITR2/BPs/Items/Firearms/Primary/AK74/BP_AK74N.BP_AK74N_C",
            AK74M = "/Game/ITR2/BPs/Items/Firearms/Primary/AK74/BP_AK74M.BP_AK74M_C",
            SKS = "/Game/ITR2/BPs/Items/Firearms/Primary/SKS/BP_SKS.BP_SKS_C",
            SKSMod = "/Game/ITR2/BPs/Items/Firearms/Primary/SKS/BP_SKS_M.BP_SKS_M_C",
            Groza = "/Game/ITR2/BPs/Items/Firearms/Primary/Groza/BP_Groza.BP_Groza_C",
            VSS = "/Game/ITR2/BPs/Items/Firearms/Primary/Val_and_VSS/BP_VSS.BP_VSS_C",
            ASVal = "/Game/ITR2/BPs/Items/Firearms/Primary/Val_and_VSS/BP_AS_VAL.BP_AS_VAL_C",
        },

        SecondaryFirearms = {
            Pm = "/Game/ITR2/BPs/Items/Firearms/Secondary/PM/BP_PM.BP_PM_C",
            Gsh18 = "/Game/ITR2/BPs/Items/Firearms/Secondary/Gsh18/BP_Gsh18.BP_Gsh18_C",
            --Put it here since the game uses it more like an secondary
            SawnOffShotgun = "/Game/ITR2/BPs/Items/Firearms/Primary/IZh-27/BP_Iz27_SawOff.BP_Iz27_SawOff_C",
            Glock18C = "/Game/ITR2/BPs/Items/Firearms/Secondary/Glock_18/BP_Glock_18.BP_Glock_18_C",
            Beretta = "/Game/ITR2/BPs/Items/Firearms/Secondary/Beretta/BP_Beretta.BP_Beretta_C",
            TestWeapon = "/Game/ITR2/BPs/Items/Firearms/Secondary/PM/BP_PM_Replica.BP_PM_Replica_C",
        },

        Magazines = {
            SaigaShort = "/Game/ITR2/BPs/Items/Firearms/Primary/Saiga/BP_Saiga_Mag_Short2.BP_Saiga_Mag_Short2_C",
            SaigaLong = "/Game/ITR2/BPs/Items/Firearms/Primary/Saiga/BP_Saiga_Mag_Long.BP_Saiga_Mag_Long_C",
        },
        
        Attachments = {

        }
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