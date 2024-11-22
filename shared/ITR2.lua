-- repo: https://github.com/Very-Blank/ITR2-Lua/
-- define shorthand paths for common paths
local paths = {
    Script = "/Script/IntoTheRadius2."
}

local ITR2 = {
    version = {
        game = "0.11.2",
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
