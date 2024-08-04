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
        RegisterHook("/Script/IntoTheRadius2.RadiusGameMode:OnLoadLevel", function(LevelTag)
        end, function()
        end)

        RegisterHook("/Script/IntoTheRadius2.RadiusGameInstance:OnLevelLoaded", function()
        end, function ()
        end)

        RegisterHook("/Script/IntoTheRadius2.RadiusGameMode:OnLevelLoaded", function()
        end, function()
        end)
        
        RegisterHook("/Script/IntoTheRadius2.RadiusGameInstance:OnGameStart", function()
        end, function ()
        end)
        RegisterHook("/Script/IntoTheRadius2.RadiusGameInstance:ExitGame", function()
        end, function ()
        end)
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
    RegisterHook("/Script/IntoTheRadius2.RadiusGameMode:Server_RespawnPlayer", function(Controller)
    end)
    --#endregion
--#endregion
