-- AUTO-GENERATED BY EVENTS LIB UPDATE SCRIPT --
Events = {
	ArtefactNestSpawnPoint = {
		OnArtefactTaken = function(func)
		-- Params:  --
		RegisterHook("/Script/IntoTheRadius2.ArtefactNestSpawnPoint:OnArtefactTaken", func)
		end,
	},
	ConditionalHider = {
		OnAccessLevelChanged = function(func)
		-- Params: AccessLevel --
		RegisterHook("/Script/IntoTheRadius2.ConditionalHider:OnAccessLevelChanged", func)
		end,
	},
	LootSpawnPoint = {
		OnItemGripped = function(func)
		-- Params: GrippingController, GripInformation --
		RegisterHook("/Script/IntoTheRadius2.LootSpawnPoint:OnItemGripped", func)
		end,
	},
	LostAndFound = {
		OnItemGripped = function(func)
		-- Params: GrippingController, GripInformation --
		RegisterHook("/Script/IntoTheRadius2.LostAndFound:OnItemGripped", func)
		end,
	},
	RadiusAICharacterBase = {
		OnDeath = function(func)
		-- Params: DeathInstigator, DiedPawn --
		RegisterHook("/Script/IntoTheRadius2.RadiusAICharacterBase:OnDeath", func)
		end,
	},
	RadiusAIControllerBase = {
		OnVisibleNpcDeath = function(func)
		-- Params: DeathInstigator, DiedNPC --
		RegisterHook("/Script/IntoTheRadius2.RadiusAIControllerBase:OnVisibleNpcDeath", func)
		end,
		OnTargetDeath = function(func)
		-- Params: Target --
		RegisterHook("/Script/IntoTheRadius2.RadiusAIControllerBase:OnTargetDeath", func)
		end,
		OnPerceptionUpdated = function(func)
		-- Params: Target, Stimulus --
		RegisterHook("/Script/IntoTheRadius2.RadiusAIControllerBase:OnPerceptionUpdated", func)
		end,
		OnAggroReductionStarted = function(func)
		-- Params:  --
		RegisterHook("/Script/IntoTheRadius2.RadiusAIControllerBase:OnAggroReductionStarted", func)
		end,
	},
	RadiusBulletProjectile = {
		OnSpawnImpact = function(func)
		-- Params: Hit, ShotDistance, Scale, IsCritical, IsArmor --
		RegisterHook("/Script/IntoTheRadius2.RadiusBulletProjectile:OnSpawnImpact", func)
		end,
		OnHit = function(func)
		-- Params: Hit --
		RegisterHook("/Script/IntoTheRadius2.RadiusBulletProjectile:OnHit", func)
		end,
	},
	RadiusFirearmBase = {
		OnHolsteredItemChanged = function(func)
		-- Params: HolsterComponent, RadiusItem, bHasAttached --
		RegisterHook("/Script/IntoTheRadius2.RadiusFirearmBase:OnHolsteredItemChanged", func)
		end,
	},
	RadiusGameDataReplicator = {
		OnRep_Money = function(func)
		-- Params: OldMoney --
		RegisterHook("/Script/IntoTheRadius2.RadiusGameDataReplicator:OnRep_Money", func)
		end,
		OnRep_LastTideTicks = function(func)
		-- Params:  --
		RegisterHook("/Script/IntoTheRadius2.RadiusGameDataReplicator:OnRep_LastTideTicks", func)
		end,
		OnRep_GlobalTriggers = function(func)
		-- Params:  --
		RegisterHook("/Script/IntoTheRadius2.RadiusGameDataReplicator:OnRep_GlobalTriggers", func)
		end,
		OnRep_GameTicks = function(func)
		-- Params:  --
		RegisterHook("/Script/IntoTheRadius2.RadiusGameDataReplicator:OnRep_GameTicks", func)
		end,
		OnRep_AvailableMissionList = function(func)
		-- Params:  --
		RegisterHook("/Script/IntoTheRadius2.RadiusGameDataReplicator:OnRep_AvailableMissionList", func)
		end,
		OnRep_Ashes = function(func)
		-- Params:  --
		RegisterHook("/Script/IntoTheRadius2.RadiusGameDataReplicator:OnRep_Ashes", func)
		end,
		OnRep_AccessLvlPoints = function(func)
		-- Params:  --
		RegisterHook("/Script/IntoTheRadius2.RadiusGameDataReplicator:OnRep_AccessLvlPoints", func)
		end,
		OnRep_AccessLevel = function(func)
		-- Params:  --
		RegisterHook("/Script/IntoTheRadius2.RadiusGameDataReplicator:OnRep_AccessLevel", func)
		end,
	},
	RadiusGameMode = {
		OnLoadLevel = function(func)
		-- Params: LevelTag --
		RegisterHook("/Script/IntoTheRadius2.RadiusGameMode:OnLoadLevel", func)
		end,
		OnLevelLoaded = function(func)
		-- Params:  --
		RegisterHook("/Script/IntoTheRadius2.RadiusGameMode:OnLevelLoaded", func)
		end,
	},
	RadiusNonHumanAICharacter = {
		OnDeath = function(func)
		-- Params: DeathInstigator, DiedNPC --
		RegisterHook("/Script/IntoTheRadius2.RadiusNonHumanAICharacter:OnDeath", func)
		end,
	},
	RadiusPlayerCharacter = {
		OnTeleported = function(func)
		-- Params:  --
		RegisterHook("/Script/IntoTheRadius2.RadiusPlayerCharacter:OnTeleported", func)
		end,
		OnPlayerStateSet = function(func)
		-- Params:  --
		RegisterHook("/Script/IntoTheRadius2.RadiusPlayerCharacter:OnPlayerStateSet", func)
		end,
	},
	RadiusPlayerCharacterGameplay = {
		OnPossessed = function(func)
		-- Params: Pawn --
		RegisterHook("/Script/IntoTheRadius2.RadiusPlayerCharacterGameplay:OnPossessed", func)
		end,
	},
	RadiusPlayerController = {
		OnPostPossess = function(func)
		-- Params: P --
		RegisterHook("/Script/IntoTheRadius2.RadiusPlayerController:OnPostPossess", func)
		end,
	},
	RadiusTimeController = {
		OnGameTimeRefresh = function(func)
		-- Params:  --
		RegisterHook("/Script/IntoTheRadius2.RadiusTimeController:OnGameTimeRefresh", func)
		end,
		OnGameTimeChanged = function(func)
		-- Params: AddedSeconds --
		RegisterHook("/Script/IntoTheRadius2.RadiusTimeController:OnGameTimeChanged", func)
		end,
	},
	RadiusItemInterface = {
		OnHolstered = function(func)
		-- Params: Holster --
		RegisterHook("/Script/IntoTheRadius2.RadiusItemInterface:OnHolstered", func)
		end,
		CreateBlockedDynamicDataOnGrip = function(func)
		-- Params:  --
		RegisterHook("/Script/IntoTheRadius2.RadiusItemInterface:CreateBlockedDynamicDataOnGrip", func)
		end,
		BlockCreatingDynamicDataOnGrip = function(func)
		-- Params:  --
		RegisterHook("/Script/IntoTheRadius2.RadiusItemInterface:BlockCreatingDynamicDataOnGrip", func)
		end,
	},
	HealthComponent = {
		OnAnyDamageTaken = function(func)
		-- Params: Actor, Damage, DamageType, InstigatedBy, DamageCauser --
		RegisterHook("/Script/IntoTheRadius2.HealthComponent:OnAnyDamageTaken", func)
		end,
	},
	PlayerStatsComponent = {
		OnRep_CurrentStamina = function(func)
		-- Params:  --
		RegisterHook("/Script/IntoTheRadius2.PlayerStatsComponent:OnRep_CurrentStamina", func)
		end,
		OnRep_CurrentHunger = function(func)
		-- Params:  --
		RegisterHook("/Script/IntoTheRadius2.PlayerStatsComponent:OnRep_CurrentHunger", func)
		end,
		OnRep_CurrentHealth = function(func)
		-- Params:  --
		RegisterHook("/Script/IntoTheRadius2.PlayerStatsComponent:OnRep_CurrentHealth", func)
		end,
		OnLevelLoadedStep = function(func)
		-- Params: Step --
		RegisterHook("/Script/IntoTheRadius2.PlayerStatsComponent:OnLevelLoadedStep", func)
		end,
		OnAnyDamageTaken = function(func)
		-- Params: Actor, Damage, DamageType, InstigatedBy, DamageCauser --
		RegisterHook("/Script/IntoTheRadius2.PlayerStatsComponent:OnAnyDamageTaken", func)
		end,
		Client_OnWeightRecalculated = function(func)
		-- Params: ChangedPlayerContainerID --
		RegisterHook("/Script/IntoTheRadius2.PlayerStatsComponent:Client_OnWeightRecalculated", func)
		end,
	},
	RadiusDataComponent = {
		OnHolsteredItemChanged = function(func)
		-- Params: HolsterComponent, RadiusItem, bHasAttached --
		RegisterHook("/Script/IntoTheRadius2.RadiusDataComponent:OnHolsteredItemChanged", func)
		end,
	},
	RadiusEventsSubsystem = {
		FireOnTutorialStarted = function(func)
		-- Params: TutorialTag --
		RegisterHook("/Script/IntoTheRadius2.RadiusEventsSubsystem:FireOnTutorialStarted", func)
		end,
		FireOnTutorialFinished = function(func)
		-- Params: TutorialID, CompletedStepsNum, Seconds, IsTutorialSkipped --
		RegisterHook("/Script/IntoTheRadius2.RadiusEventsSubsystem:FireOnTutorialFinished", func)
		end,
		FireOnStartLoadLevel = function(func)
		-- Params: LevelTag --
		RegisterHook("/Script/IntoTheRadius2.RadiusEventsSubsystem:FireOnStartLoadLevel", func)
		end,
		FireOnSplashScreenShown = function(func)
		-- Params:  --
		RegisterHook("/Script/IntoTheRadius2.RadiusEventsSubsystem:FireOnSplashScreenShown", func)
		end,
		FireOnSleep = function(func)
		-- Params: Location --
		RegisterHook("/Script/IntoTheRadius2.RadiusEventsSubsystem:FireOnSleep", func)
		end,
		FireOnSettingsChanged = function(func)
		-- Params:  --
		RegisterHook("/Script/IntoTheRadius2.RadiusEventsSubsystem:FireOnSettingsChanged", func)
		end,
		FireOnPlayerRunning = function(func)
		-- Params:  --
		RegisterHook("/Script/IntoTheRadius2.RadiusEventsSubsystem:FireOnPlayerRunning", func)
		end,
		FireOnPlayerKill = function(func)
		-- Params: NPCTag, Weapon, NPCLocation, DistanceToNPC --
		RegisterHook("/Script/IntoTheRadius2.RadiusEventsSubsystem:FireOnPlayerKill", func)
		end,
		FireOnPlayerInventoryChanged = function(func)
		-- Params: PlayerUID --
		RegisterHook("/Script/IntoTheRadius2.RadiusEventsSubsystem:FireOnPlayerInventoryChanged", func)
		end,
		FireOnPlayerDisconnected = function(func)
		-- Params: UniqueNetId --
		RegisterHook("/Script/IntoTheRadius2.RadiusEventsSubsystem:FireOnPlayerDisconnected", func)
		end,
		FireOnPlayerDeathPointsChanged = function(func)
		-- Params:  --
		RegisterHook("/Script/IntoTheRadius2.RadiusEventsSubsystem:FireOnPlayerDeathPointsChanged", func)
		end,
		FireOnPlayerConnected = function(func)
		-- Params: UniqueNetId --
		RegisterHook("/Script/IntoTheRadius2.RadiusEventsSubsystem:FireOnPlayerConnected", func)
		end,
		FireOnMissionStarted = function(func)
		-- Params: Mission --
		RegisterHook("/Script/IntoTheRadius2.RadiusEventsSubsystem:FireOnMissionStarted", func)
		end,
		FireOnMissionListUpdate = function(func)
		-- Params:  --
		RegisterHook("/Script/IntoTheRadius2.RadiusEventsSubsystem:FireOnMissionListUpdate", func)
		end,
		FireOnMissionFinished = function(func)
		-- Params: Mission, State, CurrentObjectiveIndex --
		RegisterHook("/Script/IntoTheRadius2.RadiusEventsSubsystem:FireOnMissionFinished", func)
		end,
		FireOnMainMenuLoaded = function(func)
		-- Params:  --
		RegisterHook("/Script/IntoTheRadius2.RadiusEventsSubsystem:FireOnMainMenuLoaded", func)
		end,
		FireOnLvlPointsChanged = function(func)
		-- Params: NewLvlPoints --
		RegisterHook("/Script/IntoTheRadius2.RadiusEventsSubsystem:FireOnLvlPointsChanged", func)
		end,
		FireOnLoadLevelStep = function(func)
		-- Params: Step --
		RegisterHook("/Script/IntoTheRadius2.RadiusEventsSubsystem:FireOnLoadLevelStep", func)
		end,
		FireOnIngameMenuOpened = function(func)
		-- Params:  --
		RegisterHook("/Script/IntoTheRadius2.RadiusEventsSubsystem:FireOnIngameMenuOpened", func)
		end,
		FireOnIngameMenuClosed = function(func)
		-- Params:  --
		RegisterHook("/Script/IntoTheRadius2.RadiusEventsSubsystem:FireOnIngameMenuClosed", func)
		end,
		FireOnHostGame = function(func)
		-- Params:  --
		RegisterHook("/Script/IntoTheRadius2.RadiusEventsSubsystem:FireOnHostGame", func)
		end,
		FireOnGlobalTriggersChange = function(func)
		-- Params:  --
		RegisterHook("/Script/IntoTheRadius2.RadiusEventsSubsystem:FireOnGlobalTriggersChange", func)
		end,
		FireOnGameStart = function(func)
		-- Params:  --
		RegisterHook("/Script/IntoTheRadius2.RadiusEventsSubsystem:FireOnGameStart", func)
		end,
		FireOnGameDataSaved = function(func)
		-- Params:  --
		RegisterHook("/Script/IntoTheRadius2.RadiusEventsSubsystem:FireOnGameDataSaved", func)
		end,
		FireOnGameDataLoaded = function(func)
		-- Params:  --
		RegisterHook("/Script/IntoTheRadius2.RadiusEventsSubsystem:FireOnGameDataLoaded", func)
		end,
		FireOnFirstPlayerEnteredShop = function(func)
		-- Params:  --
		RegisterHook("/Script/IntoTheRadius2.RadiusEventsSubsystem:FireOnFirstPlayerEnteredShop", func)
		end,
		FireOnFinishLoadLevel = function(func)
		-- Params:  --
		RegisterHook("/Script/IntoTheRadius2.RadiusEventsSubsystem:FireOnFinishLoadLevel", func)
		end,
		FireOnDifficultyOptionChanged = function(func)
		-- Params: OptionTag, ValueTag --
		RegisterHook("/Script/IntoTheRadius2.RadiusEventsSubsystem:FireOnDifficultyOptionChanged", func)
		end,
		FireOnCommonGameDataSaved = function(func)
		-- Params:  --
		RegisterHook("/Script/IntoTheRadius2.RadiusEventsSubsystem:FireOnCommonGameDataSaved", func)
		end,
		FireOnCommonGameDataLoaded = function(func)
		-- Params:  --
		RegisterHook("/Script/IntoTheRadius2.RadiusEventsSubsystem:FireOnCommonGameDataLoaded", func)
		end,
		FireOnArtefactNestSpawned = function(func)
		-- Params: Nest --
		RegisterHook("/Script/IntoTheRadius2.RadiusEventsSubsystem:FireOnArtefactNestSpawned", func)
		end,
		FireOnArtefactNestDestroyed = function(func)
		-- Params: Nest --
		RegisterHook("/Script/IntoTheRadius2.RadiusEventsSubsystem:FireOnArtefactNestDestroyed", func)
		end,
		FireOnAccessLevelChanged = function(func)
		-- Params: NewLevel --
		RegisterHook("/Script/IntoTheRadius2.RadiusEventsSubsystem:FireOnAccessLevelChanged", func)
		end,
	},
	RadiusGameDataSubsystem = {
		OnFirstGameDataLevelLoaded = function(func)
		-- Params:  --
		RegisterHook("/Script/IntoTheRadius2.RadiusGameDataSubsystem:OnFirstGameDataLevelLoaded", func)
		end,
	},
	RadiusGameInstance = {
		OnLevelLoaded = function(func)
		-- Params:  --
		RegisterHook("/Script/IntoTheRadius2.RadiusGameInstance:OnLevelLoaded", func)
		end,
		OnGameStart = function(func)
		-- Params:  --
		RegisterHook("/Script/IntoTheRadius2.RadiusGameInstance:OnGameStart", func)
		end,
	},
	RadiusGameInstanceSubsystem = {
		OnStart = function(func)
		-- Params:  --
		RegisterHook("/Script/IntoTheRadius2.RadiusGameInstanceSubsystem:OnStart", func)
		end,
		OnShutdown = function(func)
		-- Params:  --
		RegisterHook("/Script/IntoTheRadius2.RadiusGameInstanceSubsystem:OnShutdown", func)
		end,
	},
	RadiusHolsterComponent = {
		OnRep_HolsteredActor = function(func)
		-- Params:  --
		RegisterHook("/Script/IntoTheRadius2.RadiusHolsterComponent:OnRep_HolsteredActor", func)
		end,
	},
	RadiusItemConditionalComponent = {
		OnDataUnlinking = function(func)
		-- Params: PreviousDynamicData --
		RegisterHook("/Script/IntoTheRadius2.RadiusItemConditionalComponent:OnDataUnlinking", func)
		end,
		OnDataLinked = function(func)
		-- Params:  --
		RegisterHook("/Script/IntoTheRadius2.RadiusItemConditionalComponent:OnDataLinked", func)
		end,
		OnAdditionalTagChanged = function(func)
		-- Params: Tag, bAdded --
		RegisterHook("/Script/IntoTheRadius2.RadiusItemConditionalComponent:OnAdditionalTagChanged", func)
		end,
	},
	RadiusItemDynamicData = {
		OnRep_ParentContainerUid = function(func)
		-- Params:  --
		RegisterHook("/Script/IntoTheRadius2.RadiusItemDynamicData:OnRep_ParentContainerUid", func)
		end,
		OnRep_Durability = function(func)
		-- Params:  --
		RegisterHook("/Script/IntoTheRadius2.RadiusItemDynamicData:OnRep_Durability", func)
		end,
		OnRep_ContainingItemTagsStack = function(func)
		-- Params: PreviousStack --
		RegisterHook("/Script/IntoTheRadius2.RadiusItemDynamicData:OnRep_ContainingItemTagsStack", func)
		end,
		OnRep_AdditionalTags = function(func)
		-- Params: PreviousTags --
		RegisterHook("/Script/IntoTheRadius2.RadiusItemDynamicData:OnRep_AdditionalTags", func)
		end,
	},
	RadiusItemStackComponent = {
		OnRep_ExtractedItem = function(func)
		-- Params:  --
		RegisterHook("/Script/IntoTheRadius2.RadiusItemStackComponent:OnRep_ExtractedItem", func)
		end,
		OnExtractedItem = function(func)
		-- Params:  --
		RegisterHook("/Script/IntoTheRadius2.RadiusItemStackComponent:OnExtractedItem", func)
		end,
		OnDataUnlinked = function(func)
		-- Params: PreviousDynamicData --
		RegisterHook("/Script/IntoTheRadius2.RadiusItemStackComponent:OnDataUnlinked", func)
		end,
		OnDataLinked = function(func)
		-- Params:  --
		RegisterHook("/Script/IntoTheRadius2.RadiusItemStackComponent:OnDataLinked", func)
		end,
		FireOnStackChanged = function(func)
		-- Params:  --
		RegisterHook("/Script/IntoTheRadius2.RadiusItemStackComponent:FireOnStackChanged", func)
		end,
	},
	RadiusLevelSubsystem = {
		OnLevelLoaded_DoAutosave = function(func)
		-- Params:  --
		RegisterHook("/Script/IntoTheRadius2.RadiusLevelSubsystem:OnLevelLoaded_DoAutosave", func)
		end,
	},
	RadiusLightComponent = {
		OnItemTagChanged = function(func)
		-- Params: Tag, bAdded --
		RegisterHook("/Script/IntoTheRadius2.RadiusLightComponent:OnItemTagChanged", func)
		end,
		OnItemDataUnlink = function(func)
		-- Params: PreviousDynamicData --
		RegisterHook("/Script/IntoTheRadius2.RadiusLightComponent:OnItemDataUnlink", func)
		end,
		OnItemDataLink = function(func)
		-- Params:  --
		RegisterHook("/Script/IntoTheRadius2.RadiusLightComponent:OnItemDataLink", func)
		end,
	},
	RadiusPhysicalHand = {
		OnLerpToHandFinish = function(func)
		-- Params: GripInfo --
		RegisterHook("/Script/IntoTheRadius2.RadiusPhysicalHand:OnLerpToHandFinish", func)
		end,
		OnGrippedSecondary = function(func)
		-- Params: GripInfo --
		RegisterHook("/Script/IntoTheRadius2.RadiusPhysicalHand:OnGrippedSecondary", func)
		end,
		OnGripped = function(func)
		-- Params: GripInfo --
		RegisterHook("/Script/IntoTheRadius2.RadiusPhysicalHand:OnGripped", func)
		end,
		OnDroppedSecondary = function(func)
		-- Params: GripInfo --
		RegisterHook("/Script/IntoTheRadius2.RadiusPhysicalHand:OnDroppedSecondary", func)
		end,
		OnDropped = function(func)
		-- Params: GripInfo, bWasSocketed --
		RegisterHook("/Script/IntoTheRadius2.RadiusPhysicalHand:OnDropped", func)
		end,
	},
	RadiusPlayerMovementComponent = {
		OnWeightRecalculateEvent = function(func)
		-- Params: ChangedPlayerContainerID --
		RegisterHook("/Script/IntoTheRadius2.RadiusPlayerMovementComponent:OnWeightRecalculateEvent", func)
		end,
	},
	RadiusSpawnControlSubsystem = {
		OnTideEvent = function(func)
		-- Params:  --
		RegisterHook("/Script/IntoTheRadius2.RadiusSpawnControlSubsystem:OnTideEvent", func)
		end,
		OnMissionFinished = function(func)
		-- Params: Mission, State, CurrentObjectiveIndex --
		RegisterHook("/Script/IntoTheRadius2.RadiusSpawnControlSubsystem:OnMissionFinished", func)
		end,
		OnLoadLevel = function(func)
		-- Params: LevelTag --
		RegisterHook("/Script/IntoTheRadius2.RadiusSpawnControlSubsystem:OnLoadLevel", func)
		end,
		OnLevelLoaded = function(func)
		-- Params:  --
		RegisterHook("/Script/IntoTheRadius2.RadiusSpawnControlSubsystem:OnLevelLoaded", func)
		end,
		OnGlobalTriggersChange = function(func)
		-- Params:  --
		RegisterHook("/Script/IntoTheRadius2.RadiusSpawnControlSubsystem:OnGlobalTriggersChange", func)
		end,
		OnAccessLevelOrPointsChanged = function(func)
		-- Params: LevelOrPoints --
		RegisterHook("/Script/IntoTheRadius2.RadiusSpawnControlSubsystem:OnAccessLevelOrPointsChanged", func)
		end,
	},
	RadiusWidgetComponent = {
		OnPlayerPossessedPawn = function(func)
		-- Params: PlayerPawn --
		RegisterHook("/Script/IntoTheRadius2.RadiusWidgetComponent:OnPlayerPossessedPawn", func)
		end,
		OnPlayerDied = function(func)
		-- Params: PlayerPawn, DamageCauser --
		RegisterHook("/Script/IntoTheRadius2.RadiusWidgetComponent:OnPlayerDied", func)
		end,
		OnIngameMenuOpened = function(func)
		-- Params:  --
		RegisterHook("/Script/IntoTheRadius2.RadiusWidgetComponent:OnIngameMenuOpened", func)
		end,
		OnIngameMenuClosed = function(func)
		-- Params:  --
		RegisterHook("/Script/IntoTheRadius2.RadiusWidgetComponent:OnIngameMenuClosed", func)
		end,
	},
}
return Events