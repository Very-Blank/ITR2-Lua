local ITR2 = {}
ITR2.version = "0.10.2" -- version this was last updated for
ITR2.Hooks = {}

--#region Levels
    --#region Forest

    --#endregion
    --#region Peninsula

    --#endregion
    --#region Hub

    --#endregion

    --#region Common
        --#region Functions

        ---@param LevelTag FGameplayTag
        ---@param func function
        function ITR2.Hooks.OnLoadLevel(LevelTag, func)
            RegisterHook("/Script/IntoTheRadius2.RadiusGameMode:OnLoadLevel", function(LevelTag)
                func()
            end, function()
            end)
        end

        ---@param func function
        function ITR2.Hooks.OnLevelLoaded(func)
            RegisterHook("/Script/IntoTheRadius2.RadiusGameInstance:OnLevelLoaded", func, function()
            end)
            
            RegisterHook("/Script/IntoTheRadius2.RadiusGameMode:OnLevelLoaded", func, function()
            end)
        end

        ---@param func function
        function ITR2.Hooks.OnGameStart(func)
            RegisterHook("/Script/IntoTheRadius2.RadiusGameInstance:OnGameStart", func, function()
            end)
        end

        ---@param func function
        function ITR2.Hooks.ExitGame(func)
            RegisterHook("/Script/IntoTheRadius2.RadiusGameInstance:ExitGame", func, function()
            end)
        end
        --#endregion
    --#endregion

--#endregion

--#region Items
    --#region Backpacks
        -- Medium Firepower
        -- /Game/ITR2/BPs/Items/Equipment/Backpacks/BP_BackPack_Medium_2.BP_BackPack_Medium_2_C
        -- Medium Pouch
        -- /Game/ITR2/BPs/Items/Equipment/Backpacks/BP_BackPack_Medium_1.BP_BackPack_Medium_1_C
    --#endregion
    --Notes:
    --When modifying Items you should use NotifyOnNewObject after level has been loaded
--#endregion

--#region Player
    --#region Functions
    ---@param Controller AController
    ---@param func function
    function ITR2.Hooks.RespawnPlayer(Controller, func)
        RegisterHook("/Script/IntoTheRadius2.RadiusGameMode:Server_RespawnPlayer", function(Controller)
            func()
        end)
    end
    --#endregion
--#endregion

return ITR2
