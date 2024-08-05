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
        Consumables = {
            CigPack = "/Game/ITR2/BPs/Items/Consumable/BP_CigPack.BP_CigPack_C",
            CrackerPack = "/Game/ITR2/BPs/Items/Consumable/BP_CrackerPack.BP_CrackerPack_C",
            Injector1 = "/Game/ITR2/BPs/Items/Consumable/BP_Injector_QuickHeal.BP_Injector_QuickHeal_C",
            Injector2 = "/Game/ITR2/BPs/Items/Consumable/BP_Injector_SlowHeal.BP_Injector_SlowHeal_C",
            Injector3 = "/Game/ITR2/BPs/Items/Consumable/BP_Injector_FullHeal.BP_Injector_FullHeal_C",
          },
        
        Utilitys = {
            ProbePackSmall = "/Game/ITR2/BPs/Items/Probes/BP_ProbeSack.BP_ProbeSack_C",
            Flashlight = "/Game/ITR2/BPs/Items/Flashlights/BP_Flashlight_Handheld.BP_Flashlight_Handheld_C",
            Detector = "/Game/ITR2/BPs/Items/Artefacts/BP_Detector.BP_Detector_C",
            Tablet = "/Game/ITR2/BPs/Items/Equipment/Tablet/BP_Tablet.BP_Tablet_C",
            Lighter = "/Game/ITR2/BPs/Items/Misc/BP_Lighter.BP_Lighter_C",
        },

        Backpacks = {
            Starter = "/Game/ITR2/BPs/Items/Equipment/Backpacks/BP_BackPack_Start_Small.BP_BackPack_Start_Small_C",
            Small1 = "/Game/ITR2/BPs/Items/Equipment/Backpacks/BP_BackPack_Small_1.BP_BackPack_Small_1_C",
            Small2 = "/Game/ITR2/BPs/Items/Equipment/Backpacks/BP_BackPack_Small_2.BP_BackPack_Small_2_C",
            Medium1 = "/Game/ITR2/BPs/Items/Equipment/Backpacks/BP_BackPack_Medium_1.BP_BackPack_Medium_1_C",
            Medium2 = "/Game/ITR2/BPs/Items/Equipment/Backpacks/BP_BackPack_Medium_2.BP_BackPack_Medium_2_C",
        },

        Vests = {
            Starter = "/Game/ITR2/BPs/Items/Equipment/Vests/BP_Vest_Start.BP_Vest_Start_C",
            VestHeavy1 = "/Game/ITR2/BPs/Items/Equipment/Vests/BP_Vest_Heavy_1.BP_Vest_Heavy_1_C",
            Classic = "/Game/ITR2/BPs/Items/Equipment/Vests/BP_Vest_Classic.BP_Vest_Classic_C",
            Pistol = "/Game/ITR2/BPs/Items/Equipment/Vests/BP_Vest_Pistols.BP_Vest_Pistols_C",
            FrontGunOnly = "/Game/ITR2/BPs/Items/Equipment/Vests/BP_Vest_FrontGun_Only.BP_Vest_FrontGun_Only_C",
            ClassicExpanded = "/Game/ITR2/BPs/Items/Equipment/Vests/BP_Vest_ClassicExpanded.BP_Vest_ClassicExpanded_C",
            FrontGun = "/Game/ITR2/BPs/Items/Equipment/Vests/BP_Vest_FrontGun_n_Pistol.BP_Vest_FrontGun_n_Pistol_C",
            ClassicL = "/Game/ITR2/BPs/Items/Equipment/Vests/BP_Vest_Classic_L.BP_Vest_Classic_L_C",
            ClassicExpandedL = "/Game/ITR2/BPs/Items/Equipment/Vests/BP_Vest_ClassicExpanded_L.BP_Vest_ClassicExpanded_L_C",
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
            --Put it here since the game uses it more like a secondary
            SawnOffShotgun = "/Game/ITR2/BPs/Items/Firearms/Primary/IZh-27/BP_Iz27_SawOff.BP_Iz27_SawOff_C",
            Glock18C = "/Game/ITR2/BPs/Items/Firearms/Secondary/Glock_18/BP_Glock_18.BP_Glock_18_C",
            Beretta = "/Game/ITR2/BPs/Items/Firearms/Secondary/Beretta/BP_Beretta.BP_Beretta_C",
            TestWeapon = "/Game/ITR2/BPs/Items/Firearms/Secondary/PM/BP_PM_Replica.BP_PM_Replica_C",
        },

        PrimaryMagazines = {
            SaigaShort = "/Game/ITR2/BPs/Items/Firearms/Primary/Saiga/BP_Saiga_Mag_Short2.BP_Saiga_Mag_Short2_C",
            SaigaLong = "/Game/ITR2/BPs/Items/Firearms/Primary/Saiga/BP_Saiga_Mag_Long.BP_Saiga_Mag_Long_C",
            AK74Red = "/Game/ITR2/BPs/Items/Firearms/Primary/AK74/BP_AK_74_Mag_Red.BP_AK_74_Mag_Red_C", 
            AK74Black = "/Game/ITR2/BPs/Items/Firearms/Primary/AK74/BP_AK_74_Mag_Black.BP_AK_74_Mag_Black_C",
            SKSShort = "/Game/ITR2/BPs/Items/Firearms/Primary/SKS/BP_SKS_Mag_Short.BP_SKS_Mag_Short_C",
            Groza = "/Game/ITR2/BPs/Items/Firearms/Primary/Groza/BP_Groza_Mag.BP_Groza_Mag_C",
            ASValShort = "/Game/ITR2/BPs/Items/Firearms/Primary/Val_and_VSS/BP_VSS_Mag_Short.BP_VSS_Mag_Short_C",
            ASValMedium = "/Game/ITR2/BPs/Items/Firearms/Primary/Val_and_VSS/BP_AS_Val_Mag_Med.BP_AS_Val_Mag_Med_C",
            Bizon = "/Game/ITR2/BPs/Items/Firearms/Primary/Bizon/BP_Bizon_Mag.BP_Bizon_Mag_C",
        },

        SecondaryMagazines = {
            PmShort = "/Game/ITR2/BPs/Items/Firearms/Secondary/PM/BP_Mag_PM.BP_Mag_PM_C",
            PmLong = "/Game/ITR2/BPs/Items/Firearms/Secondary/PM/BP_Mag_PM_Long.BP_Mag_PM_Long_C",
            Gsh18 = "/Game/ITR2/BPs/Items/Firearms/Secondary/Gsh18/BP_Mag_Gsh18.BP_Mag_Gsh18_C",
            Beretta = "/Game/ITR2/BPs/Items/Firearms/Secondary/Beretta/BP_Mag_Beretta.BP_Mag_Beretta_C",
            Glock18C = "/Game/ITR2/BPs/Items/Firearms/Secondary/Glock_18/BP_Mag_Glock_18.BP_Mag_Glock_18_C",
        },
        
        Attachments = {
            POSD = "/Game/ITR2/BPs/Items/Firearms/Attachments/Scopes/BP_Scope_PSO.BP_Scope_PSO_C",
            CobraD = "/Game/ITR2/BPs/Items/Firearms/Attachments/Scopes/BP_RDS_Cobra.BP_RDS_Cobra_C",
            --45 degree rail left
            DegRailL45 = "/Game/ITR2/BPs/Items/Firearms/Attachments/Rails/BP_Rail_45deg.BP_Rail_45deg_C",
            --45 degree rail right
            DegRailR45 = "/Game/ITR2/BPs/Items/Firearms/Attachments/Rails/BP_Rail_45deg.BP_Rail_45deg_C",
            PG6R = "/Game/ITR2/BPs/Items/Firearms/Attachments/Scopes/BP_RDS_PK6.BP_RDS_PK6_C",
            ScopeHG = "/Game/ITR2/BPs/Items/Firearms/Attachments/Scopes/BP_Scope_HG.BP_Scope_HG_C",
            Flashlight ="/Game/ITR2/BPs/Items/Firearms/Attachments/Illumination/BP_Att_Flashlight_small.BP_Att_Flashlight_small_C",
            Laser = "/Game/ITR2/BPs/Items/Firearms/Attachments/Illumination/BP_Att_Pointer_small.BP_Att_Pointer_small_C",
            BaseAK74Muzzle = "/Game/ITR2/BPs/Items/Firearms/Attachments/Muzzles/AK/BP_MuzzleAK_Base.BP_MuzzleAK_Base_C",
            DTK2AK = "/Game/ITR2/BPs/Items/Firearms/Attachments/Muzzles/AK/BP_MuzzleAK_DTK2.BP_MuzzleAK_DTK2_C",
            DTK1AK = "/Game/ITR2/BPs/Items/Firearms/Attachments/Muzzles/AK/BP_MuzzleAK_DTK1.BP_MuzzleAK_DTK1_C",
            AKM11Muzzle = "/Game/ITR2/BPs/Items/Firearms/Attachments/Muzzles/AK/BP_MuzzleAK_M11.BP_MuzzleAK_M11_C",
            AKSilencer = "/Game/ITR2/BPs/Items/Firearms/Attachments/Silencers/BP_Silencer_5_45.BP_Silencer_5_45_C",
            PistolSilencer = "/Game/ITR2/BPs/Items/Firearms/Attachments/Silencers/BP_Silencer_Pistol.BP_Silencer_Pistol_C",
        }
      },

    Player = {
        --Register hook calls this with Controller
        ---@param func function
        OnRespawn = function(func)
            ---@param Controller AController
            RegisterHook("/Script/IntoTheRadius2.RadiusGameMode:Server_RespawnPlayer", func)
        end
    }
}

return ITR2