-- define shorthand paths for common paths
local sItem = "/Game/ITR2/BPs/Items/"
local sFirearms = "/Game/ITR2/BPs/Items/Firearms"
local sScript = "/Script/IntoTheRadius2."

local ITR2 = {
    version = {
        game = "0.10.2",
        build = ""
    },
    
    GameInstance = {
        ---@param func function
        OnLevelLoaded = function(func)
            RegisterHook(sScript + "RadiusGameInstance:OnLevelLoaded", func, function() end)
        end,

        ---@param func function
        OnGameStart = function(func)
            RegisterHook(sScript + "RadiusGameInstance:OnGameStart", func, function() end)
        end,

        ---@param func function
        ExitGame = function(func)
            RegisterHook(sScript + "RadiusGameInstance:ExitGame", func, function() end)
        end
    },

    GameMode = {
        --Register hook calls this with LevelTag
        ---@param func function
        OnLoadLevel = function(func)
            ---@param LevelTag FGameplayTag
            RegisterHook(sScript + "RadiusGameMode:OnLoadLevel", func, function() end)
        end,

        ---@param func function
        OnLevelLoaded = function(func)
            RegisterHook(sScript + "RadiusGameMode:OnLevelLoaded", func, function() end)
        end
    },

    EventSubSystem = {
        ---@param func function
        OnSwitchLoadingScreen = function(func)
            ---@param bShow boolean
            RegisterHook(sScript + "RadiusEventsSubsystem:FireSwitchLoadingScreen", func, function() end)
        end,

        OnTutorialStarted = function(func)
            ---@param TutorialTag FString
            RegisterHook(sScript + "RadiusEventsSubsystem:FireOnTutorialStarted", func, function() end)
        end,

        OnTutorialFinished = function(func)
            ---@param TutorialID FString
            ---@param CompletedStepsNum int32
            ---@param Seconds int32
            ---@param IsTutorialSkipped boolean
            RegisterHook(sScript + "RadiusEventsSubsystem:FireOnTutorialFinished", func, function() end)
        end,

        OnSplashScreenShown = function(func)
            RegisterHook(sScript + "RadiusEventsSubsystem:FireOnSplashScreenShown", func, function() end)
        end,

        OnSleep = function(func)
            ---@param Location FVector
            RegisterHook(sScript + "RadiusEventsSubsystem:FireOnSleep", func, function() end)
        end,

        OnSettingsChanged = function(func)
            RegisterHook(sScript + "RadiusEventsSubsystem:FireOnSettingsChanged", func, function() end)
        end,

        OnReplicatorCreated = function(func)
            RegisterHook(sScript + "RadiusEventsSubsystem:FireOnReplicatorCreated", func, function() end)
        end,

        OnPlayerRunning = function(func)
            RegisterHook(sScript + "RadiusEventsSubsystem:FireOnPlayerRunning", func, function() end)
        end,

        OnPlayerKill = function(func)
            ---@param NPCTag FGameplayTag
            ---@param Weapon AActor
            ---@param Location FVector
            RegisterHook(sScript + "RadiusEventsSubsystem:FireOnPlayerKill", func, function() end)
        end,

        OnPlayerInventoryChanged = function(func)
            ---@param PlayerUID FString
            RegisterHook(sScript + "RadiusEventsSubsystem:FireOnPlayerInventoryChanged", func, function() end)
        end,

        OnPlayerDisconnected = function(func)
            ---@param UniqueNetId FUniqueNetIdRepl
            RegisterHook(sScript + "RadiusEventsSubsystem:FireOnPlayerDisconnected", func, function() end)
        end,

        OnPlayerDeathPointsChanged = function(func)
            RegisterHook(sScript + "RadiusEventsSubsystem:FireOnPlayerDeathPointsChanged", func, function() end)
        end,

        OnPlayerConnected = function(func)
            ---@param UniqueNetId FUniqueNetIdRepl
            RegisterHook(sScript + "RadiusEventsSubsystem:FireOnPlayerConnected", func, function() end)
        end,

        OnMissionStarted = function(func)
            ---@param Mission UAvailableMission
            RegisterHook(sScript + "RadiusEventsSubsystem:FireOnMissionStarted", func, function() end)
        end,

        OnMissionListUpdate = function(func)
            RegisterHook(sScript + "RadiusEventsSubsystem:FireOnMissionListUpdate", func, function() end)
        end,

        OnMissionFinished = function(func)
            ---@param Mission UAvailableMission
            ---@param State EMissionCompleteState
            ---@param CurrentObjectiveIndex int32
            RegisterHook(sScript + "RadiusEventsSubsystem:FireOnMissionFinished", func, function() end)
        end,

        OnMainMenuLoaded = function(func)
            RegisterHook(sScript + "RadiusEventsSubsystem:FireOnMainMenuLoaded", func, function() end)
        end,

        OnLvlPointsChanged = function(func)
            ---@param NewLvlPoints int32
            RegisterHook(sScript + "RadiusEventsSubsystem:FireOnLvlPointsChanged", func, function() end)
        end,

        OnLoadLevel = function(func)
            ---@param LevelTag FGameplayTag
            RegisterHook(sScript + "RadiusEventsSubsystem:FireOnLoadLevel", func, function() end)
        end,

        OnLevelLoaded = function(func)
            RegisterHook(sScript + "RadiusEventsSubsystem:FireOnLevelLoaded", func, function() end)
        end,

        OnIngameMenuOpened = function(func)
            RegisterHook(sScript + "RadiusEventsSubsystem:FireOnIngameMenuOpened", func, function() end)
        end,

        OnIngameMenuClosed = function(func)
            RegisterHook(sScript + "RadiusEventsSubsystem:FireOnIngameMenuClosed", func, function() end)
        end,

        OnHostGame = function(func)
            RegisterHook(sScript + "RadiusEventsSubsystem:FireOnHostGame", func, function() end)
        end,

        OnGlobalTriggersChange = function(func)
            RegisterHook(sScript + "RadiusEventsSubsystem:FireOnGlobalTriggersChange", func, function() end)
        end,

        OnGameStart = function(func)
            RegisterHook(sScript + "RadiusEventsSubsystem:FireOnGameStart", func, function() end)
        end,

        OnGameDataSaved = function(func)
            RegisterHook(sScript + "RadiusEventsSubsystem:FireOnGameDataSaved", func, function() end)
        end,

        OnGameDataLoaded = function(func)
            RegisterHook(sScript + "RadiusEventsSubsystem:FireOnGameDataLoaded", func, function() end)
        end,

        OnFirstPlayerEnteredShop = function(func)
            RegisterHook(sScript + "RadiusEventsSubsystem:FireOnFirstPlayerEnteredShop", func, function() end)
        end,

        OnCommonGameDataSaved = function(func)
            RegisterHook(sScript + "RadiusEventsSubsystem:FireOnCommonGameDataSaved", func, function() end)
        end,

        OnCommonGameDataLoaded = function(func)
            RegisterHook(sScript + "RadiusEventsSubsystem:FireOnCommonGameDataLoaded", func, function() end)
        end,

        OnArtefactNestSpawned = function(func)
            ---@param Nest AActor
            RegisterHook(sScript + "RadiusEventsSubsystem:FireOnArtefactNestSpawned", func, function() end)
        end,

        OnArtefactNestDestroyed = function(func)
            ---@param Nest AActor
            RegisterHook(sScript + "RadiusEventsSubsystem:FireOnArtefactNestDestroyed", func, function() end)
        end,

        OnAccessLevelChanged = function(func)
            ---@param NewLevel int32
            RegisterHook(sScript + "RadiusEventsSubsystem:FireOnAccessLevelChanged", func, function() end)
        end,
    },

    Levels = {
        Forest = {},

        Peninsula = {},

        Hub = {}
    },

    Items = {
        -- Notes:
        -- When modifying Items you should use NotifyOnNewObject after the level has been loaded
        Consumables = {
            CigPack = sItem + "Consumable/BP_CigPack.BP_CigPack_C",
            CrackerPack = sItem + "Consumable/BP_CrackerPack.BP_CrackerPack_C",
            Injector1 = sItem + "Consumable/BP_Injector_QuickHeal.BP_Injector_QuickHeal_C",
            Injector2 = sItem + "Consumable/BP_Injector_SlowHeal.BP_Injector_SlowHeal_C",
            Injector3 = sItem + "Consumable/BP_Injector_FullHeal.BP_Injector_FullHeal_C",
        },

        Utilitys = {
            ProbePackSmall = sItem + "Probes/BP_ProbeSack.BP_ProbeSack_C",
            Flashlight = sItem + "Flashlights/BP_Flashlight_Handheld.BP_Flashlight_Handheld_C",
            Detector = sItem + "Artefacts/BP_Detector.BP_Detector_C",
            Tablet = sItem + "Equipment/Tablet/BP_Tablet.BP_Tablet_C",
            Lighter = sItem + "Misc/BP_Lighter.BP_Lighter_C",
        },

        Backpacks = {
            Starter = sItem + "Equipment/Backpacks/BP_BackPack_Start_Small.BP_BackPack_Start_Small_C",
            Small1 = sItem + "Equipment/Backpacks/BP_BackPack_Small_1.BP_BackPack_Small_1_C",
            Small2 = sItem + "Equipment/Backpacks/BP_BackPack_Small_2.BP_BackPack_Small_2_C",
            Medium1 = sItem + "Equipment/Backpacks/BP_BackPack_Medium_1.BP_BackPack_Medium_1_C",
            Medium2 = sItem + "Equipment/Backpacks/BP_BackPack_Medium_2.BP_BackPack_Medium_2_C",
        },

        Vests = {
            Starter = sItem + "Equipment/Vests/BP_Vest_Start.BP_Vest_Start_C",
            VestHeavy1 = sItem + "Equipment/Vests/BP_Vest_Heavy_1.BP_Vest_Heavy_1_C",
            Classic = sItem + "Equipment/Vests/BP_Vest_Classic.BP_Vest_Classic_C",
            Pistol = sItem + "Equipment/Vests/BP_Vest_Pistols.BP_Vest_Pistols_C",
            FrontGunOnly = sItem + "Equipment/Vests/BP_Vest_FrontGun_Only.BP_Vest_FrontGun_Only_C",
            ClassicExpanded = sItem + "Equipment/Vests/BP_Vest_ClassicExpanded.BP_Vest_ClassicExpanded_C",
            FrontGun = sItem + "Equipment/Vests/BP_Vest_FrontGun_n_Pistol.BP_Vest_FrontGun_n_Pistol_C",
            ClassicL = sItem + "Equipment/Vests/BP_Vest_Classic_L.BP_Vest_Classic_L_C",
            ClassicExpandedL = sItem + "Equipment/Vests/BP_Vest_ClassicExpanded_L.BP_Vest_ClassicExpanded_L_C",
        },

        PrimaryFirearms = {
            Saiga = sFirearms + "Primary/Saiga/BP_Saiga.BP_Saiga_C",
            Izh27 = sFirearms + "Primary/IZh-27/BP_Iz27.BP_Iz27_C",
            Izh27Mod = sFirearms + "Primary/IZh-27/BP_Iz27_M.BP_Iz27_M_C",
            Bizon = sFirearms + "Primary/Bizon/BP_Bizon.BP_Bizon_C",
            AK74U = sFirearms + "Primary/AK74/BP_AKSu74N.BP_AKSu74N_C",
            AK74N = sFirearms + "Primary/AK74/BP_AK74N.BP_AK74N_C",
            AK74M = sFirearms + "Primary/AK74/BP_AK74M.BP_AK74M_C",
            SKS = sFirearms + "Primary/SKS/BP_SKS.BP_SKS_C",
            SKSMod = sFirearms + "Primary/SKS/BP_SKS_M.BP_SKS_M_C",
            Groza = sFirearms + "Primary/Groza/BP_Groza.BP_Groza_C",
            VSS = sFirearms + "Primary/Val_and_VSS/BP_VSS.BP_VSS_C",
            ASVal = sFirearms + "Primary/Val_and_VSS/BP_AS_VAL.BP_AS_VAL_C",
        },

        SecondaryFirearms = {
            Pm = sFirearms + "Secondary/PM/BP_PM.BP_PM_C",
            Gsh18 = sFirearms + "Secondary/Gsh18/BP_Gsh18.BP_Gsh18_C",
            --Put it here since the game uses it more like a secondary
            SawnOffShotgun = sFirearms + "Primary/IZh-27/BP_Iz27_SawOff.BP_Iz27_SawOff_C",
            Glock18C = sFirearms + "Secondary/Glock_18/BP_Glock_18.BP_Glock_18_C",
            Beretta = sFirearms + "Secondary/Beretta/BP_Beretta.BP_Beretta_C",
            TestWeapon = sFirearms + "Secondary/PM/BP_PM_Replica.BP_PM_Replica_C",
        },

        PrimaryMagazines = {
            SaigaShort = sFirearms + "Primary/Saiga/BP_Saiga_Mag_Short2.BP_Saiga_Mag_Short2_C",
            SaigaLong = sFirearms + "Primary/Saiga/BP_Saiga_Mag_Long.BP_Saiga_Mag_Long_C",
            AK74Red = sFirearms + "Primary/AK74/BP_AK_74_Mag_Red.BP_AK_74_Mag_Red_C",
            AK74Black = sFirearms + "Primary/AK74/BP_AK_74_Mag_Black.BP_AK_74_Mag_Black_C",
            SKSShort = sFirearms + "Primary/SKS/BP_SKS_Mag_sBP_SKS_Mag_Short_C",
            Groza = sFirearms + "Primary/Groza/BP_Groza_Mag.BP_Groza_Mag_C",
            ASValShort = sFirearms + "Primary/Val_and_VSS/BP_VSS_Mag_sBP_VSS_Mag_Short_C",
            ASValMedium = sFirearms + "Primary/Val_and_VSS/BP_AS_Val_Mag_Med.BP_AS_Val_Mag_Med_C",
            Bizon = sFirearms + "Primary/Bizon/BP_Bizon_Mag.BP_Bizon_Mag_C",
        },

        SecondaryMagazines = {
            PmShort = sFirearms + "Secondary/PM/BP_Mag_PM.BP_Mag_PM_C",
            PmLong = sFirearms + "Secondary/PM/BP_Mag_PM_Long.BP_Mag_PM_Long_C",
            Gsh18 = sFirearms + "Secondary/Gsh18/BP_Mag_Gsh18.BP_Mag_Gsh18_C",
            Beretta = sFirearms + "Secondary/Beretta/BP_Mag_Beretta.BP_Mag_Beretta_C",
            Glock18C = sFirearms + "Secondary/Glock_18/BP_Mag_Glock_18.BP_Mag_Glock_18_C",
        },

        Attachments = {
            POSD = sFirearms + "Attachments/Scopes/BP_Scope_PSO.BP_Scope_PSO_C",
            CobraD = sFirearms + "Attachments/Scopes/BP_RDS_Cobra.BP_RDS_Cobra_C",
            --45 degree rail left
            DegRailL45 = sFirearms + "Attachments/Rails/BP_Rail_45deg.BP_Rail_45deg_C",
            --45 degree rail right
            DegRailR45 = sFirearms + "Attachments/Rails/BP_Rail_45deg.BP_Rail_45deg_C",
            PG6R = sFirearms + "Attachments/Scopes/BP_RDS_PK6.BP_RDS_PK6_C",
            ScopeHG = sFirearms + "Attachments/Scopes/BP_Scope_HG.BP_Scope_HG_C",
            Flashlight = sFirearms + "Attachments/Illumination/BP_Att_Flashlight_small.BP_Att_Flashlight_small_C",
            Laser = sFirearms + "Attachments/Illumination/BP_Att_Pointer_small.BP_Att_Pointer_small_C",
            BaseAK74Muzzle = sFirearms + "Attachments/Muzzles/AK/BP_MuzzleAK_Base.BP_MuzzleAK_Base_C",
            DTK2AK = sFirearms + "Attachments/Muzzles/AK/BP_MuzzleAK_DTK2.BP_MuzzleAK_DTK2_C",
            DTK1AK = sFirearms + "Attachments/Muzzles/AK/BP_MuzzleAK_DTK1.BP_MuzzleAK_DTK1_C",
            AKM11Muzzle = sFirearms + "Attachments/Muzzles/AK/BP_MuzzleAK_M11.BP_MuzzleAK_M11_C",
            AKSilencer = sFirearms + "Attachments/Silencers/BP_Silencer_5_45.BP_Silencer_5_45_C",
            PistolSilencer = sFirearms + "Attachments/Silencers/BP_Silencer_Pistol.BP_Silencer_Pistol_C",
        }
    },

    Player = {
        --Register hook calls this with Controller
        ---@param func function
        OnRespawn = function(func)
            ---@param Controller AController
            RegisterHook(sScript + "RadiusGameMode:Server_RespawnPlayer", func)
        end
    }
}

return ITR2
