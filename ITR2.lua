-- repo: https://github.com/Very-Blank/ITR2-Lua/
-- define shorthand paths for common paths
local paths = {
    Item = "/Game/ITR2/BPs/Items/",
    Firearms = "/Game/ITR2/BPs/Items/Firearms",
    Script = "/Script/IntoTheRadius2."
}
local ITR2 = {
    version = {
        game = "0.10.2",
        build = "26200"
    },

    Paths = paths,

    GameInstance = {
        ---@param func function
        OnLevelLoaded = function(func)
            RegisterHook(paths.Script .. "RadiusGameInstance:OnLevelLoaded", func, function() end)
        end,

        ---@param func function
        OnGameStart = function(func)
            RegisterHook(paths.Script .. "RadiusGameInstance:OnGameStart", func, function() end)
        end,

        ---@param func function
        ExitGame = function(func)
            RegisterHook(paths.Script .. "RadiusGameInstance:ExitGame", func, function() end)
        end
    },

    GameMode = {
        ---@param func function
        OnLevelLoaded = function(func)
            RegisterHook(paths.Script .. "RadiusGameMode:OnLevelLoaded", func, function() end)
        end
    },

    Enemy = {
        OnHumanoidDeath = function(func)
            ---@param DeathInstigator AController
            ---@param DiedPawn AActor
            RegisterHook(paths.Script .. "RadiusAICharacterBase:OnDeath", func)
        end,

        OnNonHumanoidDeath = function(func)
            ---@param DeathInstigator AController
            ---@param DiedPawn AActor
            RegisterHook(paths.Script .. "RadiusNonHumanAICharacter:OnDeath", func)
        end,
    },

    EventSubSystem = {
        ---@param func function
        OnSwitchLoadingScreen = function(func)
            ---@param bShow boolean
            RegisterHook(paths.Script .. "RadiusEventsSubsystem:FireSwitchLoadingScreen", func, function() end)
        end,

        OnTutorialStarted = function(func)
            ---@param TutorialTag FString
            RegisterHook(paths.Script .. "RadiusEventsSubsystem:FireOnTutorialStarted", func, function() end)
        end,

        OnTutorialFinished = function(func)
            ---@param TutorialID FString
            ---@param CompletedStepsNum int32
            ---@param Seconds int32
            ---@param IsTutorialSkipped boolean
            RegisterHook(paths.Script .. "RadiusEventsSubsystem:FireOnTutorialFinished", func, function() end)
        end,

        OnSplashScreenShown = function(func)
            RegisterHook(paths.Script .. "RadiusEventsSubsystem:FireOnSplashScreenShown", func, function() end)
        end,

        OnSleep = function(func)
            ---@param Location FVector
            RegisterHook(paths.Script .. "RadiusEventsSubsystem:FireOnSleep", func, function() end)
        end,

        OnSettingsChanged = function(func)
            RegisterHook(paths.Script .. "RadiusEventsSubsystem:FireOnSettingsChanged", func, function() end)
        end,

        OnReplicatorCreated = function(func)
            RegisterHook(paths.Script .. "RadiusEventsSubsystem:FireOnReplicatorCreated", func, function() end)
        end,

        OnPlayerRunning = function(func)
            RegisterHook(paths.Script .. "RadiusEventsSubsystem:FireOnPlayerRunning", func, function() end)
        end,

        OnPlayerKill = function(func)
            ---@param NPCTag FGameplayTag
            ---@param Weapon AActor
            ---@param Location FVector
            RegisterHook(paths.Script .. "RadiusEventsSubsystem:FireOnPlayerKill", func, function() end)
        end,

        OnPlayerInventoryChanged = function(func)
            ---@param PlayerUID FString
            RegisterHook(paths.Script .. "RadiusEventsSubsystem:FireOnPlayerInventoryChanged", func, function() end)
        end,

        OnPlayerDisconnected = function(func)
            ---@param UniqueNetId FUniqueNetIdRepl
            RegisterHook(paths.Script .. "RadiusEventsSubsystem:FireOnPlayerDisconnected", func, function() end)
        end,

        OnPlayerDeathPointsChanged = function(func)
            RegisterHook(paths.Script .. "RadiusEventsSubsystem:FireOnPlayerDeathPointsChanged", func, function() end)
        end,

        OnPlayerConnected = function(func)
            ---@param UniqueNetId FUniqueNetIdRepl
            RegisterHook(paths.Script .. "RadiusEventsSubsystem:FireOnPlayerConnected", func, function() end)
        end,

        OnMissionStarted = function(func)
            ---@param Mission UAvailableMission
            RegisterHook(paths.Script .. "RadiusEventsSubsystem:FireOnMissionStarted", func, function() end)
        end,

        OnMissionListUpdate = function(func)
            RegisterHook(paths.Script .. "RadiusEventsSubsystem:FireOnMissionListUpdate", func, function() end)
        end,

        OnMissionFinished = function(func)
            ---@param Mission UAvailableMission
            ---@param State EMissionCompleteState
            ---@param CurrentObjectiveIndex int32
            RegisterHook(paths.Script .. "RadiusEventsSubsystem:FireOnMissionFinished", func, function() end)
        end,

        OnMainMenuLoaded = function(func)
            RegisterHook(paths.Script .. "RadiusEventsSubsystem:FireOnMainMenuLoaded", func, function() end)
        end,

        OnLvlPointsChanged = function(func)
            ---@param NewLvlPoints int32
            RegisterHook(paths.Script .. "RadiusEventsSubsystem:FireOnLvlPointsChanged", func, function() end)
        end,

        OnLoadLevel = function(func)
            ---@param LevelTag FGameplayTag
            RegisterHook(paths.Script .. "RadiusEventsSubsystem:FireOnLoadLevel", func, function() end)
        end,

        OnLevelLoaded = function(func)
            RegisterHook(paths.Script .. "RadiusEventsSubsystem:FireOnLevelLoaded", func, function() end)
        end,

        OnIngameMenuOpened = function(func)
            RegisterHook(paths.Script .. "RadiusEventsSubsystem:FireOnIngameMenuOpened", func, function() end)
        end,

        OnIngameMenuClosed = function(func)
            RegisterHook(paths.Script .. "RadiusEventsSubsystem:FireOnIngameMenuClosed", func, function() end)
        end,

        OnHostGame = function(func)
            RegisterHook(paths.Script .. "RadiusEventsSubsystem:FireOnHostGame", func, function() end)
        end,

        OnGlobalTriggersChange = function(func)
            RegisterHook(paths.Script .. "RadiusEventsSubsystem:FireOnGlobalTriggersChange", func, function() end)
        end,

        OnGameStart = function(func)
            RegisterHook(paths.Script .. "RadiusEventsSubsystem:FireOnGameStart", func, function() end)
        end,

        OnGameDataSaved = function(func)
            RegisterHook(paths.Script .. "RadiusEventsSubsystem:FireOnGameDataSaved", func, function() end)
        end,

        OnGameDataLoaded = function(func)
            RegisterHook(paths.Script .. "RadiusEventsSubsystem:FireOnGameDataLoaded", func, function() end)
        end,

        OnFirstPlayerEnteredShop = function(func)
            RegisterHook(paths.Script .. "RadiusEventsSubsystem:FireOnFirstPlayerEnteredShop", func, function() end)
        end,

        OnCommonGameDataSaved = function(func)
            RegisterHook(paths.Script .. "RadiusEventsSubsystem:FireOnCommonGameDataSaved", func, function() end)
        end,

        OnCommonGameDataLoaded = function(func)
            RegisterHook(paths.Script .. "RadiusEventsSubsystem:FireOnCommonGameDataLoaded", func, function() end)
        end,

        OnArtefactNestSpawned = function(func)
            ---@param Nest AActor
            RegisterHook(paths.Script .. "RadiusEventsSubsystem:FireOnArtefactNestSpawned", func, function() end)
        end,

        OnArtefactNestDestroyed = function(func)
            ---@param Nest AActor
            RegisterHook(paths.Script .. "RadiusEventsSubsystem:FireOnArtefactNestDestroyed", func, function() end)
        end,

        OnAccessLevelChanged = function(func)
            ---@param NewLevel int32
            RegisterHook(paths.Script .. "RadiusEventsSubsystem:FireOnAccessLevelChanged", func, function() end)
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
        Loot = {
            AshSmall = paths.Item .."Valuables/Ashes/BP_Ash_small.BP_Ash_small_C",
            AshMedium = paths.Item .."Valuables/Ashes/BP_Ash_Medium.BP_Ash_Medium_C",
            AshBig = paths.Item .."Valuables/Ashes/BP_Ash_Big.BP_Ash_Big_C",
        },

        Artifacts = {
            A011 = paths.Item .. "Valuables/Arts/BP_ValuableArt_1.BP_ValuableArt_1_C",
            A023 = paths.Item .. "Valuables/Arts/BP_ValuableArt_2.BP_ValuableArt_2_C",
            A035 = paths.Item .. "Valuables/Arts/BP_ValuableArt_3.BP_ValuableArt_3_C",
            A047 = paths.Item .. "Valuables/Arts/BP_ValuableArt_4.BP_ValuableArt_4_C",
            A058 = paths.Item .. "Valuables/Arts/BP_ValuableArt_5.BP_ValuableArt_5_C",
        },

        ArtifactNests = {
            Sticky =  paths.Item .."Artefacts/Nests/BP_StickyNest.0",
            Mirror =  paths.Item .."Artefacts/Nests/BP_MirrorShardsNest.1",
            Fragile =  paths.Item .."Artefacts/Nests/BP_FragileNest.0",
        },

        Consumables = {
            CigPack = paths.Item .. "Consumable/BP_CigPack.BP_CigPack_C",
            CrackerPack = paths.Item .. "Consumable/BP_CrackerPack.BP_CrackerPack_C",
            Injector1 = paths.Item .. "Consumable/BP_Injector_QuickHeal.BP_Injector_QuickHeal_C",
            Injector2 = paths.Item .. "Consumable/BP_Injector_SlowHeal.BP_Injector_SlowHeal_C",
            Injector3 = paths.Item .. "Consumable/BP_Injector_FullHeal.BP_Injector_FullHeal_C",
        },

        Utilitys = {
            ProbePackSmall = paths.Item .. "Probes/BP_ProbeSack.BP_ProbeSack_C",
            Flashlight = paths.Item .. "Flashlights/BP_Flashlight_Handheld.BP_Flashlight_Handheld_C",
            Detector = paths.Item .. "Artefacts/BP_Detector.BP_Detector_C",
            Tablet = paths.Item .. "Equipment/Tablet/BP_Tablet.BP_Tablet_C",
            Lighter = paths.Item .. "Misc/BP_Lighter.BP_Lighter_C",
        },

        Backpacks = {
            Starter = paths.Item .. "Equipment/Backpacks/BP_BackPack_Start_Small.BP_BackPack_Start_Small_C",
            Small1 = paths.Item .. "Equipment/Backpacks/BP_BackPack_Small_1.BP_BackPack_Small_1_C",
            Small2 = paths.Item .. "Equipment/Backpacks/BP_BackPack_Small_2.BP_BackPack_Small_2_C",
            Medium1 = paths.Item .. "Equipment/Backpacks/BP_BackPack_Medium_1.BP_BackPack_Medium_1_C",
            Medium2 = paths.Item .. "Equipment/Backpacks/BP_BackPack_Medium_2.BP_BackPack_Medium_2_C",
        },

        Vests = {
            Starter = paths.Item .. "Equipment/Vests/BP_Vest_Start.BP_Vest_Start_C",
            VestHeavy1 = paths.Item .. "Equipment/Vests/BP_Vest_Heavy_1.BP_Vest_Heavy_1_C",
            Classic = paths.Item .. "Equipment/Vests/BP_Vest_Classic.BP_Vest_Classic_C",
            Pistol = paths.Item .. "Equipment/Vests/BP_Vest_Pistols.BP_Vest_Pistols_C",
            FrontGunOnly = paths.Item .. "Equipment/Vests/BP_Vest_FrontGun_Only.BP_Vest_FrontGun_Only_C",
            ClassicExpanded = paths.Item .. "Equipment/Vests/BP_Vest_ClassicExpanded.BP_Vest_ClassicExpanded_C",
            FrontGun = paths.Item .. "Equipment/Vests/BP_Vest_FrontGun_n_Pistol.BP_Vest_FrontGun_n_Pistol_C",
            ClassicL = paths.Item .. "Equipment/Vests/BP_Vest_Classic_L.BP_Vest_Classic_L_C",
            ClassicExpandedL = paths.Item .. "Equipment/Vests/BP_Vest_ClassicExpanded_L.BP_Vest_ClassicExpanded_L_C",
        },

        PrimaryFirearms = {
            Saiga = paths.Firearms .. "Primary/Saiga/BP_Saiga.BP_Saiga_C",
            Izh27 = paths.Firearms .. "Primary/IZh-27/BP_Iz27.BP_Iz27_C",
            Izh27Mod = paths.Firearms .. "Primary/IZh-27/BP_Iz27_M.BP_Iz27_M_C",
            Bizon = paths.Firearms .. "Primary/Bizon/BP_Bizon.BP_Bizon_C",
            AK74U = paths.Firearms .. "Primary/AK74/BP_AKSu74N.BP_AKSu74N_C",
            AK74N = paths.Firearms .. "Primary/AK74/BP_AK74N.BP_AK74N_C",
            AK74M = paths.Firearms .. "Primary/AK74/BP_AK74M.BP_AK74M_C",
            SKS = paths.Firearms .. "Primary/SKS/BP_SKS.BP_SKS_C",
            SKSMod = paths.Firearms .. "Primary/SKS/BP_SKS_M.BP_SKS_M_C",
            Groza = paths.Firearms .. "Primary/Groza/BP_Groza.BP_Groza_C",
            VSS = paths.Firearms .. "Primary/Val_and_VSS/BP_VSS.BP_VSS_C",
            ASVal = paths.Firearms .. "Primary/Val_and_VSS/BP_AS_VAL.BP_AS_VAL_C",
        },

        SecondaryFirearms = {
            Pm = paths.Firearms .. "Secondary/PM/BP_PM.BP_PM_C",
            Gsh18 = paths.Firearms .. "Secondary/Gsh18/BP_Gsh18.BP_Gsh18_C",
            --Put it here since the game uses it more like a secondary
            SawnOffShotgun = paths.Firearms .. "Primary/IZh-27/BP_Iz27_SawOff.BP_Iz27_SawOff_C",
            Glock18C = paths.Firearms .. "Secondary/Glock_18/BP_Glock_18.BP_Glock_18_C",
            Beretta = paths.Firearms .. "Secondary/Beretta/BP_Beretta.BP_Beretta_C",
            TestWeapon = paths.Firearms .. "Secondary/PM/BP_PM_Replica.BP_PM_Replica_C",
        },

        PrimaryMagazines = {
            SaigaShort = paths.Firearms .. "Primary/Saiga/BP_Saiga_Mag_Short2.BP_Saiga_Mag_Short2_C",
            SaigaLong = paths.Firearms .. "Primary/Saiga/BP_Saiga_Mag_Long.BP_Saiga_Mag_Long_C",
            AK74Red = paths.Firearms .. "Primary/AK74/BP_AK_74_Mag_Red.BP_AK_74_Mag_Red_C",
            AK74Black = paths.Firearms .. "Primary/AK74/BP_AK_74_Mag_Black.BP_AK_74_Mag_Black_C",
            SKSShort = paths.Firearms .. "Primary/SKS/BP_SKS_Mag_sBP_SKS_Mag_Short_C",
            Groza = paths.Firearms .. "Primary/Groza/BP_Groza_Mag.BP_Groza_Mag_C",
            ASValShort = paths.Firearms .. "Primary/Val_and_VSS/BP_VSS_Mag_sBP_VSS_Mag_Short_C",
            ASValMedium = paths.Firearms .. "Primary/Val_and_VSS/BP_AS_Val_Mag_Med.BP_AS_Val_Mag_Med_C",
            Bizon = paths.Firearms .. "Primary/Bizon/BP_Bizon_Mag.BP_Bizon_Mag_C",
        },

        SecondaryMagazines = {
            PmShort = paths.Firearms .. "Secondary/PM/BP_Mag_PM.BP_Mag_PM_C",
            PmLong = paths.Firearms .. "Secondary/PM/BP_Mag_PM_Long.BP_Mag_PM_Long_C",
            Gsh18 = paths.Firearms .. "Secondary/Gsh18/BP_Mag_Gsh18.BP_Mag_Gsh18_C",
            Beretta = paths.Firearms .. "Secondary/Beretta/BP_Mag_Beretta.BP_Mag_Beretta_C",
            Glock18C = paths.Firearms .. "Secondary/Glock_18/BP_Mag_Glock_18.BP_Mag_Glock_18_C",
        },

        Attachments = {
            POSD = paths.Firearms .. "Attachments/Scopes/BP_Scope_PSO.BP_Scope_PSO_C",
            CobraD = paths.Firearms .. "Attachments/Scopes/BP_RDS_Cobra.BP_RDS_Cobra_C",
            --45 degree rail left
            DegRailL45 = paths.Firearms .. "Attachments/Rails/BP_Rail_45deg.BP_Rail_45deg_C",
            --45 degree rail right
            DegRailR45 = paths.Firearms .. "Attachments/Rails/BP_Rail_45deg.BP_Rail_45deg_C",
            PG6R = paths.Firearms .. "Attachments/Scopes/BP_RDS_PK6.BP_RDS_PK6_C",
            ScopeHG = paths.Firearms .. "Attachments/Scopes/BP_Scope_HG.BP_Scope_HG_C",
            Flashlight = paths.Firearms .. "Attachments/Illumination/BP_Att_Flashlight_small.BP_Att_Flashlight_small_C",
            Laser = paths.Firearms .. "Attachments/Illumination/BP_Att_Pointer_small.BP_Att_Pointer_small_C",
            BaseAK74Muzzle = paths.Firearms .. "Attachments/Muzzles/AK/BP_MuzzleAK_Base.BP_MuzzleAK_Base_C",
            DTK2AK = paths.Firearms .. "Attachments/Muzzles/AK/BP_MuzzleAK_DTK2.BP_MuzzleAK_DTK2_C",
            DTK1AK = paths.Firearms .. "Attachments/Muzzles/AK/BP_MuzzleAK_DTK1.BP_MuzzleAK_DTK1_C",
            AKM11Muzzle = paths.Firearms .. "Attachments/Muzzles/AK/BP_MuzzleAK_M11.BP_MuzzleAK_M11_C",
            AKSilencer = paths.Firearms .. "Attachments/Silencers/BP_Silencer_5_45.BP_Silencer_5_45_C",
            PistolSilencer = paths.Firearms .. "Attachments/Silencers/BP_Silencer_Pistol.BP_Silencer_Pistol_C",
        }
    },

    Player = {
        --Register hook calls this with Controller
        ---@param func function
        OnRespawn = function(func)
            ---@param Controller AController
            RegisterHook(paths.Script .. "RadiusGameMode:Server_RespawnPlayer", func)
        end
    }
}

return ITR2
