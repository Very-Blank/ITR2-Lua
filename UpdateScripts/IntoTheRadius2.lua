---@meta

---@class AAnomalyBase : AActor
---@field AnomalyUniqueId FString
AAnomalyBase = {}



---@class AArtefactNestBase : AActor
---@field Level int32
---@field ArtefactUID FString
---@field ArtefactTag FGameplayTag
---@field OnArtefactTaken FArtefactNestBaseOnArtefactTaken
---@field ArtefactSpawnPoint USceneComponent
---@field ArtefactRef ARadiusItemBase
---@field NestUniqueId FString
AArtefactNestBase = {}

function AArtefactNestBase:OnRep_ArtefactRef() end
function AArtefactNestBase:OnArtefactRefReplicated() end
function AArtefactNestBase:LoadFromGameData() end


---@class AArtefactNestSpawnPoint : ASpawnPoint
---@field ArtefactNestTypes TArray<FGameplayTag>
---@field SpawnedNest AArtefactNestBase
AArtefactNestSpawnPoint = {}

function AArtefactNestSpawnPoint:OnArtefactTaken() end


---@class ACombatZone : AActor
---@field ZoneRadius float
ACombatZone = {}

---@param Actor AActor
---@return boolean
function ACombatZone:IsActorInside(Actor) end


---@class AConditionalHider : AActor
---@field Conditions TArray<URadiusCondition>
---@field bDeleteCompletely boolean
AConditionalHider = {}

---@param AccessLevel int32
function AConditionalHider:OnAccessLevelChanged(AccessLevel) end
function AConditionalHider:CheckConditions() end


---@class AGripSelectorsController : AActor
AGripSelectorsController = {}


---@class ALevelGateBase : AActor
---@field bIgnoreAsStart boolean
ALevelGateBase = {}

---@return FTransform
function ALevelGateBase:GetPivotExitTransform() end
---@return TArray<FGameplayTag>
function ALevelGateBase:GetLevels() end
---@return FGameplayTag
function ALevelGateBase:GetGateTag() end


---@class ALootSpawnArea : ALootSpawnPoint
---@field bExcludeNonFit boolean
---@field bProjectOnGround boolean
---@field BoxComponent UBoxComponent
ALootSpawnArea = {}

function ALootSpawnArea:ArrangeItems() end
---@param Items TArray<AActor>
function ALootSpawnArea:ArrangeCustomItems(Items) end


---@class ALootSpawnGroup : ARadiusSpawnGroup
---@field LootTable FGameplayTag
ALootSpawnGroup = {}



---@class ALootSpawnPoint : ASpawnPoint
---@field LootPoints int32
---@field LootCategories TArray<FLootCategory>
---@field SpawnedItems TMap<AActor, FLootToSpawn>
ALootSpawnPoint = {}

function ALootSpawnPoint:SpawnNext() end
---@param GrippingController UGripMotionControllerComponent
---@param GripInformation FBPActorGripInformation
function ALootSpawnPoint:OnItemGripped(GrippingController, GripInformation) end
---@param Item AActor
function ALootSpawnPoint:EnablePhysicsAndSpawnNext(Item) end


---@class ALostAndFound : AActor
---@field ItemsInContainer TArray<AActor>
ALostAndFound = {}

---@param GrippingController UGripMotionControllerComponent
---@param GripInformation FBPActorGripInformation
function ALostAndFound:OnItemGripped(GrippingController, GripInformation) end


---@class ALyraTaggedActor : AActor
---@field StaticGameplayTags FGameplayTagContainer
ALyraTaggedActor = {}



---@class AMissionGoToLocation : AActor
---@field OnLocationReached FMissionGoToLocationOnLocationReached
---@field LocationCollision USphereComponent
---@field GoToObjective UMissionObjective_GoToLocation
AMissionGoToLocation = {}

---@param OverlappedComponent UPrimitiveComponent
---@param OtherActor AActor
---@param OtherComp UPrimitiveComponent
---@param OtherBodyIndex int32
---@param bFromSweep boolean
---@param SweepResult FHitResult
function AMissionGoToLocation:HandleLocationReached(OverlappedComponent, OtherActor, OtherComp, OtherBodyIndex, bFromSweep, SweepResult) end


---@class AMissionObjectivePoint : AActor
---@field PointIcon UBillboardComponent
---@field PointConfiguration FMissionPoint
AMissionObjectivePoint = {}



---@class AMonsterSpawnGroup : ARadiusSpawnGroup
---@field Config FSpawnGroupConfig
AMonsterSpawnGroup = {}



---@class AMonsterSpawnPoint : ASpawnPoint
---@field PointConfig FSpawnPointConfig
---@field bIsIndependentFromDifficulty boolean
---@field AreaRadius float
---@field CombatZone TSoftObjectPtr<ACombatZone>
---@field AIPaths TArray<AActor>
---@field CurrentAIPath AActor
AMonsterSpawnPoint = {}

---@param bSkipFirst boolean
function AMonsterSpawnPoint:SpawnNext(bSkipFirst) end
---@return FTransform
function AMonsterSpawnPoint:GetSpawnTransform() end


---@class ARadiusAICharacterBase : AAlsCharacter
---@field AISightDebug FAISightDebug
---@field ConfigTag FGameplayTag
---@field HealthComponent UHealthComponent
---@field StaticGameplayTags FGameplayTagContainer
---@field GroupID uint8
---@field PointOfViewVerticalOffset float
---@field SightPointOffset FVector
ARadiusAICharacterBase = {}

---@param NewSightPointOffset FVector
function ARadiusAICharacterBase:SetSightPointOffset(NewSightPointOffset) end
---@param DeathInstigator AController
---@param DiedPawn AActor
function ARadiusAICharacterBase:OnDeath(DeathInstigator, DiedPawn) end
---@return boolean
function ARadiusAICharacterBase:IsAlive() end
---@return FVector
function ARadiusAICharacterBase:GetPawnViewLocation_BP() end
---@param GameplayTag FGameplayTag
---@return FText
function ARadiusAICharacterBase:GetNPCNameByTag(GameplayTag) end
---@param NewSpeed float
function ARadiusAICharacterBase:ChangeMoveSpeed(NewSpeed) end


---@class ARadiusAIControllerBase : AAIController
---@field OnNPCStateChanged FRadiusAIControllerBaseOnNPCStateChanged
---@field TeamID FGenericTeamId
---@field BlackboardComponent UBlackboardComponent
---@field HTNComponent UHTNComponent
---@field AIPerceptionComponent URadiusAIPerceptionComponent
---@field AggroComponent UAggroComponent
---@field AIPerceptionSystem UAIPerceptionSystem
---@field GameConfigSubsystem URadiusConfigurationSubsystem
---@field NPCConfig UNPCConfig
---@field GroupNotifyTimerHandle FTimerHandle
ARadiusAIControllerBase = {}

function ARadiusAIControllerBase:UpdatePriorityTarget() end
---@param InNPCState ENPCState
function ARadiusAIControllerBase:SetNPCState(InNPCState) end
---@param Target AActor
---@param Damage float
---@param HitFromDirection FVector
---@param HitInfo FHitResult
---@param EventInstigator AController
---@param DamageCauser AActor
---@param DamageTypeClass TSubclassOf<UDamageType>
function ARadiusAIControllerBase:Server_ApplyPointDamage(Target, Damage, HitFromDirection, HitInfo, EventInstigator, DamageCauser, DamageTypeClass) end
---@param DeathInstigator AController
---@param DiedNPC AActor
function ARadiusAIControllerBase:OnVisibleNpcDeath(DeathInstigator, DiedNPC) end
---@param Target AActor
function ARadiusAIControllerBase:OnTargetDeath(Target) end
---@param Target AActor
---@param Stimulus FAIStimulus
function ARadiusAIControllerBase:OnPerceptionUpdated(Target, Stimulus) end
function ARadiusAIControllerBase:OnAggroReductionStarted() end
---@return FVector
function ARadiusAIControllerBase:GetShootLocation() end
---@return ENPCState
function ARadiusAIControllerBase:GetNPCState() end


---@class ARadiusALSCharacter : AAlsCharacter
---@field InputMappingContext UInputMappingContext
---@field LookMouseAction UInputAction
---@field LookAction UInputAction
---@field MoveAction UInputAction
---@field SprintAction UInputAction
---@field WalkAction UInputAction
---@field CrouchAction UInputAction
---@field JumpAction UInputAction
---@field AimAction UInputAction
---@field RagdollAction UInputAction
---@field RollAction UInputAction
---@field RotationModeAction UInputAction
---@field ViewModeAction UInputAction
---@field SwitchShoulderAction UInputAction
---@field LookUpMouseSensitivity float
---@field LookRightMouseSensitivity float
---@field LookUpRate float
---@field LookRightRate float
ARadiusALSCharacter = {}



---@class ARadiusAudioVolume : AAudioVolume
---@field Audio UAudioComponent
---@field SoundCue USoundCue
---@field FadeInDuration float
---@field FadeInCurve EAudioFaderCurve
---@field FadeOutDuration float
---@field FadeOutCurve EAudioFaderCurve
ARadiusAudioVolume = {}

---@param bShow boolean
function ARadiusAudioVolume:DisableVolume(bShow) end


---@class ARadiusBed : AActor
---@field CollisionRadius int32
ARadiusBed = {}

---@return boolean
function ARadiusBed:ArePlayersNear() end


---@class ARadiusBulletProjectile : ARadiusProjectile
---@field SphereCollider USphereComponent
---@field BulletTracerComponent URadiusBulletTracerComponent
---@field BulletComponent URadiusBulletComponent
---@field BulletImpulseComponent URadiusBulletImpulseComponent
---@field ParticleScaleInputRange FVector2D
---@field ParticleScaleOutputRange FVector2D
ARadiusBulletProjectile = {}

---@param HitComponent UPrimitiveComponent
---@param OtherActor AActor
---@param OtherComponent UPrimitiveComponent
---@param NormalImpulse FVector
---@param Hit FHitResult
function ARadiusBulletProjectile:SphereColliderHit(HitComponent, OtherActor, OtherComponent, NormalImpulse, Hit) end
---@param Hit FHitResult
---@param ShotDistance float
---@param Scale float
---@param IsCritical boolean
---@param IsArmor boolean
function ARadiusBulletProjectile:OnSpawnImpact(Hit, ShotDistance, Scale, IsCritical, IsArmor) end
---@param Hit FHitResult
function ARadiusBulletProjectile:OnHit(Hit) end
---@param Location FVector
---@param Force FVector
---@param IsPenetration boolean
function ARadiusBulletProjectile:BulletComponentRicochet(Location, Force, IsPenetration) end
---@param Hit FHitResult
---@param ShotDistance float
---@param IsCritical boolean
---@param IsArmor boolean
function ARadiusBulletProjectile:BulletComponentImpact(Hit, ShotDistance, IsCritical, IsArmor) end


---@class ARadiusContainerController : AActor
ARadiusContainerController = {}


---@class ARadiusFirearmBase : ARadiusItemBase
---@field WeaponMesh USkeletalMeshComponent
---@field FirearmComponent URadiusFirearmComponent
---@field MuzzleComponent URadiusMuzzleComponent
---@field FirearmComponentClass TSubclassOf<URadiusFirearmComponent>
---@field MuzzleComponentClass TSubclassOf<URadiusMuzzleComponent>
ARadiusFirearmBase = {}

---@param HolsterComponent URadiusHolsterComponent
---@param RadiusItem ARadiusGrippableActorBase
---@param bHasAttached boolean
function ARadiusFirearmBase:OnHolsteredItemChanged(HolsterComponent, RadiusItem, bHasAttached) end
---@param GameplayTag FGameplayTag
---@return FText
function ARadiusFirearmBase:GetWeaponNameByTag(GameplayTag) end


---@class ARadiusGameDataReplicator : AActor
---@field GameTicks uint64
---@field LastTideTicks uint64
---@field AccessLevel int32
---@field AccessLvlPoints int32
---@field NewItemLabelCounters TArray<int32>
---@field GlobalTriggers TArray<FGameplayTag>
---@field ItemDynamicDatas FRadiusDynDataList
---@field AvailableMissionList FRadiusMissionList
---@field ObjectiveList FRadiusMissionObjectiveList
---@field Money int32
---@field Ashes int32
---@field DifficultySettings TArray<FGameplayTagsTuple>
ARadiusGameDataReplicator = {}

---@param NewAccessLevel int32
function ARadiusGameDataReplicator:UpdateNewItemLabelCounters(NewAccessLevel) end
---@param Trigger FGameplayTag
---@param bSet boolean
---@return boolean
function ARadiusGameDataReplicator:SetGlobalTrigger(Trigger, bSet) end
---@param NewAccessPoints int32
function ARadiusGameDataReplicator:SetAccessLvlPoints(NewAccessPoints) end
---@param NewLevel int32
function ARadiusGameDataReplicator:SetAccessLevel(NewLevel) end
function ARadiusGameDataReplicator:PrintItemDynamicData() end
---@param LevelTag FGameplayTag
function ARadiusGameDataReplicator:PrepareReplicatorForTravel(LevelTag) end
---@param OldMoney int32
function ARadiusGameDataReplicator:OnRep_Money(OldMoney) end
function ARadiusGameDataReplicator:OnRep_LastTideTicks() end
function ARadiusGameDataReplicator:OnRep_GlobalTriggers() end
function ARadiusGameDataReplicator:OnRep_GameTicks() end
function ARadiusGameDataReplicator:OnRep_AvailableMissionList() end
function ARadiusGameDataReplicator:OnRep_Ashes() end
function ARadiusGameDataReplicator:OnRep_AccessLvlPoints() end
function ARadiusGameDataReplicator:OnRep_AccessLevel() end
---@return TArray<int32>
function ARadiusGameDataReplicator:GetNewItemLabelCounters() end
---@param ItemType FGameplayTag
---@return TArray<URadiusItemDynamicData>
function ARadiusGameDataReplicator:GetItemDynamicDatasByTypeId(ItemType) end
---@param ItemUid FString
---@return URadiusItemDynamicData
function ARadiusGameDataReplicator:GetItemDynamicDataByUid(ItemUid) end
---@return TMap<FGameplayTag, FGameplayTag>
function ARadiusGameDataReplicator:GetDifficultySettings() end
---@param ContainerUid FString
---@param bIncludeChildren boolean
---@return TArray<URadiusItemDynamicData>
function ARadiusGameDataReplicator:GetChildItemsOfContainerUid(ContainerUid, bIncludeChildren) end
---@return TArray<URadiusItemDynamicData>
function ARadiusGameDataReplicator:GetAllReplicatedDynamicDatas() end
---@return int32
function ARadiusGameDataReplicator:GetAccessLevelPoints() end
---@return int32
function ARadiusGameDataReplicator:GetAccessLevel() end
function ARadiusGameDataReplicator:DecreaseNewItemLabelCounters() end
---@param Trigger FGameplayTag
---@return boolean
function ARadiusGameDataReplicator:CheckGlobalTrigger(Trigger) end


---@class ARadiusGameMode : AGameMode
---@field DefaultNoHMDPawnClass TSubclassOf<APawn>
ARadiusGameMode = {}

---@param Controller AController
function ARadiusGameMode:Server_RespawnPlayer(Controller) end
---@param LevelTag FGameplayTag
function ARadiusGameMode:OnLoadLevel(LevelTag) end
function ARadiusGameMode:OnLevelLoaded() end


---@class ARadiusGameState : AGameState
ARadiusGameState = {}

---@param bShow boolean
function ARadiusGameState:NetShowLoadingScreen(bShow) end


---@class ARadiusGameStateGameplay : ARadiusGameState
ARadiusGameStateGameplay = {}


---@class ARadiusGameplayGameMode : ARadiusGameMode
ARadiusGameplayGameMode = {}

function ARadiusGameplayGameMode:BeginPlay() end


---@class ARadiusGrippableActorBase : AGrippableActor
---@field OnDistanceGripChanged FRadiusGrippableActorBaseOnDistanceGripChanged
---@field OnItemHolstered FRadiusGrippableActorBaseOnItemHolstered
---@field SyncTransfromComponent USyncTransformComponent
---@field CachedCollisions TMap<UMeshComponent, FName>
ARadiusGrippableActorBase = {}

function ARadiusGrippableActorBase:StartFloating() end
---@return UStaticMeshComponent
function ARadiusGrippableActorBase:GetStaticMeshComponent() end
---@return USkeletalMeshComponent
function ARadiusGrippableActorBase:GetSkeletalMeshComponent() end


---@class ARadiusHolder : AActor
---@field bOnlyOwnerCanInteract boolean
---@field AllowedGripTags FGameplayTagContainer
---@field bPreventCollisionWithAttachedItem boolean
ARadiusHolder = {}

function ARadiusHolder:SpawnSavedItems() end
---@param PreviousDynamicData URadiusItemDynamicData
function ARadiusHolder:OnDataUnlinking(PreviousDynamicData) end
function ARadiusHolder:InitializeContainer_Internal() end
---@param ItemActor AActor
function ARadiusHolder:Continue_SpawnSavedItems(ItemActor) end


---@class ARadiusItemBase : ARadiusGrippableActorBase
---@field DataComponent URadiusDataComponent
---@field ItemConfiguration FItemConfiguration
---@field OnItemReconfigure FRadiusItemBaseOnItemReconfigure
---@field OnPushedToPool FRadiusItemBaseOnPushedToPool
---@field OnItemUsed FRadiusItemBaseOnItemUsed
---@field OnItemEndUsed FRadiusItemBaseOnItemEndUsed
---@field OnItemSecondaryUsed FRadiusItemBaseOnItemSecondaryUsed
---@field OnItemSecondaryEndUsed FRadiusItemBaseOnItemSecondaryEndUsed
---@field OnItemTertiaryUsed FRadiusItemBaseOnItemTertiaryUsed
---@field OnItemTertiaryEndUsed FRadiusItemBaseOnItemTertiaryEndUsed
---@field OnItemGrip FRadiusItemBaseOnItemGrip
---@field OnItemChildGrip FRadiusItemBaseOnItemChildGrip
---@field OnItemGripRelease FRadiusItemBaseOnItemGripRelease
---@field OnItemChildGripRelease FRadiusItemBaseOnItemChildGripRelease
---@field OnItemSecondaryGrip FRadiusItemBaseOnItemSecondaryGrip
---@field OnItemSecondaryGripRelease FRadiusItemBaseOnItemSecondaryGripRelease
---@field OnItemInput FRadiusItemBaseOnItemInput
---@field OnOwnerChanged FRadiusItemBaseOnOwnerChanged
---@field CachedProperties FPropsCache
---@field GripControllerPrimary UGripMotionControllerComponent
---@field GripControllerSecondary UGripMotionControllerComponent
---@field GS_LerptToHand UGS_LerpToHand
ARadiusItemBase = {}

---@param NewDurability float
function ARadiusItemBase:Server_SetDurability(NewDurability) end
function ARadiusItemBase:RetryPlaceContainer() end
function ARadiusItemBase:PostInitializeComponents() end
function ARadiusItemBase:OnParenIDReplicated() end
---@param PreviousData URadiusItemDynamicData
function ARadiusItemBase:OnDataUnlinking(PreviousData) end
function ARadiusItemBase:OnDataLinked() end
---@param bShouldFakeAttach boolean
---@param AutoDetachIn float
---@param GripInfo FBPActorGripInformation
function ARadiusItemBase:FakeAttachHand(bShouldFakeAttach, AutoDetachIn, GripInfo) end
function ARadiusItemBase:CreateDynamicData() end


---@class ARadiusNonHumanAICharacter : ACharacter
---@field AISightDebug FAISightDebug
---@field ConfigTag FGameplayTag
---@field HealthComponent UHealthComponent
---@field StaticGameplayTags FGameplayTagContainer
---@field GroupID uint8
---@field PointOfViewVerticalOffset float
---@field AnimationTag FGameplayTag
ARadiusNonHumanAICharacter = {}

---@param NewAnimationTag FGameplayTag
function ARadiusNonHumanAICharacter:SetAnimState(NewAnimationTag) end
---@param NewAnimationTag FGameplayTag
function ARadiusNonHumanAICharacter:OnRep_AnimationState(NewAnimationTag) end
---@param DeathInstigator AController
---@param DiedNPC AActor
function ARadiusNonHumanAICharacter:OnDeath(DeathInstigator, DiedNPC) end
---@return boolean
function ARadiusNonHumanAICharacter:IsAlive() end
---@param GameplayTag FGameplayTag
---@return FText
function ARadiusNonHumanAICharacter:GetNPCNameByTag(GameplayTag) end
---@return FGameplayTag
function ARadiusNonHumanAICharacter:GetAnimState() end
---@param NewSpeed float
function ARadiusNonHumanAICharacter:ChangeMoveSpeed(NewSpeed) end


---@class ARadiusPlayerCharacter : AVRCharacter
---@field VRNotificationsComponent UVRNotificationsComponent
---@field RadiusPlayerState TWeakObjectPtr<ARadiusPlayerState>
ARadiusPlayerCharacter = {}

---@param Transform FTransform
---@param Velocity FVector
---@param bWristMenuHidden boolean
---@param bProjectOnGround boolean
---@param Adjust EPlayerTeleportAdjustType
function ARadiusPlayerCharacter:Server_TeleportPlayer(Transform, Velocity, bWristMenuHidden, bProjectOnGround, Adjust) end
function ARadiusPlayerCharacter:ResetOrientationAndPosition() end
function ARadiusPlayerCharacter:PreTeleport() end
function ARadiusPlayerCharacter:OnTeleported() end
function ARadiusPlayerCharacter:OnPlayerStateSet() end
---@return APlayerController
function ARadiusPlayerCharacter:GetSelfPlayerController() end
---@return ARadiusPlayerState
function ARadiusPlayerCharacter:GetRadiusPlayerState() end
---@param Transform FTransform
---@param Velocity FVector
---@param bWristMenuHidden boolean
---@param bProjectOnGround boolean
---@param Adjust EPlayerTeleportAdjustType
function ARadiusPlayerCharacter:Client_TeleportPlayer(Transform, Velocity, bWristMenuHidden, bProjectOnGround, Adjust) end


---@class ARadiusPlayerCharacterGameplay : ARadiusPlayerCharacter
---@field PlayerHands UPlayerHandsComponent
---@field PhysicsHandLeft URadiusPhysicalHand
---@field PhysicsGripLeft UPlayerGripConstraintComponent
---@field GrabSphereLeft USphereComponent
---@field PhysicsHandRight URadiusPhysicalHand
---@field PhysicsGripRight UPlayerGripConstraintComponent
---@field GrabSphereRight USphereComponent
---@field PlayerStats UPlayerStatsComponent
---@field RadiusPlayerStateGameplay TWeakObjectPtr<ARadiusPlayerStateGameplay>
ARadiusPlayerCharacterGameplay = {}

---@param Pawn APawn
function ARadiusPlayerCharacterGameplay:OnPossessed(Pawn) end
---@return ARadiusPlayerStateGameplay
function ARadiusPlayerCharacterGameplay:GetRadiusPlayerStateGameplay() end
---@return TArray<FGameplayTag>
function ARadiusPlayerCharacterGameplay:GetAllAutoReturnHolsters() end
function ARadiusPlayerCharacterGameplay:Delayed_InitializeContainer_Internal() end


---@class ARadiusPlayerController : AVRPlayerController
---@field TeamID FGenericTeamId
---@field OnPlayerStateReplicated FRadiusPlayerControllerOnPlayerStateReplicated
ARadiusPlayerController = {}

---@param LevelTag FGameplayTag
function ARadiusPlayerController:Server_TravelTo(LevelTag) end
---@param PlayerCharacter ARadiusPlayerCharacterGameplay
function ARadiusPlayerController:Server_NotifyClientCharacterInitialized(PlayerCharacter) end
---@param DeltaMoney int32
---@param AnalyticsString FString
---@param MoneyChangeReason EMoneyChangeReason
function ARadiusPlayerController:Server_ChangeMoney(DeltaMoney, AnalyticsString, MoneyChangeReason) end
---@param Target AActor
---@param Damage float
---@param HitFromDirection FVector
---@param HitInfo FHitResult
---@param EventInstigator AController
---@param DamageCauser AActor
---@param DamageTypeClass TSubclassOf<UDamageType>
function ARadiusPlayerController:Server_ApplyPointDamage(Target, Damage, HitFromDirection, HitInfo, EventInstigator, DamageCauser, DamageTypeClass) end
---@param P APawn
function ARadiusPlayerController:OnPostPossess(P) end
---@return APawn
function ARadiusPlayerController:GetRadiusPawn() end


---@class ARadiusPlayerState : APlayerState
---@field bIsHost boolean
---@field OnPlayerNameChange FRadiusPlayerStateOnPlayerNameChange
---@field PlayerHeight float
---@field OnPlayerHeightChange FRadiusPlayerStateOnPlayerHeightChange
ARadiusPlayerState = {}

---@param NewPlayerHeight float
function ARadiusPlayerState:SetPlayerHeight(NewPlayerHeight) end
---@param NewPlayerHeight float
function ARadiusPlayerState:Server_SetPlayerHeight(NewPlayerHeight) end
function ARadiusPlayerState:OnRep_PlayerHeight() end
---@return float
function ARadiusPlayerState:GetPlayerHeight() end


---@class ARadiusPlayerStateGameplay : ARadiusPlayerState
ARadiusPlayerStateGameplay = {}


---@class ARadiusProjectile : AActor
---@field AutoDisposeTime float
---@field DamageDisposeTime float
ARadiusProjectile = {}

function ARadiusProjectile:Dispose() end


---@class ARadiusSpawnGroup : AActor
---@field RequiredConditions FConditionsList
---@field bShouldWaitTideToGenerate boolean
---@field BillboardTexture TSoftObjectPtr<UTexture2D>
---@field AttachedSpawners TArray<AActor>
---@field AttachedPoints TArray<ASpawnPoint>
---@field SpawnerUniqueId FString
---@field GroupID uint8
ARadiusSpawnGroup = {}

function ARadiusSpawnGroup:CollectAttachedSpawners() end


---@class ARadiusTeleportArcController : AActor
ARadiusTeleportArcController = {}

---@param DeltaSeconds float
function ARadiusTeleportArcController:TickArc(DeltaSeconds) end


---@class ARadiusTimeController : AActor
---@field LevelSequencer ALevelSequenceActor
---@field Replicator ARadiusGameDataReplicator
---@field DebugTimeScale float
ARadiusTimeController = {}

---@param Scale float
function ARadiusTimeController:SetDebugTimeScale(Scale) end
---@param bEnable boolean
function ARadiusTimeController:SetClockEnable(bEnable) end
function ARadiusTimeController:OnGameTimeRefresh() end
---@param AddedSeconds float
function ARadiusTimeController:OnGameTimeChanged(AddedSeconds) end


---@class ARadiusTutorial : AActor
---@field bIsEnabled boolean
---@field TriggerSize FVector
---@field Conditions FConditionsList
---@field TutorialSteps TArray<ARadiusTutorialStep>
---@field bIsRunning boolean
---@field CurrentStepIndex int32
ARadiusTutorial = {}

function ARadiusTutorial:StopTutorial() end
function ARadiusTutorial:RunTutorial() end
function ARadiusTutorial:Disable() end


---@class ARadiusTutorialStep : AActor
ARadiusTutorialStep = {}

function ARadiusTutorialStep:Stop() end
---@param TutorSection ARadiusTutorial
function ARadiusTutorialStep:Prepare(TutorSection) end
function ARadiusTutorialStep:Execute() end


---@class ASpawnPoint : AActor
---@field bShouldWaitTideToGenerate boolean
---@field AdditionalTags TArray<FGameplayTag>
---@field RequiredConditions FConditionsList
---@field BillboardTexture TSoftObjectPtr<UTexture2D>
---@field PointUniqueId FString
---@field GroupID uint8
ASpawnPoint = {}



---@class ASubtitlesBase : AActor
---@field SubtitlesWidget USubtitlesWidget
---@field CameraComponent USceneComponent
ASubtitlesBase = {}

---@param bAutosave boolean
function ASubtitlesBase:ShowSave(bAutosave) end
---@param SubtitleInstigator ESubtitleInstigator
---@param Message FText
---@param Duration float
function ASubtitlesBase:Show(SubtitleInstigator, Message, Duration) end
---@param CameraComponent USceneComponent
function ASubtitlesBase:SetCameraToFollow(CameraComponent) end
function ASubtitlesBase:Hide() end
---@return USubtitlesWidget
function ASubtitlesBase:GetSubtitlesWidget() end


---@class AVantageCoverManager : AActor
---@field CoverVolumeInfos TMap<AActor, FCoverVolumeInfo>
---@field HeightVolumeInfos TMap<AActor, FCoverVolumeInfo>
---@field HeightVolumes TArray<AVolume>
---@field VantageVolumes TArray<AVolume>
AVantageCoverManager = {}



---@class FAIFactorClasses
---@field NPCState ENPCState
---@field AIFactorsClasses TArray<TSubclassOf<UAIFactor>>
FAIFactorClasses = {}



---@class FAIFactors
---@field AIFactors TArray<UAIFactor>
FAIFactors = {}



---@class FAISightDebug
---@field bShowMainCloseZone boolean
---@field bShowMainFarZone boolean
---@field bShowPeripheralOuterZone boolean
---@field bShowPeripheralInnerZone boolean
---@field bShowTraces boolean
FAISightDebug = {}



---@class FAccuracyParameters
---@field AccuracyMax float
---@field AccuracyMultiplier float
---@field AccuracyDurabilityCoefficient float
FAccuracyParameters = {}



---@class FActionRenderInfo
---@field SoundVariationsNumMap TMap<FGameplayTag, int32>
---@field MetaSoundSource USoundBase
---@field CooldownTime float
---@field RandCooldownTimeDeviation float
FActionRenderInfo = {}



---@class FActionRenderReplicationInfo
---@field ActionTag FGameplayTag
---@field RandSoundsArrayIndex int32
FActionRenderReplicationInfo = {}



---@class FActorsArray
---@field Actors TArray<AActor>
---@field InUseFlags TArray<boolean>
---@field WorldContext UObject
FActorsArray = {}



---@class FAggroInfo
---@field ReduceAggroTimerFrequency float
---@field ReducePointsPerSec float
---@field PreAggroReductionDelayTime float
FAggroInfo = {}



---@class FAmmoContainerData
---@field Ammo TArray<FGameplayTag>
---@field ChamberAmmo FGameplayTag
FAmmoContainerData = {}



---@class FAmmoContainerParameters
---@field AcceptedAmmoTypes TArray<FGameplayTag>
---@field ChamberCapacity int32
---@field HolderCapacity int32
---@field MaxVisibleAmmo int32
---@field DurabilityDamagePerAmmo float
---@field CapacityDurabilityCoefficient float
---@field DamageToReliability float
FAmmoContainerParameters = {}



---@class FAmmoContainerStaticData : FRadiusItemStaticData
---@field IgnoreChamberCountInInspect boolean
---@field Parameters FAmmoContainerParameters
---@field PossibleUpgrades TArray<FGameplayTag>
FAmmoContainerStaticData = {}



---@class FAmmoStaticData : FRadiusItemStaticData
---@field AmmoTypeID FGameplayTag
---@field AmmoType FGameplayTag
---@field BulletShellMesh TSoftObjectPtr<UStaticMesh>
---@field AmmoWholeMesh TSoftObjectPtr<UStaticMesh>
---@field BulletFleshDamage float
---@field AmmoFleshDamageCurve TSoftObjectPtr<UCurveFloat>
---@field BulletArmorDamage float
---@field AmmoArmorDamageCurve TSoftObjectPtr<UCurveFloat>
---@field BulletInitialVelocity float
---@field SpeedDropCurve TSoftObjectPtr<UCurveFloat>
---@field BulletCritChance float
---@field CriticalDamageMultiplier float
---@field ArmorIgnoreChance float
---@field AmmoPenetration float
---@field PenetrableMaterials TArray<TSoftObjectPtr<UObject>>
---@field BulletBounceMax int32
---@field AmmoLoudnessModifier float
---@field AmmoAccuracyModifier float
---@field AmmoWeaponDurabilityModifier float
---@field DisplayAmmoReliabilityModifier float
---@field AmmoRecoilModifier FVector
---@field DisplayAmmoRecoilModifier float
---@field ShellEjectVelocity FVector
---@field AmmoFlatness int32
---@field WeaponDurabilityDamage int32
FAmmoStaticData = {}



---@class FAnomalyConfig
---@field ActorClass TSoftClassPtr<UObject>
FAnomalyConfig = {}



---@class FAnomalySpawnData
FAnomalySpawnData = {}


---@class FArtefactNestInfo : FTableRowBase
---@field NestType FGameplayTag
---@field NestClass TSubclassOf<AActor>
---@field NestName FText
---@field Description FText
FArtefactNestInfo = {}



---@class FArtefactSpawnPointData
---@field PointId FString
---@field NestUniqueId FString
---@field NestTag FGameplayTag
---@field ArtefactTag FGameplayTag
FArtefactSpawnPointData = {}



---@class FArtefactSpawnPointDataContainer
---@field PointData TArray<FArtefactSpawnPointData>
FArtefactSpawnPointDataContainer = {}



---@class FAttachableItemInfo
---@field ItemTypeID FGameplayTag
---@field ParentIndex int32
---@field SlotID FGameplayTag
---@field TransformInContainer FTransform
---@field ItemConfiguration FItemConfiguration
FAttachableItemInfo = {}



---@class FAttachmentSlotStaticData : FRadiusItemStaticData
---@field TypeID FGameplayTag
---@field Icon UTexture2D
---@field Description FText
FAttachmentSlotStaticData = {}



---@class FAttachmentStaticData : FRadiusItemStaticData
---@field InfoParametersChange TMap<EWeaponInfoParameter, int32>
---@field AccuracyParametersChange FAccuracyParameters
---@field RecoilParametersChange FRecoilParameters
---@field WeaponParametersChange FWeaponParameters
FAttachmentStaticData = {}



---@class FBBRawData
---@field RawBBValue TArray<uint8>
FBBRawData = {}



---@class FBallLightningAnomalyIsHidden
---@field bIsHidden boolean
---@field bIsInstant boolean
FBallLightningAnomalyIsHidden = {}



---@class FBodyTurningConfig
---@field UpperBodyTurningToleranceAngle float
---@field LowerBodyTurningToleranceAngle float
---@field UpperBodyTurningSpeed float
---@field LowerBodyTurningSpeed float
FBodyTurningConfig = {}



---@class FCentralVisionInfo
---@field Idle FSightShapeInfo
---@field Combat FSightShapeInfo
FCentralVisionInfo = {}



---@class FComponent_And_Transform
---@field Transform FTransform
---@field PrimitiveComponent UPrimitiveComponent
FComponent_And_Transform = {}



---@class FConditionsList
---@field Conditions TArray<URadiusCondition>
FConditionsList = {}



---@class FCoverVolumeInfo
FCoverVolumeInfo = {}


---@class FCreepAmbushConfig
---@field Transform FTransform
---@field EnterLocation FVector
FCreepAmbushConfig = {}



---@class FCreepAmbushData
---@field Ambushes TArray<FCreepAmbushConfig>
FCreepAmbushData = {}



---@class FCreepAmbushInfo
---@field Idx int32
---@field Transform FTransform
---@field EnterLocation FVector
---@field Controller AController
FCreepAmbushInfo = {}



---@class FDifficultyConfigBool
---@field Tag FGameplayTag
---@field DefaultValue FGameplayTag
---@field IsOn FDifficultyOptionBool
---@field IsOff FDifficultyOptionBool
FDifficultyConfigBool = {}



---@class FDifficultyConfigFloat
---@field Tag FGameplayTag
---@field DefaultValue FGameplayTag
---@field Values TArray<FDifficultyOptionFloat>
FDifficultyConfigFloat = {}



---@class FDifficultyOptionBool
---@field Tag FGameplayTag
---@field Name FText
---@field Value boolean
FDifficultyOptionBool = {}



---@class FDifficultyOptionFloat
---@field Tag FGameplayTag
---@field Name FText
---@field Value float
FDifficultyOptionFloat = {}



---@class FDistanceGripCandidate
---@field Actor AGrippableStaticMeshActor
---@field Component UPrimitiveComponent
FDistanceGripCandidate = {}



---@class FEnemyInfo
FEnemyInfo = {}


---@class FFirearm
---@field FireRateSingle float
---@field FireRateBurst float
---@field FireDuration float
---@field ShotsPerBurstDeviationMax int32
---@field ShotsPerBurstMax int32
---@field ShotsPerBurstCurve UCurveFloat
---@field BurstFireDistThreshold float
---@field bIsAutomatic boolean
---@field BrakeBetweenBursts float
---@field bCanFireInMove boolean
---@field BulletSpreadHalfAngleMin float
---@field BulletSpreadHalfAngleMax float
---@field CrouchDistRange FFloatRange
---@field BestAttackDistance float
---@field OptimalAttackRangeThreshold float
---@field MaxAmmoInClip int32
---@field AmmoInClipToReloadRatio float
---@field FireSound USoundBase
FFirearm = {}



---@class FGameplayTagsTuple
---@field First FGameplayTag
---@field Second FGameplayTag
FGameplayTagsTuple = {}



---@class FGripOverlap
---@field ActorTransform FTransform
---@field GrippingPairs TMap<FGameplayTag, FLockPair>
---@field bIsDistanceGrip boolean
---@field bIsDistanceLocked boolean
---@field bIsCurrentlyGripped boolean
---@field bIsDistanceLerping boolean
---@field bIsClimbing boolean
---@field bIsDetachGrip boolean
FGripOverlap = {}



---@class FGrippingPair
---@field GripObject UObject
---@field GripSocket URadiusHandSocketComponent
FGrippingPair = {}



---@class FGroupEnemiesInfo
---@field EnemyInfos TMap<AActor, FEnemyInfo>
FGroupEnemiesInfo = {}



---@class FGroupSpawnData
---@field GroupID FString
---@field ResetOnTide boolean
---@field SpawnerIds TArray<FString>
FGroupSpawnData = {}



---@class FGroupSpawnDataContainer
---@field SpawnData TArray<FGroupSpawnData>
FGroupSpawnDataContainer = {}



---@class FIDsList
---@field InstanceIDs TArray<FString>
FIDsList = {}



---@class FItemConfiguration
---@field bShopItem boolean
---@field UniqueID FString
---@field StartDurabilityRatio float
---@field StackAmount int32
---@field CustomContentTypeID FGameplayTag
---@field AdditionalTags TArray<FGameplayTag>
FItemConfiguration = {}



---@class FItemContainerData
---@field ContainerType ERadiusItemContainerType
---@field InstanceID FString
---@field ParentInstanceID FString
---@field ParentContainerRelativeTransform FTransform
---@field ContainerObject TSoftObjectPtr<UObject>
FItemContainerData = {}



---@class FItemParameters
---@field MeshOverride UStaticMesh
---@field Weight float
---@field WeightCapacity float
---@field Durability float
---@field DurabilityDamageCoefficient float
---@field DurabilityDamagePerHour float
FItemParameters = {}



---@class FItemShopInfo
---@field SellPriceOverride int32
---@field BuyPrice int32
---@field ItemTransformInSlot FTransform
---@field RepairPricePerPercent float
---@field RepairSecondsPerPercent float
---@field RequiredPlayerLevel int32
FItemShopInfo = {}



---@class FLevelConfig
---@field LevelName FText
---@field LevelRef TSoftObjectPtr<UWorld>
---@field bAutosave boolean
---@field bSaveOnEnter boolean
---@field TimeScale float
FLevelConfig = {}



---@class FLevelMissionPoints
---@field Points TMap<FGameplayTag, FMissionPoint>
FLevelMissionPoints = {}



---@class FLockPair
---@field HandSocket URadiusHandSocketComponent
---@field bIsLocked boolean
FLockPair = {}



---@class FLootCategory
---@field CategoryTag FGameplayTag
---@field LootPoints int32
FLootCategory = {}



---@class FLootSpawnGroupData
---@field GroupID FString
---@field SpawnedPoints TArray<FString>
FLootSpawnGroupData = {}



---@class FLootSpawnGroupDataContainer
---@field SpawnData TArray<FLootSpawnGroupData>
FLootSpawnGroupDataContainer = {}



---@class FLootSpawnPointData
---@field PointId FString
---@field Items TArray<FLootToSpawn>
---@field bShouldBeDisabled boolean
FLootSpawnPointData = {}



---@class FLootSpawnPointDataContainer
---@field PointData TArray<FLootSpawnPointData>
FLootSpawnPointDataContainer = {}



---@class FLootTableConfig
---@field Conditions TArray<URadiusCondition>
---@field LootPoints int32
---@field LootTable UDataTable
---@field DifficultyModifiers TMap<FGameplayTag, int32>
---@field ExcludeGeneration boolean
FLootTableConfig = {}



---@class FLootTableRow : FTableRowBase
---@field ItemTag FGameplayTag
---@field CategoryTag FGameplayTag
---@field LootPoints int32
---@field RandomizeDurability boolean
---@field RandomDurability FMinMaxFloat
---@field RandomizeAmmo boolean
---@field RandomAmmo FMinMaxInt
---@field AmmoType FGameplayTag
---@field ConfigTags TArray<FGameplayTag>
FLootTableRow = {}



---@class FLootToSpawn
---@field ItemTag FGameplayTag
---@field ItemConfiguration FItemConfiguration
FLootToSpawn = {}



---@class FMantle_Asset
---@field AnimMontage UAnimMontage
---@field PositionOrCorrectionCurve UCurveVector
---@field StartingOffset FVector
---@field LowHeight float
---@field LowPlayRate float
---@field LowStartPosition float
---@field HighHeight float
---@field HighPlayRate float
---@field HighStartPosition float
FMantle_Asset = {}



---@class FMantle_Params
---@field AnimMontage UAnimMontage
---@field PositionOrCorrectionCurve UCurveVector
---@field StartingPosition float
---@field PlayRate float
---@field StartingOffset FVector
FMantle_Params = {}



---@class FMantle_Trace_Settings
---@field MaxLedgeHeight float
---@field MinLedgeHeight float
---@field ReachDistance float
---@field ForwardTraceRadius float
---@field DownwardTraceRadius float
FMantle_Trace_Settings = {}



---@class FMapConfig
---@field LevelCenterLocation FVector
---@field OrthoWidth float
---@field MapMaterial TSoftObjectPtr<UMaterialInstance>
---@field MarkerPoints TArray<FMarkerPointConfig>
FMapConfig = {}



---@class FMarkerConfig
---@field PointTag FGameplayTag
---@field DisplayName FText
---@field DisplayText TArray<FText>
---@field Color FLinearColor
---@field TextColor FLinearColor
---@field BackgroundColor FLinearColor
---@field Icon TSoftObjectPtr<UTexture2D>
---@field VisibilityThreshold FMinMaxFloat
---@field ThumbnailThreshold FMinMaxFloat
---@field TextShowThreshold FMinMaxFloat
---@field RadiusShowThreshold FMinMaxFloat
---@field PointRadius float
---@field ScaleMultiplier float
FMarkerConfig = {}



---@class FMarkerPointConfig
---@field PointTag FGameplayTag
---@field AdditionalDisplayText TArray<FText>
---@field PointTransform FTransform
FMarkerPointConfig = {}



---@class FMinMaxFloat
---@field Min float
---@field Max float
FMinMaxFloat = {}



---@class FMinMaxInt
---@field Min int32
---@field Max int32
FMinMaxInt = {}



---@class FMinMaxVector
---@field X FMinMaxFloat
---@field Y FMinMaxFloat
---@field Z FMinMaxFloat
FMinMaxVector = {}



---@class FMissionCategory
---@field MissionCategoryID FGameplayTag
---@field MaxActiveMissions int32
---@field IconColor FLinearColor
---@field Conditions TArray<URadiusCondition>
---@field MissionConfigurations TArray<USingleMissionConfig>
FMissionCategory = {}



---@class FMissionPoint
---@field PointTag FGameplayTag
---@field PointTransform FTransform
---@field PointRadius float
FMissionPoint = {}



---@class FMissionReward
---@field AccessLevelPoints int32
---@field AccessLevelUp boolean
---@field RewardItemTags TArray<FGameplayTag>
---@field Money int32
FMissionReward = {}



---@class FMovementSettings
---@field WalkSpeed float
---@field RunSpeed float
---@field SprintSpeed float
---@field MovementCurve UCurveVector
---@field RotationRateCurve UCurveFloat
FMovementSettings = {}



---@class FMovementSettingsStance
---@field Standing FMovementSettings
---@field Crouching FMovementSettings
FMovementSettingsStance = {}



---@class FMovementSettingsState : FTableRowBase
---@field VelocityDirection FMovementSettingsStance
---@field LookingDirection FMovementSettingsStance
---@field Aiming FMovementSettingsStance
FMovementSettingsState = {}



---@class FMovementSpeed
---@field Combat float
---@field NonCombat float
FMovementSpeed = {}



---@class FNPCCombatStateStaticData
---@field AttackDistRange FFloatRange
---@field Damage float
---@field LastKnowPositionAttackTime FFloatRange
---@field DefensiveDistance float
---@field CrouchWeaponHeight float
---@field StandWeaponHeight float
---@field CoverRightPeekModifier float
---@field CoverLeftPeekModifier float
FNPCCombatStateStaticData = {}



---@class FNPCCoordinationInfo
FNPCCoordinationInfo = {}


---@class FNPCIdleStateStaticData
---@field RotationRange FMinMaxFloat
---@field WaitBetweenRotations float
---@field bShouldPatrol boolean
FNPCIdleStateStaticData = {}



---@class FNPCSightStaticData
---@field CentralVision FCentralVisionInfo
---@field PeripheralVision FPeripheralVisionInfo
---@field SightPointFootOffset FVector
---@field FriendDeathSpotDistModifier float
---@field CrouchTargetSpotDistMultiplier float
---@field LightSourceOnDistanceMultiplier float
---@field DaytimeVisibilityDistCurve UCurveFloat
---@field FullBodyTargetSpotTimeMultiplier float
---@field MinTracesNumNonBlockedForFullBody int32
---@field NoVisibilitySpotTimeMultiplier float
---@field LightSourceOnSpotTimeMultiplier float
---@field DaytimeVisibilitySpotTimeCurve UCurveFloat
FNPCSightStaticData = {}



---@class FNPCStatsStaticData
---@field InitialHealth float
FNPCStatsStaticData = {}



---@class FNpcSpawnData
FNpcSpawnData = {}


---@class FPIDConfig
---@field Controller UGripMotionControllerComponent
---@field PhysicsHand USkeletalMeshComponent
---@field Shift FTransform
---@field ItemGripRelativeLocation FVector
---@field ItemGripRelativeRotation FQuat
---@field GripConstraint UPhysicsConstraintComponent
---@field GrabSphere USphereComponent
---@field LastFrameForce FVector
---@field LastFrameTorque FVector
---@field bInstantMovementRequested boolean
---@field bIsPidOn boolean
---@field LastFrameOptionalForce FVector
---@field LastFrameOptionalTorque FVector
---@field OptionalPrimitive UPrimitiveComponent
---@field HandSocket URadiusHandSocketComponent
---@field LerpAlpha float
FPIDConfig = {}



---@class FPeripheralVisionInfo
---@field MainZoneIdle FSightShapeInfo
---@field MainZoneCombat FSightShapeInfo
---@field SideZoneIdle FSightShapeInfo
---@field SideZoneCombat FSightShapeInfo
FPeripheralVisionInfo = {}



---@class FPointSpawnData
---@field SpawnerId FString
---@field ResetOnTide boolean
---@field RequiredTags TMap<FGameplayTag, boolean>
---@field RequiredMissions TMap<FGameplayTag, boolean>
---@field SpawnTags TArray<FGameplayTag>
FPointSpawnData = {}



---@class FPointSpawnDataContainer
---@field PointData TArray<FPointSpawnData>
FPointSpawnDataContainer = {}



---@class FPoolActorConfig
---@field ActorClass TSubclassOf<AActor>
---@field InitCount int32
---@field MaxCount int32
FPoolActorConfig = {}



---@class FProfileInfo
---@field ProfileNr int32
---@field bSinglePlayer boolean
---@field DateTime FDateTime
---@field RealPlayTime int32
---@field TimeSpentMinutes int32
---@field Money int32
---@field GuestPlayers TArray<FString>
FProfileInfo = {}



---@class FPropsCache
FPropsCache = {}


---@class FRadiusAINoiseEvent
---@field NoiseLocation FVector
---@field Loudness float
---@field MaxRange float
---@field Instigator AActor
---@field Tag FName
FRadiusAINoiseEvent = {}



---@class FRadiusAISightEvent
---@field SeenActor AActor
---@field Observer AActor
FRadiusAISightEvent = {}



---@class FRadiusAITeamStimulusEvent
---@field Broadcaster AActor
---@field Enemy AActor
FRadiusAITeamStimulusEvent = {}



---@class FRadiusAnomalyGameData
---@field SpawnerUniqueId FString
---@field AnomalyUniqueId FString
---@field Tag FGameplayTag
---@field Transform FTransform
---@field AnomalyActorRef TSoftObjectPtr<AActor>
FRadiusAnomalyGameData = {}



---@class FRadiusAnomalyGameDataContainer
---@field AnomalySaveData TArray<FRadiusAnomalyGameData>
FRadiusAnomalyGameDataContainer = {}



---@class FRadiusDynDataEntry : FFastArraySerializerItem
---@field Entry URadiusItemDynamicData
FRadiusDynDataEntry = {}



---@class FRadiusDynDataList : FFastArraySerializer
---@field Entries TArray<FRadiusDynDataEntry>
---@field OwningRepActor AActor
FRadiusDynDataList = {}



---@class FRadiusImpactAssetRow : FTableRowBase
---@field PhysicalMaterial TSoftObjectPtr<UPhysicalMaterial>
---@field Particle UParticleSystem
---@field ParticleScale float
---@field Decal UMaterialInstance
---@field DecalScale float
---@field Sound USoundBase
---@field SoundDelay float
---@field VolumeMulti float
FRadiusImpactAssetRow = {}



---@class FRadiusItemStaticData : FTableRowBase
---@field ItemName FText
---@field ItemDescription FText
---@field ItemId FGameplayTag
---@field ItemActor TSoftClassPtr<AActor>
---@field ItemDurability float
---@field DurabilityIndependentOfDifficulty boolean
---@field DurabilityDamageMultiplier float
---@field DestroyOnZeroDurability boolean
---@field ItemWeight float
---@field ItemWeightCapacity float
---@field ItemPurchasePrice float
---@field ItemSellPrice float
---@field ItemPreviewImage TSoftObjectPtr<UTexture2D>
---@field DamageResistances TMap<EDamageCategory, float>
---@field NutritionalValue float
FRadiusItemStaticData = {}



---@class FRadiusLosslessItem
---@field ItemTypeID FGameplayTag
---@field ItemInstanceID FString
FRadiusLosslessItem = {}



---@class FRadiusMissionEntry : FFastArraySerializerItem
---@field Entry UAvailableMission
FRadiusMissionEntry = {}



---@class FRadiusMissionList : FFastArraySerializer
---@field MissionEntries TArray<FRadiusMissionEntry>
---@field OwningRepActor AActor
FRadiusMissionList = {}



---@class FRadiusMissionObjectiveEntry : FFastArraySerializerItem
---@field Entry URadiusMissionObjectiveBase
FRadiusMissionObjectiveEntry = {}



---@class FRadiusMissionObjectiveList : FFastArraySerializer
---@field ObjectiveEntries TArray<FRadiusMissionObjectiveEntry>
---@field OwningRepActor AActor
FRadiusMissionObjectiveList = {}



---@class FRadiusNPCStaticData : FTableRowBase
---@field NPCName FText
---@field ID FGameplayTag
---@field ActorClass TSoftClassPtr<UObject>
---@field StimuliIgnored FGameplayTagContainer
---@field SightData FNPCSightStaticData
---@field StatsData FNPCStatsStaticData
---@field IdleStateData FNPCIdleStateStaticData
---@field CombatStateData FNPCCombatStateStaticData
---@field ActionRenderInfo FActionRenderInfo
---@field Firearm FFirearm
---@field MovementSpeed FMovementSpeed
---@field BlackboardAsset UBlackboardData
---@field HTNAsset UHTN
FRadiusNPCStaticData = {}



---@class FRadiusNpcGameData
---@field SpawnerUniqueId FString
---@field Tag FGameplayTag
---@field Transform FTransform
---@field GroupID uint8
---@field Health float
---@field Aggro float
---@field BBDataMap TMap<FName, FBBRawData>
---@field NPCActorRef TSoftObjectPtr<AActor>
FRadiusNpcGameData = {}



---@class FRadiusNpcGameDataContainer
---@field NpcSaveData TArray<FRadiusNpcGameData>
FRadiusNpcGameDataContainer = {}



---@class FRadiusPlayerGameData
---@field PlayerID FUniqueNetIdRepl
---@field PlayerName FString
---@field InGameID uint8
---@field SaveLevelTag FGameplayTag
---@field PlayerTransform FTransform
---@field CurrentHealth float
---@field CurrentStamina float
---@field CurrentSatiety float
FRadiusPlayerGameData = {}



---@class FRadiusSavedItem
---@field ItemType FGameplayTag
---@field InstanceUid FString
---@field ContainerInstanceUid FString
---@field ContainerRelativeTransform FTransform
---@field Durability float
---@field AdditionalTags TArray<FGameplayTag>
---@field Upgrades TArray<FGameplayTag>
---@field ContainingItemTagsStack TArray<FGameplayTag>
---@field ContainingShellsInStack TArray<boolean>
---@field bWeaponCocked boolean
FRadiusSavedItem = {}



---@class FRadiusSerializedObject
---@field ObjectClass UClass
---@field SerializeData TArray<uint8>
---@field NestedIndex TArray<int32>
FRadiusSerializedObject = {}



---@class FRadiusSplashDesc
---@field Transform FTransform
---@field QuadSize FVector2D
---@field UVRect FBox2D
---@field DeltaRotation FQuat
---@field bIgnoreAlpha boolean
---@field bIsDynamic boolean
---@field bIsExternal boolean
---@field Texture UTexture
FRadiusSplashDesc = {}



---@class FRadiusTimeData
---@field SaveDateTime FDateTime
---@field GameRealTimeTicks uint64
---@field GameRealTicks uint64
---@field LastTideRealTicks uint64
FRadiusTimeData = {}



---@class FRandomSounds
---@field Sounds TArray<USoundBase>
FRandomSounds = {}



---@class FRecoilParameters
---@field MultVerticalRecoil float
---@field MultHorizontalRecoil float
---@field MultForwardRecoil float
---@field StabilizedVerticalRecoil FMinMaxFloat
---@field StabilizedHorizontalRecoil FMinMaxFloat
---@field StabilizedForwardRecoil FMinMaxFloat
---@field RecoilAutoFireCoefficient float
---@field RecoilDecayRate float
---@field StabilizedRecoilDecayRate float
---@field DisplayRecoil float
FRecoilParameters = {}



---@class FSaveInfo
---@field SaveNr int32
---@field bAutosave boolean
---@field DateTime FDateTime
---@field RealPlayTime int32
---@field TimeSpentMinutes int32
---@field Money int32
---@field LevelTag FGameplayTag
---@field SingleGameID FString
---@field CoopGameID FString
FSaveInfo = {}



---@class FSensePriorityInfo
---@field SenseClass TSubclassOf<UAISense>
---@field ValueOfFullSense float
FSensePriorityInfo = {}



---@class FSightShapeInfo
---@field ZoneDistance float
---@field HorizontalAngle float
---@field VerticalAngle float
---@field ZoneDetectTime FMinMaxFloat
---@field DetectTimeCurve UCurveFloat
FSightShapeInfo = {}



---@class FSpawnGroupConfig
---@field MaxActivatedNum int32
FSpawnGroupConfig = {}



---@class FSpawnPointConfig
---@field SpawnConfig TMap<FGameplayTag, int32>
---@field MaxSpawnedCount int32
---@field SpawnDelay FMinMaxFloat
FSpawnPointConfig = {}



---@class FStateTransitionInfo
---@field Tag FGameplayTag
---@field From ENPCState
---@field To ENPCState
FStateTransitionInfo = {}



---@class FStimuliData : FTableRowBase
---@field ID FGameplayTag
---@field StimuliWeight float
---@field StimulusModifier float
---@field AggroPoints float
---@field MaxState ENPCState
---@field MaxDistance float
---@field IgnoredInStates TArray<ENPCState>
---@field StimuliToOverride FGameplayTagContainer
FStimuliData = {}



---@class FSubtitleInstigatorData : FTableRowBase
---@field InstigatorName FText
FSubtitleInstigatorData = {}



---@class FTagToTagTuplesList
---@field Tag FGameplayTag
---@field List TArray<FGameplayTagsTuple>
FTagToTagTuplesList = {}



---@class FTagToTagsList
---@field Tag FGameplayTag
---@field List TArray<FGameplayTag>
FTagToTagsList = {}



---@class FTagToTransformsList
---@field List TMap<FGameplayTag, FTransform>
FTagToTransformsList = {}



---@class FTargetInfo
FTargetInfo = {}


---@class FTeleportPointInfo
---@field Location FVector
---@field HitResult FHitResult
FTeleportPointInfo = {}



---@class FTransformArray : FTableRowBase
---@field Transforms TArray<FTransform>
FTransformArray = {}



---@class FTransformsTuple
---@field First FTransform
---@field Second FTransform
FTransformsTuple = {}



---@class FUpgradeStaticData : FRadiusItemStaticData
---@field UpgradeID FGameplayTag
---@field ConflictUpgradeIDs TArray<FGameplayTag>
---@field RequiredUpgradeIDs TArray<FGameplayTag>
---@field Icon UTexture2D
---@field InstallPrice int32
---@field ShowInInfo boolean
---@field InfoParametersChange TMap<EWeaponInfoParameter, int32>
---@field ItemPricesChange FItemShopInfo
---@field ItemParametersChange FItemParameters
---@field AccuracyParametersChange FAccuracyParameters
---@field RecoilParametersChange FRecoilParameters
---@field WeaponParametersChange FWeaponParameters
---@field AmmoContainerParametersChange FAmmoContainerParameters
FUpgradeStaticData = {}



---@class FVisitedCoopGame
---@field GameID FString
---@field HostID FString
---@field HostName FString
---@field LastPlayed FDateTime
---@field bSameVersion boolean
FVisitedCoopGame = {}



---@class FWeaponParameters
---@field InternalMagCapacity int32
---@field FleshDamageModifier float
---@field BulletInitialVelocityModifier float
---@field FireRate float
---@field ShotLoudness float
FWeaponParameters = {}



---@class FWeaponStaticData : FRadiusItemStaticData
---@field AmmoCaliber FGameplayTag
---@field bIsSemiAuto boolean
---@field FireModes TArray<FGameplayTag>
---@field BurstModeCount int32
---@field bUseVirtualStock boolean
---@field bDisableSmoothing boolean
---@field DurabilityDamageAutoFireCoefficient float
---@field DurabilityToJamChance TSoftClassPtr<UCurveFloat>
---@field WeaponParameters FWeaponParameters
---@field bCockedOnSafety boolean
---@field DisplayReliability float
---@field RecoilParameters FRecoilParameters
---@field bAimSmoothing boolean
---@field AimSmoothingAlpha float
---@field AimSmoothingDistance float
---@field AccuracyParameters FAccuracyParameters
---@field PossibleUpgrades TArray<FGameplayTag>
---@field PossibleParts TArray<FGameplayTag>
FWeaponStaticData = {}



---@class IArtefactNestInterface : IInterface
IArtefactNestInterface = {}

---@param UniqueID FString
function IArtefactNestInterface:SetUniqueId(UniqueID) end
---@param Data URadiusArtefactNestSaveData
function IArtefactNestInterface:LoadFromData(Data) end
---@return boolean
function IArtefactNestInterface:HasArtefact() end
---@return FString
function IArtefactNestInterface:GetUniqueId() end
---@return URadiusArtefactNestSaveData
function IArtefactNestInterface:GetSaveData() end
---@return int32
function IArtefactNestInterface:GetNestLevel() end
function IArtefactNestInterface:GenerateUniqueId() end


---@class IGripSelectorsInterface : IInterface
IGripSelectorsInterface = {}

---@param Hand EVRHand
---@param Distance boolean
function IGripSelectorsInterface:ShowSelector(Hand, Distance) end
---@param Hand EVRHand
function IGripSelectorsInterface:HideSelector(Hand) end
function IGripSelectorsInterface:HideAllSelectors() end


---@class IHMDTransformInterface : IInterface
IHMDTransformInterface = {}

---@return FTransform
function IHMDTransformInterface:GetRightHandTransform() end
---@return FTransform
function IHMDTransformInterface:GetLeftHandTransform() end
---@return FTransform
function IHMDTransformInterface:GetHeadTransform() end
---@return FTransform
function IHMDTransformInterface:GetBodyRootTransform() end


---@class IItemContainerInterface : IInterface
IItemContainerInterface = {}

---@param ItemActor AActor
function IItemContainerInterface:StartHolstering(ItemActor) end
---@return boolean
function IItemContainerInterface:ShouldChangeCollisionOnAttach() end
---@param bIsHighlight boolean
---@param Hand EVRHand
---@param Item ARadiusItemBase
function IItemContainerInterface:SetHighlight(bIsHighlight, Hand, Item) end
---@param ItemActor AActor
---@return boolean
function IItemContainerInterface:PutItemToContainer(ItemActor) end
---@param ParentContainerUid FString
---@param Transform FTransform
function IItemContainerInterface:PlaceInsideContainer(ParentContainerUid, Transform) end
---@param DistanceToItem float
---@param ItemActor AActor
---@return boolean
function IItemContainerInterface:IsWithinDistance(DistanceToItem, ItemActor) end
---@param ItemTag FGameplayTag
---@return boolean
function IItemContainerInterface:IsSuitableByTags(ItemTag) end
---@return boolean
function IItemContainerInterface:IsContainerValid() end
---@param MotionController UGripMotionControllerComponent
---@return boolean
function IItemContainerInterface:IsAvailable(MotionController) end
---@param ItemActor AActor
function IItemContainerInterface:InstantHolsterActor(ItemActor) end
---@return FTransform
function IItemContainerInterface:GetTransformRelativeToParent() end
---@return int32
function IItemContainerInterface:GetPriority() end
---@return UObject
function IItemContainerInterface:GetParentContainerObject() end
---@return APawn
function IItemContainerInterface:GetItemOwningPawn() end
---@return TArray<AActor>
function IItemContainerInterface:GetHolstered() end
---@return USceneComponent
function IItemContainerInterface:GetContainerSceneComponent() end
---@return FString
function IItemContainerInterface:GetContainerID() end
---@return FGameplayTagContainer
function IItemContainerInterface:GetAllowedGripTags() end
---@param ItemActor AActor
---@return boolean
function IItemContainerInterface:DropHolsteredActor(ItemActor) end
---@return TArray<AActor>
function IItemContainerInterface:DropHolstered() end
---@return boolean
function IItemContainerInterface:CanBeArmored() end
---@param GripTags FGameplayTagContainer
---@param MotionController UGripMotionControllerComponent
---@return boolean
function IItemContainerInterface:AllowsGripping(GripTags, MotionController) end
function IItemContainerInterface:AddContainerToGameData() end


---@class ILootGenerateInterface : IInterface
ILootGenerateInterface = {}

---@param LootTableConfig FLootTableConfig
---@param Excluded TArray<FName>
---@return int32
function ILootGenerateInterface:Generate(LootTableConfig, Excluded) end


---@class IPhysicalHandInterface : IInterface
IPhysicalHandInterface = {}

---@param bIsRight boolean
function IPhysicalHandInterface:SetIsRight(bIsRight) end
---@param bIsPointing boolean
function IPhysicalHandInterface:SetIsPointingUI(bIsPointing) end
---@param HandState FGameplayTag
function IPhysicalHandInterface:SetHandState(HandState) end
---@param GripAlpha double
---@param TriggerAlpha double
---@param TriggerTouch boolean
function IPhysicalHandInterface:SetAlphaValues(GripAlpha, TriggerAlpha, TriggerTouch) end
---@param bIsRight boolean
---@param HandState FGameplayTag
---@param GripAlpha double
---@param TriggerAlpha double
---@param TriggerTouch boolean
---@param IsPointingUi boolean
function IPhysicalHandInterface:GetHandValues(bIsRight, HandState, GripAlpha, TriggerAlpha, TriggerTouch, IsPointingUi) end


---@class IPlayerSubtitlesInterface : IInterface
IPlayerSubtitlesInterface = {}

---@param bAutosave boolean
function IPlayerSubtitlesInterface:ShowSubtitlesSave(bAutosave) end
---@param SubtitleInstigator ESubtitleInstigator
---@param Message FText
---@param Duration float
function IPlayerSubtitlesInterface:ShowSubtitles(SubtitleInstigator, Message, Duration) end
function IPlayerSubtitlesInterface:HideSubtitles() end


---@class IRadiusAIBodyInterface : IInterface
IRadiusAIBodyInterface = {}

function IRadiusAIBodyInterface:StopFire() end
function IRadiusAIBodyInterface:StartFire() end
---@return boolean
function IRadiusAIBodyInterface:ShouldDrawDebugTraces() end
---@param Value uint8
function IRadiusAIBodyInterface:SetGroupId(Value) end
function IRadiusAIBodyInterface:Reload() end
---@param LeanState ENPCLeanState
---@param Angle float
function IRadiusAIBodyInterface:Lean(LeanState, Angle) end
---@return boolean
function IRadiusAIBodyInterface:IsShooting() end
---@param HitComponent UPrimitiveComponent
---@param BoneName FName
---@return boolean
function IRadiusAIBodyInterface:IsCriticalHit(HitComponent, BoneName) end
---@return FVector
function IRadiusAIBodyInterface:GetShootingPoint() end
---@return UAnimMontage
function IRadiusAIBodyInterface:GetReloadMontage() end
---@return uint8
function IRadiusAIBodyInterface:GetGroupId() end
---@return FGameplayTag
function IRadiusAIBodyInterface:GetConfigTag() end
---@param NewDetectionPercent float
function IRadiusAIBodyInterface:ChangeTargetDetectScale(NewDetectionPercent) end
---@param Target AActor
---@return boolean
function IRadiusAIBodyInterface:CanSeeTarget(Target) end


---@class IRadiusAISightInterface : IInterface
IRadiusAISightInterface = {}

---@param CrouchedTargetDistModifier float
---@return float
function IRadiusAISightInterface:GetSpotDistModifier(CrouchedTargetDistModifier) end
---@param SocketName FName
---@return FVector
function IRadiusAISightInterface:GetSocketLocation(SocketName) end
---@return FVector
function IRadiusAISightInterface:GetSecondHeadLocation() end
---@return FVector
function IRadiusAISightInterface:GetRightHandLocation() end
---@return FVector
function IRadiusAISightInterface:GetLeftHandLocation() end
---@return FVector
function IRadiusAISightInterface:GetHeadLocation() end
---@return FVector
function IRadiusAISightInterface:GetFirstHeadLocation() end
---@return FVector
function IRadiusAISightInterface:GetActorLocation() end


---@class IRadiusActivatableButtonInterface : IInterface
IRadiusActivatableButtonInterface = {}

function IRadiusActivatableButtonInterface:SwapActivate() end
---@return boolean
function IRadiusActivatableButtonInterface:IsActivated() end
function IRadiusActivatableButtonInterface:Deactivate() end
function IRadiusActivatableButtonInterface:Activate() end


---@class IRadiusAnomalyInterface : IInterface
IRadiusAnomalyInterface = {}

---@param UniqueID FString
function IRadiusAnomalyInterface:SetAnomalyUniqueId(UniqueID) end
---@param Data UAnomalySaveData
function IRadiusAnomalyInterface:LoadFromData(Data) end
---@return UAnomalySaveData
function IRadiusAnomalyInterface:GetSaveData() end
---@return FString
function IRadiusAnomalyInterface:GetAnomalyUniqueId() end
---@return FGameplayTag
function IRadiusAnomalyInterface:GetAnomalyTypeId() end
function IRadiusAnomalyInterface:GenerateAnomalyUniqueId() end


---@class IRadiusComponentInterface : IInterface
IRadiusComponentInterface = {}

function IRadiusComponentInterface:PrepareComponent() end
---@return FGameplayTagContainer
function IRadiusComponentInterface:GetComponentTags() end
---@return UObject
function IRadiusComponentInterface:GetComponentAsObject() end
---@return USceneComponent
function IRadiusComponentInterface:GetAsRadiusSceneComponent() end
---@return UActorComponent
function IRadiusComponentInterface:GetAsRadiusComponent() end


---@class IRadiusDamageCauserInterface : IInterface
IRadiusDamageCauserInterface = {}

---@return FGameplayTag
function IRadiusDamageCauserInterface:GetDamageCauserTag() end
---@return FText
function IRadiusDamageCauserInterface:GetDamageCauserName() end


---@class IRadiusDamageDealerInterface : IInterface
IRadiusDamageDealerInterface = {}

---@param Target AActor
---@param Damage float
---@param HitFromDirection FVector
---@param HitInfo FHitResult
---@param DamageCauser AActor
---@param DamageTypeClass TSubclassOf<UDamageType>
function IRadiusDamageDealerInterface:ApplyPointDamage(Target, Damage, HitFromDirection, HitInfo, DamageCauser, DamageTypeClass) end


---@class IRadiusDataComponentInterface : IInterface
IRadiusDataComponentInterface = {}

---@param OutWeaponStaticData FWeaponStaticData
---@return boolean
function IRadiusDataComponentInterface:GetWeaponStaticData(OutWeaponStaticData) end
---@param OutItemStaticData FRadiusItemStaticData
---@return boolean
function IRadiusDataComponentInterface:GetItemStaticData(OutItemStaticData) end
---@param OutItemDynamicData URadiusItemDynamicData
---@return boolean
function IRadiusDataComponentInterface:GetItemDynamicData_BP(OutItemDynamicData) end
---@param OutAttachmentStaticData FAttachmentStaticData
---@return boolean
function IRadiusDataComponentInterface:GetAttachmentStaticData(OutAttachmentStaticData) end
---@param OutAmmoStaticData FAmmoStaticData
---@return boolean
function IRadiusDataComponentInterface:GetAmmoStaticData(OutAmmoStaticData) end
---@param OutAmmoContainerStaticData FAmmoContainerStaticData
---@return boolean
function IRadiusDataComponentInterface:GetAmmoContainerStaticData(OutAmmoContainerStaticData) end


---@class IRadiusFirearmComponentInterface : IInterface
IRadiusFirearmComponentInterface = {}

function IRadiusFirearmComponentInterface:UpdateRelevantMuzzle() end
---@return EWeaponFireMode
function IRadiusFirearmComponentInterface:GetCurrentFireMode() end
---@param ChamberNumber int32
---@param GameplayTag FGameplayTag
---@return boolean
function IRadiusFirearmComponentInterface:GetAmmoInChamberTag(ChamberNumber, GameplayTag) end


---@class IRadiusGameInstanceInterface : IInterface
IRadiusGameInstanceInterface = {}

---@param bShow boolean
function IRadiusGameInstanceInterface:ShowSplashScreen(bShow) end
---@param Actor AActor
function IRadiusGameInstanceInterface:RemoveFromSeamlessTravel(Actor) end
---@return boolean
function IRadiusGameInstanceInterface:IsSplashScreenShown() end
---@return TArray<AActor>
function IRadiusGameInstanceInterface:GetSeamlessActors() end
---@return ULevelLoadedEventTrigger
function IRadiusGameInstanceInterface:GetLevelLoadedEventTrigger() end
---@param Actor AActor
function IRadiusGameInstanceInterface:AddToSeamlessTravel(Actor) end


---@class IRadiusGameModeInterface : IInterface
IRadiusGameModeInterface = {}

function IRadiusGameModeInterface:UpdateVolumes() end
---@param Controller AController
function IRadiusGameModeInterface:RespawnPlayer(Controller) end


---@class IRadiusInternalBulletInterface : IInterface
IRadiusInternalBulletInterface = {}

---@param AmmoTypeID FGameplayTag
---@param bIsShell boolean
function IRadiusInternalBulletInterface:UpdateBulletAmmo(AmmoTypeID, bIsShell) end
function IRadiusInternalBulletInterface:SetBulletInvisible() end
---@return boolean
function IRadiusInternalBulletInterface:IsShell() end


---@class IRadiusItemInterface : IInterface
IRadiusItemInterface = {}

---@param On boolean
function IRadiusItemInterface:SetItemStabilization(On) end
---@param On boolean
function IRadiusItemInterface:SetItemHighlight(On) end
---@param NewConfiguration FItemConfiguration
function IRadiusItemInterface:SetItemConfiguration(NewConfiguration) end
---@param NewDurability float
function IRadiusItemInterface:SetDurability(NewDurability) end
---@param bDeny boolean
function IRadiusItemInterface:SetDenyItemUse(bDeny) end
---@param bAttached boolean
function IRadiusItemInterface:RequestItemChangeCollisionProfile(bAttached) end
---@param TagToRemove FGameplayTag
function IRadiusItemInterface:RemoveGameplayTag(TagToRemove) end
function IRadiusItemInterface:ReconfigureItem() end
---@param Holster URadiusHolsterComponent
function IRadiusItemInterface:OnHolstered(Holster) end
function IRadiusItemInterface:ItemUseEnd() end
function IRadiusItemInterface:ItemUseBegin() end
function IRadiusItemInterface:ItemTertiaryUseEnd() end
function IRadiusItemInterface:ItemTertiaryUseBegin() end
---@return boolean
function IRadiusItemInterface:IsDenyItemUse() end
---@return boolean
function IRadiusItemInterface:HasDynamicData() end
---@return boolean
function IRadiusItemInterface:HasAttachments() end
---@return TArray<UObject>
function IRadiusItemInterface:GetRadiusWeaponComponents() end
---@return FGameplayTag
function IRadiusItemInterface:GetRadiusItemTypeID() end
---@return TScriptInterface<IRadiusDataComponentInterface>
function IRadiusItemInterface:GetRadiusDataComponentAccessor() end
---@return URadiusItemDynamicData
function IRadiusItemInterface:GetItemDynamicData() end
---@return FItemConfiguration
function IRadiusItemInterface:GetItemConfiguration() end
---@param ItemBaseStaticData FRadiusItemStaticData
---@return boolean
function IRadiusItemInterface:GetItemBaseStaticData(ItemBaseStaticData) end
---@param GunTools UGS_GunTools
---@return boolean
function IRadiusItemInterface:GetGSGunTools(GunTools) end
---@param PrimaryController UGripMotionControllerComponent
---@param SecondaryController UGripMotionControllerComponent
function IRadiusItemInterface:GetGrippingControllers(PrimaryController, SecondaryController) end
---@return float
function IRadiusItemInterface:GetDurability() end
---@param bIncludeChildren boolean
---@param bIncludeHolders boolean
---@return TArray<AActor>
function IRadiusItemInterface:GetAttachments(bIncludeChildren, bIncludeHolders) end
---@return URadiusHolsterComponent
function IRadiusItemInterface:GetAttachHolster() end
---@return ARadiusHolder
function IRadiusItemInterface:GetAttachHolder() end
---@param ItemGameplayTag FGameplayTag
---@return TArray<TScriptInterface<IRadiusComponentInterface>>
function IRadiusItemInterface:GetActorRadiusComponentsByTag(ItemGameplayTag) end
---@return TArray<TScriptInterface<IRadiusComponentInterface>>
function IRadiusItemInterface:GetActorRadiusComponents() end
---@return boolean
function IRadiusItemInterface:ForceEndSecondaryGrip() end
---@return boolean
function IRadiusItemInterface:ForceEndPrimaryGrip() end
function IRadiusItemInterface:CreateBlockedDynamicDataOnGrip() end
---@param Tag FGameplayTag
---@return boolean
function IRadiusItemInterface:CheckGameplayTag(Tag) end
---@param GripTags FGameplayTagContainer
---@param MotionController UGripMotionControllerComponent
---@return boolean
function IRadiusItemInterface:CanGrip(GripTags, MotionController) end
function IRadiusItemInterface:BlockCreatingDynamicDataOnGrip() end
---@param NewTag FGameplayTag
function IRadiusItemInterface:AddGameplayTag(NewTag) end


---@class IRadiusItemStackComponentInterface : IInterface
IRadiusItemStackComponentInterface = {}

---@param ExtractedItemTag FGameplayTag
---@return boolean
function IRadiusItemStackComponentInterface:TryExtractNextItem(ExtractedItemTag) end
---@param OtherComponent URadiusItemStackComponent
---@return boolean
function IRadiusItemStackComponentInterface:TakeItemFromOtherStackComponent(OtherComponent) end
---@return boolean
function IRadiusItemStackComponentInterface:IsStackFull() end
---@return boolean
function IRadiusItemStackComponentInterface:IsStackEmpty() end
---@return FGameplayTag
function IRadiusItemStackComponentInterface:GetTopItemInStack() end
---@return TArray<FGameplayTag>
function IRadiusItemStackComponentInterface:GetItemTagsStack() end
---@param Number int32
---@return boolean
function IRadiusItemStackComponentInterface:GetCurrentAmmoNumber(Number) end
---@param ItemTag FGameplayTag
---@param Count int32
---@return boolean
function IRadiusItemStackComponentInterface:FillStackWithItems(ItemTag, Count) end
---@return boolean
function IRadiusItemStackComponentInterface:ClearStack() end
---@param ItemToAdd URadiusItemDynamicData
---@return boolean
function IRadiusItemStackComponentInterface:CanItemBeAddedToStack(ItemToAdd) end
---@param ItemType FGameplayTag
---@return boolean
function IRadiusItemStackComponentInterface:AddItemToStackByTag(ItemType) end
---@param ItemToAdd AActor
---@return boolean
function IRadiusItemStackComponentInterface:AddItemToStack(ItemToAdd) end


---@class IRadiusMuzzleComponentInterface : IInterface
IRadiusMuzzleComponentInterface = {}

---@param Other URadiusMuzzleComponent
function IRadiusMuzzleComponentInterface:SwitchWith(Other) end
---@param GameplayTag FGameplayTag
---@param bIsLastRound boolean
---@return boolean
function IRadiusMuzzleComponentInterface:ShootProjectile(GameplayTag, bIsLastRound) end
---@return boolean
function IRadiusMuzzleComponentInterface:IsSilencerMuzzle() end
---@return int32
function IRadiusMuzzleComponentInterface:GetMuzzlePriority() end


---@class IRadiusNpcSaveInterface : IInterface
IRadiusNpcSaveInterface = {}

---@param SaveData FRadiusNpcGameData
function IRadiusNpcSaveInterface:RestoreFromSave(SaveData) end
---@return float
function IRadiusNpcSaveInterface:GetNPCHealth() end
---@param SaveData FRadiusNpcGameData
function IRadiusNpcSaveInterface:FillSaveData(SaveData) end


---@class IRadiusPlayerControllerInterface : IInterface
IRadiusPlayerControllerInterface = {}

---@param DeltaMoney int32
---@param AnalyticsString FString
---@param MoneyChangeReason EMoneyChangeReason
function IRadiusPlayerControllerInterface:ChangeMoney(DeltaMoney, AnalyticsString, MoneyChangeReason) end


---@class IRadiusPlayerInterface : IInterface
IRadiusPlayerInterface = {}

---@param Transform FTransform
---@param Velocity FVector
---@param bWristMenuHidden boolean
---@param bProjectOnGround boolean
---@param Adjust EPlayerTeleportAdjustType
function IRadiusPlayerInterface:TeleportPlayer(Transform, Velocity, bWristMenuHidden, bProjectOnGround, Adjust) end
function IRadiusPlayerInterface:RespawnDeadPlayer() end
---@param isLeft boolean
---@param HapticsTag FGameplayTag
---@param CausingActor AActor
function IRadiusPlayerInterface:PlayHaptics(isLeft, HapticsTag, CausingActor) end
---@param Alive boolean
function IRadiusPlayerInterface:IsAlive(Alive) end
---@param LeftTriggerAlpha float
---@param RightTriggerAlpha float
function IRadiusPlayerInterface:GetTriggerAlphas(LeftTriggerAlpha, RightTriggerAlpha) end
---@return FTransform
function IRadiusPlayerInterface:GetRootTransform() end
---@return URadiusPlayerMovementComponent
function IRadiusPlayerInterface:GetRadiusMovementComponent() end
---@return TArray<AActor>
function IRadiusPlayerInterface:GetPlayerItemActors() end
---@return UPlayerHandsComponent
function IRadiusPlayerInterface:GetPlayerHandsComponent() end
---@return UPlayerGripComponent
function IRadiusPlayerInterface:GetPlayerGripComponent() end
---@param Ref UCameraComponent
function IRadiusPlayerInterface:GetPlayerCameraRef(Ref) end
---@param Ref USkeletalMeshComponent
function IRadiusPlayerInterface:GetPlayerBodyRef(Ref) end
---@param LeftHand USkeletalMeshComponent
---@param RightHand USkeletalMeshComponent
function IRadiusPlayerInterface:GetPhysicalHandMeshes(LeftHand, RightHand) end
---@param CurrentHealth double
function IRadiusPlayerInterface:GetHealth(CurrentHealth) end
---@param GripOverlapLeft FGripOverlap
---@param GripOverlapRight FGripOverlap
function IRadiusPlayerInterface:GetGripOverlaps(GripOverlapLeft, GripOverlapRight) end
---@param Left UGripMotionControllerComponent
---@param Right UGripMotionControllerComponent
function IRadiusPlayerInterface:GetGripControllerRefs(Left, Right) end
---@param isRight boolean
---@param OutTransform FTransform
function IRadiusPlayerInterface:GetForearmTransform(isRight, OutTransform) end
function IRadiusPlayerInterface:DropAllGrips() end
---@param Amount double
function IRadiusPlayerInterface:ChangeHealth(Amount) end
function IRadiusPlayerInterface:CalibratePlayerHeight() end


---@class IRadiusPooledObjectInterface : IInterface
IRadiusPooledObjectInterface = {}

function IRadiusPooledObjectInterface:OnPushToPool() end
---@param Transform FTransform
function IRadiusPooledObjectInterface:OnPopFromPool(Transform) end
---@return boolean
function IRadiusPooledObjectInterface:IsExcludedFromPool() end


---@class IRadiusProjectileInterface : IInterface
IRadiusProjectileInterface = {}

function IRadiusProjectileInterface:Launch() end
---@param InAmmoStaticData FAmmoStaticData
---@param InVelocity float
---@param DamageModifier float
---@param bForceTracer boolean
---@param Owner AActor
function IRadiusProjectileInterface:InitializeWithData(InAmmoStaticData, InVelocity, DamageModifier, bForceTracer, Owner) end
---@param ProjectileInfo URadiusProjectileInfo
function IRadiusProjectileInterface:Initialize(ProjectileInfo) end


---@class IRadiusResourceInterface : IInterface
IRadiusResourceInterface = {}

---@return boolean
function IRadiusResourceInterface:RequestExchangeResources() end


---@class IRadiusShutterComponentInterface : IInterface
IRadiusShutterComponentInterface = {}


---@class IRadiusSpawnerInterface : IInterface
IRadiusSpawnerInterface = {}

function IRadiusSpawnerInterface:SpawnGenerated() end
---@return boolean
function IRadiusSpawnerInterface:ShouldWaitTideToGenerate() end
---@param bEnabled boolean
function IRadiusSpawnerInterface:SetEnabled(bEnabled) end
function IRadiusSpawnerInterface:SaveEmpty() end
function IRadiusSpawnerInterface:Reset() end
function IRadiusSpawnerInterface:KillAllSpawned() end
---@return FString
function IRadiusSpawnerInterface:GetId() end
---@return uint8
function IRadiusSpawnerInterface:GetGroupId() end
---@param Conditions TArray<URadiusCondition>
function IRadiusSpawnerInterface:CollectConditions(Conditions) end
---@param Location FVector
---@return boolean
function IRadiusSpawnerInterface:CheckSpawnDistanceRelevance(Location) end
---@return boolean
function IRadiusSpawnerInterface:CheckConditions() end


---@class IRadiusWeaponComponentInterface : IInterface
IRadiusWeaponComponentInterface = {}

---@return boolean
function IRadiusWeaponComponentInterface:IsComponentReadyToShoot() end


---@class ISpawnerGenerateInterface : IInterface
ISpawnerGenerateInterface = {}

function ISpawnerGenerateInterface:Generate() end


---@class UAIActionRenderComponent : UActorComponent
---@field ActionRenderInfo FActionRenderReplicationInfo
---@field NPCStaticData FRadiusNPCStaticData
---@field Owner ACharacter
---@field GameConfigSubsystem URadiusConfigurationSubsystem
---@field NPCConfig UNPCConfig
UAIActionRenderComponent = {}

---@param InActionTag FGameplayTag
function UAIActionRenderComponent:StartRender(InActionTag) end
function UAIActionRenderComponent:StartCooldown() end
function UAIActionRenderComponent:RenderVFX() end
---@param SoundIdx int32
---@param ActionTag FGameplayTag
function UAIActionRenderComponent:Render(SoundIdx, ActionTag) end
function UAIActionRenderComponent:OnRep_ActionRenderInfo() end


---@class UAIFactor : UObject
---@field Curve FRuntimeFloatCurve
---@field ValuesRange FFloatRange
---@field Config UNPCConfig
---@field GameConfigSubsystem URadiusConfigurationSubsystem
UAIFactor = {}

---@param NPCBody AActor
---@param Target AActor
---@param Stimulus FAIStimulus
---@return float
function UAIFactor:GetNormalizedScore(NPCBody, Target, Stimulus) end
---@param NPCBody AActor
---@param Target AActor
---@param Stimulus FAIStimulus
---@return float
function UAIFactor:CalculateValue(NPCBody, Target, Stimulus) end


---@class UAIFactor_DamageToNPC : UAIFactor
UAIFactor_DamageToNPC = {}


---@class UAIFactor_DistanceToStimulus : UAIFactor
UAIFactor_DistanceToStimulus = {}


---@class UAIFactor_DistanceToTarget : UAIFactor
UAIFactor_DistanceToTarget = {}


---@class UAIFactor_SenseStrength : UAIFactor
UAIFactor_SenseStrength = {}


---@class UAIFactor_StimulusWeight : UAIFactor
UAIFactor_StimulusWeight = {}


---@class UAIFactor_TargetType : UAIFactor
---@field Player float
---@field NPC float
---@field Object float
---@field Position float
UAIFactor_TargetType = {}



---@class UAggroComponent : UActorComponent
---@field OnAggroReductionStarted FAggroComponentOnAggroReductionStarted
---@field PreAggroReductionDelayTimerHandle FTimerHandle
---@field AggroReductionTimerHandle FTimerHandle
---@field OnStateChanged FAggroComponentOnStateChanged
---@field GameConfigSubsystem URadiusConfigurationSubsystem
---@field Config UNPCConfig
---@field Owner AActor
UAggroComponent = {}

function UAggroComponent:StartAggroReduction() end
function UAggroComponent:ReduceAggro() end
---@return boolean
function UAggroComponent:IsReducingAggroNow() end
function UAggroComponent:HandleAggroReduction() end
---@return float
function UAggroComponent:GetAggroLevel() end
---@param StimuliTag FName
---@param AggroModifier float
function UAggroComponent:AddAggroSetup(StimuliTag, AggroModifier) end


---@class UAnomalySaveData : UObject
---@field DistanceAlongSpline float
---@field TeleportPosition int32
UAnomalySaveData = {}

---@return UAnomalySaveData
function UAnomalySaveData:CreateAnomalySaveData() end


---@class UAvailableMission : UObject
---@field OnMissionStateUpdate FAvailableMissionOnMissionStateUpdate
---@field OnMissionItemsChanged FAvailableMissionOnMissionItemsChanged
---@field MissionId FGameplayTag
---@field Objectives TArray<URadiusMissionObjectiveBase>
---@field bIsActivated boolean
---@field StartTimeInRealMinutes float
---@field LegacyConfig USingleMissionConfig
---@field CurrentObjectiveIndex int32
UAvailableMission = {}

function UAvailableMission:OnRep_CurrentObjectiveIndex() end
function UAvailableMission:OnRep_bIsActivated() end
function UAvailableMission:OnObjectiveCompleted() end
---@param PlayerContainerUID FString
function UAvailableMission:OnInventoryChanged(PlayerContainerUID) end
---@return boolean
function UAvailableMission:IsTopPriority() end
---@return boolean
function UAvailableMission:IsLastObjective() end
---@param bHasItems boolean
---@return TMap<FGameplayTag, FIntPoint>
function UAvailableMission:GetTargetItems(bHasItems) end
---@param TaggedItems TArray<FGameplayTag>
---@param UidItems TArray<FString>
function UAvailableMission:GetRequiredMissionItemsInCurrentStep(TaggedItems, UidItems) end
---@param TagItems TArray<FGameplayTag>
---@param UidItems TArray<FString>
---@return boolean
function UAvailableMission:GetRequiredItemsInInventory(TagItems, UidItems) end
---@return FText
function UAvailableMission:GetMissionLocationName() end
---@param bHasRequiredItems boolean
---@return TMap<FGameplayTag, FIntPoint>
function UAvailableMission:GetMissionItemStats(bHasRequiredItems) end
---@param bSkipLegacy boolean
---@return USingleMissionConfig
function UAvailableMission:GetMissionConfig(bSkipLegacy) end
---@return int32
function UAvailableMission:GetCurrentObjectiveIndex() end
---@return URadiusMissionObjectiveBase
function UAvailableMission:GetCurrentObjective() end
---@param TaggedItems TArray<FGameplayTag>
---@param UidItems TArray<FString>
function UAvailableMission:GetAllRequiredMissionItems(TaggedItems, UidItems) end
---@param bOutHasItems boolean
---@return boolean
function UAvailableMission:CanFinishMission(bOutHasItems) end


---@class UBallLightningAnomalySaveData : UAnomalySaveData
---@field bIsHidden boolean
UBallLightningAnomalySaveData = {}

---@return UBallLightningAnomalySaveData
function UBallLightningAnomalySaveData:CreateBallLightningAnomalySaveData() end


---@class UBlackboardKeyType_Range : UBlackboardKeyType
UBlackboardKeyType_Range = {}


---@class UBlueprintableTextRenderComponent : UTextRenderComponent
UBlueprintableTextRenderComponent = {}


---@class UBoxVolumeContainerComponent : UBoxComponent
UBoxVolumeContainerComponent = {}


---@class UCoverLineOfFireCheck : UHTNTask
---@field DrawDebugType EDrawDebugTrace::Type
---@field DebugColor FLinearColor
---@field DebugHitColor FLinearColor
---@field DebugDrawTime float
---@field SideOffset float
---@field ShootHeightOffset float
---@field TargetLocationHeightOffset float
---@field TraceExtent FVector
---@field TraceShape EEnvTraceShape::Type
---@field CoverKey FBlackboardKeySelector
---@field ShootLocationKey FBlackboardKeySelector
---@field EnemyKey FBlackboardKeySelector
---@field PossibleLeanDirectionKey FBlackboardKeySelector
---@field CoverLeftShootLocationKey FBlackboardKeySelector
---@field CoverRightShootLocationKey FBlackboardKeySelector
UCoverLineOfFireCheck = {}



---@class UCreateSessionCallbackProxyRadius : UOnlineBlueprintCallProxyBase
---@field OnSuccess FCreateSessionCallbackProxyRadiusOnSuccess
---@field OnFailure FCreateSessionCallbackProxyRadiusOnFailure
UCreateSessionCallbackProxyRadius = {}

---@param GameID FString
---@return UCreateSessionCallbackProxyRadius
function UCreateSessionCallbackProxyRadius:CreateRadiusCoopSession(GameID) end


---@class UDamageHandler : UObject
UDamageHandler = {}

---@param Actor AActor
---@param Damage float
---@param InstigatedBy AController
---@param DamageCauser AActor
function UDamageHandler:HandleDamage(Actor, Damage, InstigatedBy, DamageCauser) end


---@class UDebugAreaDrawComponent : UActorComponent
---@field Radius float
---@field DrawType EDebugAreaDrawType
---@field RadiusDebugDraw boolean
---@field bHiddenInGame boolean
---@field RadiusDebugColor FColor
---@field RadiusDebugHeight float
UDebugAreaDrawComponent = {}



---@class UDestroySessionCallbackProxyRadius : UOnlineBlueprintCallProxyBase
---@field OnFinish FDestroySessionCallbackProxyRadiusOnFinish
UDestroySessionCallbackProxyRadius = {}

---@return UDestroySessionCallbackProxyRadius
function UDestroySessionCallbackProxyRadius:DestroyCoopSession() end


---@class UDifficultyConfig : URadiusConfigurationAssetBase
---@field Easy TMap<FGameplayTag, FGameplayTag>
---@field Normal TMap<FGameplayTag, FGameplayTag>
---@field Realistic TMap<FGameplayTag, FGameplayTag>
---@field IronMan FDifficultyConfigBool
---@field MissionRewards FDifficultyConfigFloat
---@field LootAmount FDifficultyConfigFloat
---@field EnemySpotDistModifier FDifficultyConfigFloat
---@field EnemySpotTimeModifier FDifficultyConfigFloat
---@field EnemyHearingDistModifier FDifficultyConfigFloat
---@field EnemyAmount FDifficultyConfigFloat
---@field EnemyDamage FDifficultyConfigFloat
---@field ShowPlayersOnMap FDifficultyConfigBool
---@field ShowSubtitles FDifficultyConfigBool
---@field ItemsDroppedOnDeath FDifficultyConfigFloat
---@field BulletTracers FDifficultyConfigFloat
---@field EnemyHealth FDifficultyConfigFloat
---@field ItemsSellPrice FDifficultyConfigFloat
---@field Hunger FDifficultyConfigFloat
---@field AnomaliesDamage FDifficultyConfigFloat
---@field AnomaliesAmount FDifficultyConfigFloat
---@field ItemsDurability FDifficultyConfigFloat
---@field TimeToTide FDifficultyConfigFloat
---@field FriendlyFire FDifficultyConfigBool
---@field ForEnemiesTag FGameplayTag
---@field ForPlayerTag FGameplayTag
---@field ForEnemiesAndPlayerTag FGameplayTag
---@field OffTag FGameplayTag
UDifficultyConfig = {}



---@class UDistanceGripManager : UObject
---@field GripSystemOwner ARadiusPlayerCharacter
---@field CandidatePool TMap<URadiusItemDynamicData, FDistanceGripCandidate>
UDistanceGripManager = {}

function UDistanceGripManager:LevelTransitionStartCallback() end
function UDistanceGripManager:LevelTransitionEndCallback() end
---@param ItemTaken URadiusItemDynamicData
function UDistanceGripManager:ItemTakenFromLevelCallback(ItemTaken) end
---@param ItemStored URadiusItemDynamicData
function UDistanceGripManager:ItemStoredToLevelCallback(ItemStored) end
---@param ItemRemoved URadiusItemDynamicData
function UDistanceGripManager:ItemRemovedFromLevelCallback(ItemRemoved) end
---@param ItemWithActorRemoved URadiusItemDynamicData
function UDistanceGripManager:ItemActorRemovedCallback(ItemWithActorRemoved) end


---@class UEnvQueryTest_HasLineOfFire : UEnvQueryTest_Trace
---@field DrawDebugType EDrawDebugTrace::Type
---@field DebugColor FLinearColor
---@field DebugHitColor FLinearColor
---@field DebugDrawTime float
---@field SideOffset float
UEnvQueryTest_HasLineOfFire = {}



---@class UEnvQueryTest_Trace_StanceHeight : UEnvQueryTest_Trace
---@field DrawDebugType EDrawDebugTrace::Type
---@field DebugColor FLinearColor
---@field DebugHitColor FLinearColor
---@field DebugDrawTime float
UEnvQueryTest_Trace_StanceHeight = {}



---@class UFLGeneral : UBlueprintFunctionLibrary
UFLGeneral = {}

---@param Prefix FString
---@param TagsArray TArray<FGameplayTag>
---@return FString
function UFLGeneral:TagsArrayAsString(Prefix, TagsArray) end
---@param Map TMap<float, AActor>
---@param bAscending boolean
function UFLGeneral:SortMapByKey(Map, bAscending) end
---@param WorldContextObject UObject
---@param bAutosave boolean
function UFLGeneral:ShowSubtitlesSave(WorldContextObject, bAutosave) end
---@param WorldContextObject UObject
---@param SubtitleInstigator ESubtitleInstigator
---@param Message FText
---@param Duration float
function UFLGeneral:ShowSubtitles(WorldContextObject, SubtitleInstigator, Message, Duration) end
---@param Message FString
---@param Title FString
function UFLGeneral:ShowMessage(Message, Title) end
---@param Component UExponentialHeightFogComponent
---@param Distance float
function UFLGeneral:SetVolumetricFogStartDistance(Component, Distance) end
---@param Light ULightComponent
---@param IsVisible boolean
function UFLGeneral:SetLightVisibility(Light, IsVisible) end
---@param Component UPrimitiveComponent
---@param LightmapType ELightmapType
function UFLGeneral:SetLightMapType(Component, LightmapType) end
---@param Component ULightComponent
---@param bAffects boolean
function UFLGeneral:SetLightAffectsWorld(Component, bAffects) end
---@param Component UActorComponent
---@param bRelevant boolean
function UFLGeneral:SetCanEverAffectNavigation(Component, bRelevant) end
---@param Component UPhysicsConstraintComponent
---@param RotationOffset FRotator
function UFLGeneral:SetAngularRotationOffset(Component, RotationOffset) end
---@param Actor AActor
---@param Simulate boolean
---@param zeroVel boolean
---@param Success boolean
---@param Primitive UPrimitiveComponent
function UFLGeneral:SetActorSimulatePhysics(Actor, Simulate, zeroVel, Success, Primitive) end
---@param Actor AActor
---@param Enable boolean
---@return boolean
function UFLGeneral:SetActorEnableGravity(Actor, Enable) end
---@param Actor AActor
---@param bSet boolean
function UFLGeneral:SetActorEditorOnly(Actor, bSet) end
---@param Actor AActor
function UFLGeneral:SafeDestroyActor(Actor) end
---@param Command FString
function UFLGeneral:RunConsoleCommand(Command) end
---@param TagName FName
---@return FGameplayTag
function UFLGeneral:RequestGameplayTag(TagName) end
---@param Q FQuat
---@return FVector
function UFLGeneral:Quat_GetRotationVector(Q) end
---@param Actor AActor
function UFLGeneral:PutActorInPersistentLevel(Actor) end
---@param Point FVector
---@param PlaneBase FVector
---@param PlaneNormal FVector
---@return float
function UFLGeneral:PointPlaneDist(Point, PlaneBase, PlaneNormal) end
---@param Point FVector
---@param BoxOrigin FVector
---@param BoxExtend FVector
---@param BoxRotation FRotator
---@return float
function UFLGeneral:PointBoxDist(Point, BoxOrigin, BoxExtend, BoxRotation) end
---@param Point FVector
---@param Actor AActor
---@param bOnlyCollidingComponents boolean
---@param bIncludeFromChildActors boolean
---@return float
function UFLGeneral:PointActorDist(Point, Actor, bOnlyCollidingComponents, bIncludeFromChildActors) end
---@param Value float
---@return float
function UFLGeneral:Negate(Value) end
---@param Value FMinMaxInt
---@return int32
function UFLGeneral:MinMaxInt_Random(Value) end
---@param Value FMinMaxInt
---@return boolean
function UFLGeneral:MinMaxInt_IsZero(Value) end
---@param Value FMinMaxFloat
---@return float
function UFLGeneral:MinMaxFloat_Random(Value) end
---@param Value FMinMaxFloat
---@return boolean
function UFLGeneral:MinMaxFloat_IsZero(Value) end
---@param Range FMinMaxFloat
---@param Value float
---@return boolean
function UFLGeneral:MinMaxFloat_Include(Range, Value) end
---@param Value FVector2D
---@param InRangeA FVector2D
---@param InRangeB FVector2D
---@param OutRangeA FVector2D
---@param OutRangeB FVector2D
---@return FVector2D
function UFLGeneral:MapRangeUnclamped(Value, InRangeA, InRangeB, OutRangeA, OutRangeB) end
---@param Value FVector2D
---@param InRangeA FVector2D
---@param InRangeB FVector2D
---@param OutRangeA FVector2D
---@param OutRangeB FVector2D
---@return FVector2D
function UFLGeneral:MapRangeClamped(Value, InRangeA, InRangeB, OutRangeA, OutRangeB) end
---@param Actor AActor
function UFLGeneral:KillActorWithChildren(Actor) end
---@param WorldContextObject UObject
---@param ActorsClass TSubclassOf<AActor>
---@param bWithChildren boolean
function UFLGeneral:KillActorsByClass(WorldContextObject, ActorsClass, bWithChildren) end
---@param Actor AActor
function UFLGeneral:KillActor(Actor) end
---@param Point FVector
---@param BoxWorldTransform FTransform
---@param BoxExtent FVector
---@param bIgnoreZ boolean
---@return boolean
function UFLGeneral:IsInBounds(Point, BoxWorldTransform, BoxExtent, bIgnoreZ) end
---@param ComponentA UPrimitiveComponent
---@param ComponentB UPrimitiveComponent
---@return boolean
function UFLGeneral:IsComponentBoundsIntersect(ComponentA, ComponentB) end
---@param WorldContextObject UObject
function UFLGeneral:HideSubtitles(WorldContextObject) end
---@param ParameterName FString
---@return boolean
function UFLGeneral:HasCommandLineParameter(ParameterName) end
---@param TotalSeconds int32
---@param bNoSeconds boolean
---@param String FString
function UFLGeneral:GetTimeStringFromSeconds(TotalSeconds, bNoSeconds, String) end
---@param TotalMinutes int32
---@param String FString
function UFLGeneral:GetTimeSpentString(TotalMinutes, String) end
---@param Actor AActor
---@return FName
function UFLGeneral:GetStreamingLevelNameFromActor(Actor) end
---@param Normal FVector
---@param v1 FVector
---@param v2 FVector
---@return float
function UFLGeneral:GetSignedAngle(Normal, v1, v2) end
---@param TotalSeconds int32
---@return FString
function UFLGeneral:GetShortTimeStringFromSeconds(TotalSeconds) end
---@param Actor AActor
---@param bOnlyCollidingComponents boolean
---@param BoxOrigin FVector
---@param BoxExtend FVector
---@param bIncludeFromChildActors boolean
function UFLGeneral:GetPureActorBounds(Actor, bOnlyCollidingComponents, BoxOrigin, BoxExtend, bIncludeFromChildActors) end
---@param Points TArray<FVector>
---@return FVector
function UFLGeneral:GetPointsBoxSize(Points) end
---@param Class UClass
---@return UClass
function UFLGeneral:GetParentClass(Class) end
---@param Object UObject
---@return UClass
function UFLGeneral:GetObjectParentClass(Object) end
---@param Num int32
---@param Uppercase boolean
---@return FString
function UFLGeneral:GetNumberAsCharacter(Num, Uppercase) end
---@param WorldContextObject UObject
---@return APlayerController
function UFLGeneral:GetFirstPlayerController(WorldContextObject) end
---@param DateTime FDateTime
---@param String FString
function UFLGeneral:GetDateTimeString(DateTime, String) end
---@return UWorld
function UFLGeneral:GetCurrentWorld() end
---@param ParameterName FString
---@return FString
function UFLGeneral:GetCommandLineParameterValue(ParameterName) end
---@param Spline USplineComponent
---@param Location FVector
---@return float
function UFLGeneral:FindDistanceAlongSplineClosestToLocation(Spline, Location) end
---@param Actor AActor
---@param bDetachHolstered boolean
---@param bKillActor boolean
function UFLGeneral:DestroyActorDynamicData(Actor, bDetachHolstered, bKillActor) end
---@param Component USceneComponent
---@return FVector
function UFLGeneral:CalcLocalBounds(Component) end
---@param BaseActor AActor
---@param AttachedComponent TSubclassOf<UActorComponent>
---@return UActorComponent
function UFLGeneral:AddComponentToActor(BaseActor, AttachedComponent) end


---@class UFLHelpers : UBlueprintFunctionLibrary
UFLHelpers = {}

---@param inArray TArray<int32>
---@return TArray<int32>
function UFLHelpers:SortIntArray(inArray) end
---@param PrimitiveComponent UPrimitiveComponent
---@param bSet boolean
function UFLHelpers:SetUseAsOccluder(PrimitiveComponent, bSet) end
---@param WorldContextObject UObject
---@param Triggers TArray<FGameplayTag>
---@param bSet boolean
function UFLHelpers:SetTriggers(WorldContextObject, Triggers, bSet) end
---@param WorldContextObject UObject
---@param Message FString
function UFLHelpers:RadiusLogStacks(WorldContextObject, Message) end
---@param WorldContextObject UObject
---@param Message FString
---@param LogLevelType ELogTypeBP
function UFLHelpers:RadiusLog(WorldContextObject, Message, LogLevelType) end
---@param WidgetUpper UWidget
---@param WidgetBelow UWidget
---@return boolean
function UFLHelpers:IsWidgetUnderWidget(WidgetUpper, WidgetBelow) end
---@param Widget UWidget
---@param WidgetWithCenter UWidget
---@return boolean
function UFLHelpers:IsWidgetUnderCenterOfAnotherWidget(Widget, WidgetWithCenter) end
---@param WidgetObject UWidget
---@param WidgetTargetObject UWidget
---@param CurrentScroll float
---@param Offset float
---@return boolean
function UFLHelpers:IsScrolledToWidget(WidgetObject, WidgetTargetObject, CurrentScroll, Offset) end
---@param A FUniqueNetIdRepl
---@param B FUniqueNetIdRepl
---@return boolean
function UFLHelpers:IsNetIdEquals(A, B) end
---@param WorldContextObject UObject
---@return boolean
function UFLHelpers:IsInTutorial(WorldContextObject) end
---@param WorldContextObject UObject
---@return boolean
function UFLHelpers:IsInMainMenu(WorldContextObject) end
---@param PlayerStateToCheck APlayerState
---@return boolean
function UFLHelpers:IsHostPlayerState(PlayerStateToCheck) end
---@param Target AActor
---@param DamageCategory EDamageCategory
---@return boolean
function UFLHelpers:IsActorProtectedFromDamage(Target, DamageCategory) end
---@param Actor AActor
---@return boolean
function UFLHelpers:IsActorLocallyOwned(Actor) end
---@param TargetWidget UWidget
---@return FVector2f
function UFLHelpers:GetPosition(TargetWidget) end
---@param Obj UObject
---@return TArray<UObject>
function UFLHelpers:GetObjectReferences(Obj) end
---@param WorldContextObject UObject
---@param NumberOfTags int32
---@return TArray<FGameplayTag>
function UFLHelpers:GetNumericalTags(WorldContextObject, NumberOfTags) end
---@param WorldContextObject UObject
---@return APlayerController
function UFLHelpers:GetLocalPlayerController(WorldContextObject) end
---@param Controller UGripMotionControllerComponent
---@return FString
function UFLHelpers:GetHandHolsterName(Controller) end
---@param Controller UGripMotionControllerComponent
---@return EVRHand
function UFLHelpers:GetHandByController(Controller) end
---@param WorldContextObject UObject
---@param Tags TArray<FGameplayTag>
---@return FGameplayTag
function UFLHelpers:GetFireModeFromTags(WorldContextObject, Tags) end
---@param OptionTag FGameplayTag
---@param DifficultyConfig FDifficultyConfigFloat
---@param OutOption FDifficultyOptionFloat
---@return boolean
function UFLHelpers:GetDifficultyOptionFromDifficultyConfigByTag(OptionTag, DifficultyConfig, OutOption) end
---@param OptionTag float
---@param DifficultyConfig FDifficultyConfigFloat
---@param OutOption FDifficultyOptionFloat
---@return boolean
function UFLHelpers:GetDifficultyOptionFromDifficultyConfigByFloat(OptionTag, DifficultyConfig, OutOption) end
---@param WorldContextObject UObject
---@param DynamicData URadiusItemDynamicData
---@return FText
function UFLHelpers:GetCurrentFireModeName(WorldContextObject, DynamicData) end
---@param WorldContextObject UObject
---@param AmmoTypeTag FGameplayTag
---@return FText
function UFLHelpers:GetAmmoTypeName(WorldContextObject, AmmoTypeTag) end
---@param WorldContextObject UObject
---@param AmmoTag FGameplayTag
---@return FText
function UFLHelpers:GetAmmoCaliberName(WorldContextObject, AmmoTag) end
---@param TargetWidget UWidget
---@return FVector2f
function UFLHelpers:GetAbsolutePositionAtPosition(TargetWidget) end
---@param TargetWidget UWidget
---@return FVector2f
function UFLHelpers:GetAbsolutePosition(TargetWidget) end
---@param Prefix FString
---@return FString
function UFLHelpers:GenerateUid(Prefix) end
---@param CurrentScrollBox UScrollBox
---@param TitleWidgetToCategoryButtonIndex TMap<UWidget, int32>
---@param TitleWidgetToParentScrollBox TMap<UWidget, UScrollBox>
---@param IsLastTitleFounded boolean
---@param ButtonIndexToActivate int32
function UFLHelpers:CheckScrollForButtons(CurrentScrollBox, TitleWidgetToCategoryButtonIndex, TitleWidgetToParentScrollBox, IsLastTitleFounded, ButtonIndexToActivate) end
---@param Conditions FConditionsList
---@return boolean
function UFLHelpers:CheckConditions(Conditions) end
---@param DataTable UDataTable
---@param RowName FName
---@param Transforms TArray<FTransform>
---@return boolean
function UFLHelpers:AddTransformArrayToTable(DataTable, RowName, Transforms) end


---@class UFLItems : UBlueprintFunctionLibrary
UFLItems = {}

---@param ItemActor AActor
function UFLItems:UpdateIgnoreCollisionForItemActorAttachments(ItemActor) end
---@param CollisionComp UPrimitiveComponent
---@param ActorsToPack TArray<AActor>
---@param bExcludeNonFit boolean
---@param bProjectOnGround boolean
---@param Excluded TArray<AActor>
function UFLItems:PackItemsToBox(CollisionComp, ActorsToPack, bExcludeNonFit, bProjectOnGround, Excluded) end
---@param WorldContext UObject
---@param ContainerID FString
---@return boolean
function UFLItems:IsInPlayerInventory(WorldContext, ContainerID) end
---@param Actor AActor
---@return AActor
function UFLItems:GetTopParentItemActor(Actor) end
---@param Actor AActor
---@return UGripMotionControllerComponent
function UFLItems:GetPrimaryControllerForActor(Actor) end
---@param Actor AActor
---@return AActor
function UFLItems:GetParentItemActor(Actor) end
---@param Item AActor
---@return float
function UFLItems:GetItemDurabilityRatio(Item) end
---@param WorldContext UObject
---@return TArray<FString>
function UFLItems:GetAllPlayerContainerIDs(WorldContext) end
---@param PrimitiveToCheck UPrimitiveComponent
---@return UObject
function UFLItems:FindParentContainerByOverlap(PrimitiveToCheck) end
---@param WeaponDynamicData URadiusItemDynamicData
---@return URadiusItemDynamicData
function UFLItems:FindAttachedMagazine(WeaponDynamicData) end
---@param ItemActor AActor
---@return URadiusItemDynamicData
function UFLItems:CreateNewDynamicDataFromActor(ItemActor) end
---@param WorldContext UObject
---@param ItemType FGameplayTag
---@param ItemConfiguration FItemConfiguration
---@param ParentContainer FString
---@param Transform FTransform
---@return URadiusItemDynamicData
function UFLItems:CreateNewDynamicData(WorldContext, ItemType, ItemConfiguration, ParentContainer, Transform) end
---@param bOutIsAligned boolean
---@param OutAlignAlpha float
---@param VRCameraRef USceneComponent
---@param Mesh UMeshComponent
---@param SocketName FName
---@param DistanceLimit float
---@param AlphaThreshold float
function UFLItems:CalculateSmoothingAlpha(bOutIsAligned, OutAlignAlpha, VRCameraRef, Mesh, SocketName, DistanceLimit, AlphaThreshold) end
---@param WorldContext UObject
---@param ContainerID FString
---@return float
function UFLItems:CalculateContainerItemsWeight(WorldContext, ContainerID) end
---@param ItemActor AActor
---@param TotalWeight float
---@param Capacity float
function UFLItems:CalculateChildItemsWeightAndCapacity(ItemActor, TotalWeight, Capacity) end
---@param PlayerPawn APawn
---@return TArray<USceneComponent>
function UFLItems:AddStartingGearToDynamicData(PlayerPawn) end


---@class UFLOpenXRExpansion : UBlueprintFunctionLibrary
UFLOpenXRExpansion = {}


---@class UFLProjectiles : UBlueprintFunctionLibrary
UFLProjectiles = {}

---@param Transform FTransform
---@param AmmoStaticData FAmmoStaticData
---@param Velocity float
---@param AccuracyRadians float
---@param DamageModifier float
---@param Owner AActor
---@param Instigator APawn
---@param IsForceTrace boolean
---@param State boolean
---@param Actor AActor
function UFLProjectiles:SpawnBulletProjectile(Transform, AmmoStaticData, Velocity, AccuracyRadians, DamageModifier, Owner, Instigator, IsForceTrace, State, Actor) end


---@class UFLRadiusConsole : UBlueprintFunctionLibrary
UFLRadiusConsole = {}

---@param WorldContextObject UObject
function UFLRadiusConsole:OpenConsoleFull(WorldContextObject) end
---@param WorldContextObject UObject
function UFLRadiusConsole:OpenConsole(WorldContextObject) end
---@return boolean
function UFLRadiusConsole:IsTutorialEnabled() end
---@param WorldContextObject UObject
---@return FName
function UFLRadiusConsole:GetConsoleState(WorldContextObject) end
---@param WorldContextObject UObject
function UFLRadiusConsole:CloseConsole(WorldContextObject) end


---@class UFLRadiusSerialization : UBlueprintFunctionLibrary
UFLRadiusSerialization = {}


---@class UFLSpawn : UBlueprintFunctionLibrary
UFLSpawn = {}

---@param WorldContextObject UObject
---@param ActorClass TSoftClassPtr<AActor>
---@param Transform FTransform
---@param ItemConfiguration FItemConfiguration
---@param bCreateDynamicData boolean
---@return AActor
function UFLSpawn:SpawnPooledActor(WorldContextObject, ActorClass, Transform, ItemConfiguration, bCreateDynamicData) end
---@param WorldContextObject UObject
---@param TypeTag FGameplayTag
---@param Transform FTransform
---@param Owner AActor
---@return AActor
function UFLSpawn:SpawnMonster(WorldContextObject, TypeTag, Transform, Owner) end
---@param WorldContextObject UObject
---@param ItemId FString
---@return AActor
function UFLSpawn:SpawnItemFromInventory(WorldContextObject, ItemId) end
---@param WorldContextObject UObject
---@param TypeTag FGameplayTag
---@param Transform FTransform
---@param ItemConfiguration FItemConfiguration
---@param bCreateDynamicData boolean
---@return AActor
function UFLSpawn:SpawnItemByTypeTag(WorldContextObject, TypeTag, Transform, ItemConfiguration, bCreateDynamicData) end
---@param WorldContextObject UObject
---@param ActorClass TSubclassOf<AActor>
---@param Transform FTransform
---@return AActor
function UFLSpawn:SpawnDeferredActor(WorldContextObject, ActorClass, Transform) end
---@param WorldContextObject UObject
---@param TypeTag FGameplayTag
---@param Transform FTransform
---@return AActor
function UFLSpawn:SpawnAnomaly(WorldContextObject, TypeTag, Transform) end
---@param WorldContextObject UObject
---@param Transform FTransform
---@return FTransform
function UFLSpawn:ProjectTransformOnGround(WorldContextObject, Transform) end
---@param WorldContextObject UObject
---@param Location FVector
---@return FVector
function UFLSpawn:ProjectPointOnGround(WorldContextObject, Location) end
---@param Actor AActor
---@param Transform FTransform
function UFLSpawn:FinishSpawning(Actor, Transform) end


---@class UFLStaticMeshSplitter : UBlueprintFunctionLibrary
UFLStaticMeshSplitter = {}

---@param InputActor AActor
---@return TArray<AActor>
function UFLStaticMeshSplitter:SplitStaticMeshByMaterial(InputActor) end
---@param StaticMeshComponent UStaticMeshComponent
---@param LODIndex int32
---@param ScreenSize float
function UFLStaticMeshSplitter:SetLodScreenSize(StaticMeshComponent, LODIndex, ScreenSize) end
---@param StaticMeshComponent UStaticMeshComponent
---@param Resolution int32
function UFLStaticMeshSplitter:SetLightMapResolution(StaticMeshComponent, Resolution) end
---@param StaticMesh UStaticMesh
---@param CoordinateIndex int32
function UFLStaticMeshSplitter:SetLightmapCoordinateIndex(StaticMesh, CoordinateIndex) end
---@param StaticMeshComponent UStaticMeshComponent
---@param TextureCoordIndex int32
---@param CustomData FVector2D
---@return boolean
function UFLStaticMeshSplitter:SetCustomDataInTexCoord(StaticMeshComponent, TextureCoordIndex, CustomData) end
---@param StaticMeshComponent UStaticMeshComponent
function UFLStaticMeshSplitter:RemoveCollisionFromLodSections(StaticMeshComponent) end
---@param Tint FLinearColor
---@param TextureIndex int32
---@return FVector2D
function UFLStaticMeshSplitter:PackTintAndTextureIndex(Tint, TextureIndex) end
---@param StaticMeshComponent UStaticMeshComponent
function UFLStaticMeshSplitter:CreateEmptyLod(StaticMeshComponent) end
---@param StaticMeshComponent UStaticMeshComponent
---@param SourceLodIndex int32
function UFLStaticMeshSplitter:CreateCopyOfExistingLod(StaticMeshComponent, SourceLodIndex) end
---@param StaticMesh UStaticMesh
function UFLStaticMeshSplitter:BuildStaticMesh(StaticMesh) end


---@class UFLSystem : UBlueprintFunctionLibrary
UFLSystem = {}

---@return boolean
function UFLSystem:IsSimulate() end
---@return boolean
function UFLSystem:IsShippingBuild() end
---@return boolean
function UFLSystem:IsReleaseBuild() end
---@return boolean
function UFLSystem:IsQABuild() end
---@param WorldContextObject UObject
---@return boolean
function UFLSystem:IsGameRunning(WorldContextObject) end
---@return boolean
function UFLSystem:IsEditor() end
---@return boolean
function UFLSystem:IsDevelopmentBuild() end
---@return boolean
function UFLSystem:IsBuild() end
---@return FString
function UFLSystem:GetProjectVersion() end
---@return FString
function UFLSystem:GetProjectRevision() end
---@return FString
function UFLSystem:GetProjectBeta() end
---@return ERadiusPlatformType
function UFLSystem:GetPlatform() end
---@return FString
function UFLSystem:GetInstallID() end
---@return FString
function UFLSystem:GetGPUBrand() end
---@return FString
function UFLSystem:GetGameVersionString() end
---@return FString
function UFLSystem:GetFullVersionString() end
---@param WorldContextObject UObject
---@return FString
function UFLSystem:GetCurrentSpeakersName(WorldContextObject) end
---@return FString
function UFLSystem:GetCurrentMicrophoneName() end
---@return FString
function UFLSystem:GetCPUVendor() end
---@return FString
function UFLSystem:GetCPUBrand() end
---@return FString
function UFLSystem:GetCoopVersionString() end


---@class UFLTexture2DArray : UBlueprintFunctionLibrary
UFLTexture2DArray = {}

---@param Textures TArray<UTexture2D>
---@return TArray<UTexture2DArrayWrapper>
function UFLTexture2DArray:Texture2DArray_SplitTexturesIntoValidGroups(Textures) end
---@param TextureArray UTexture2DArray
---@param Textures TArray<UTexture2D>
function UFLTexture2DArray:Texture2DArray_SetTextures(TextureArray, Textures) end
---@param TextureArray UTexture2DArray
---@return TArray<UTexture2D>
function UFLTexture2DArray:Texture2DArray_GetTextures(TextureArray) end


---@class UFindSessionsCallbackProxyRadius : UOnlineBlueprintCallProxyBase
---@field OnSuccess FFindSessionsCallbackProxyRadiusOnSuccess
---@field OnFailure FFindSessionsCallbackProxyRadiusOnFailure
UFindSessionsCallbackProxyRadius = {}

---@return UFindSessionsCallbackProxyRadius
function UFindSessionsCallbackProxyRadius:FindCoopSessions() end


---@class UGS_RadiusGunTools : UGS_GunTools
UGS_RadiusGunTools = {}


---@class UGS_StickyNest : UVRGripScriptBase
---@field NestType EStickyNestType
UGS_StickyNest = {}

---@param NewRotation FQuat
function UGS_StickyNest:SetNestRotation(NewRotation) end
---@param NewSpeed float
function UGS_StickyNest:SetMaxMoveSpeed(NewSpeed) end
---@param NewDistance float
function UGS_StickyNest:SetBreakDistance(NewDistance) end


---@class UGameConfig : URadiusConfigurationAssetBase
---@field Levels TMap<FGameplayTag, FLevelConfig>
---@field LevelsLoadingDelay float
---@field LevelDefaultTag FGameplayTag
---@field LevelMainMenuTag FGameplayTag
---@field LevelTutorialTag FGameplayTag
---@field GateLinks TArray<FGameplayTagsTuple>
---@field TimeGameStart FDateTime
---@field CoopSyncTimeSeconds float
---@field bPauseGameInIngameMenuInStandalone boolean
---@field TidePeriodInHours float
---@field TideTimeSkipInHours float
---@field TideAlarmStartSeconds float
---@field DayStartAt int32
---@field NightStartAt int32
---@field SpawnDistance float
---@field CommonNpcTag FGameplayTag
---@field CommonAnomalyTag FGameplayTag
---@field MultiplePlayersSpawnShiftRadius float
---@field MapConfigs TMap<FGameplayTag, FMapConfig>
---@field MarkerConfigs TArray<FMarkerConfig>
---@field AnomalyConfigs TMap<FGameplayTag, FAnomalyConfig>
---@field AnomalyTagToName TMap<FGameplayTag, FText>
---@field MaxGuestsInGame int32
---@field TriggerNoTutor FGameplayTag
---@field DetectorRange float
---@field TimeToResetShop float
---@field ShopVisitsToRemoveNewItemLabel int32
---@field DeathReasonToText TMap<FGameplayTag, FText>
UGameConfig = {}

---@param WorldContextObject UObject
---@return float
function UGameConfig:GetTidePeriodInHours(WorldContextObject) end
---@param WorldContextObject UObject
---@return FGameplayTag
function UGameConfig:GetCurrentLevelTag(WorldContextObject) end
---@param MapName FString
---@return FGameplayTag
function UGameConfig:FindTagByLevel(MapName) end
---@param MarkerTag FGameplayTag
---@param MarkerConfig FMarkerConfig
---@return boolean
function UGameConfig:FindMarkerConfig(MarkerTag, MarkerConfig) end


---@class UGrabSphere : USphereComponent
---@field bIsRightHand boolean
UGrabSphere = {}



---@class UHS_GrabLocation : USceneComponent
UHS_GrabLocation = {}


---@class UHTNDecorator_CanFireTraceTests : UHTNDecorator
---@field TargetActorKey FBlackboardKeySelector
---@field ShootLocationKey FBlackboardKeySelector
---@field TraceFromLocationKey FBlackboardKeySelector
---@field CollisionChannel ECollisionChannel
---@field bUseComplexCollision boolean
---@field bIgnoreSelf boolean
---@field TraceTargetCubeSideHalfLength float
---@field DrawDebugType EDrawDebugTrace::Type
---@field DebugColor FLinearColor
---@field DebugHitColor FLinearColor
---@field DebugDrawTime float
---@field ActorsToIgnoreBuffer TArray<AActor>
UHTNDecorator_CanFireTraceTests = {}



---@class UHTNDecorator_ConfigurableDistanceCheck : UHTNDecorator
---@field LocationSourceA FHTNLocationSource
---@field LocationSourceB FHTNLocationSource
---@field CheckMode EHTNDecoratorDistanceCheckMode
---@field DistanceRangeKey FBlackboardKeySelector
---@field CapsuleHalfHeight float
---@field CapsuleRadius float
---@field bAllMustPass boolean
---@field MinDistance float
---@field MaxDistance float
---@field A FBlackboardKeySelector
---@field B FBlackboardKeySelector
UHTNDecorator_ConfigurableDistanceCheck = {}



---@class UHTNDecorator_DoesPathExist : UHTNDecorator
---@field BlackboardKeyA FBlackboardKeySelector
---@field BlackboardKeyB FBlackboardKeySelector
---@field bUseSelf boolean
---@field PathQueryType EHTNPathExistanceQueryType::Type
---@field FilterClass TSubclassOf<UNavigationQueryFilter>
UHTNDecorator_DoesPathExist = {}



---@class UHTNDecorator_RadiusFocusScope : UHTNDecorator
---@field bSetNewFocus boolean
---@field FocusTarget FBlackboardKeySelector
---@field bObserveBlackboardValue boolean
---@field bUpdateFocalPointFromRotatorKeyEveryFrame boolean
---@field bUpdateFocalPointFromVectorKeyEveryFrame boolean
---@field bRestoreOldFocusOnExecutionFinish boolean
---@field FocusPriority uint8
---@field RotationKeyLookAheadDistance float
UHTNDecorator_RadiusFocusScope = {}



---@class UHTNDecorator_TraceTest_ThicknessCheck : UHTNDecorator
---@field TraceFrom FBlackboardKeySelector
---@field TraceFromZOffset float
---@field TraceTo FBlackboardKeySelector
---@field TraceToZOffset float
---@field CollisionChannel ECollisionChannel
---@field bUseComplexCollision boolean
---@field bIgnoreSelf boolean
---@field TraceShape EEnvTraceShape::Type
---@field TraceExtentX float
---@field TraceExtentY float
---@field TraceExtentZ float
---@field DrawDebugType EDrawDebugTrace::Type
---@field DebugColor FLinearColor
---@field DebugHitColor FLinearColor
---@field DebugDrawTime float
---@field ActorsToIgnoreBuffer TArray<AActor>
UHTNDecorator_TraceTest_ThicknessCheck = {}



---@class UHTNService_SetCanFireNow : UHTNService
---@field TargetActorKey FBlackboardKeySelector
---@field CanFireKey FBlackboardKeySelector
---@field bIgnoreSelf boolean
---@field CollisionChannel ECollisionChannel
---@field bUseComplexCollision boolean
---@field StopPredictionTime float
---@field DrawDebugType EDrawDebugTrace::Type
---@field DebugColor FLinearColor
---@field DebugHitColor FLinearColor
---@field DebugDrawTime float
---@field ActorsToIgnoreBuffer TArray<AActor>
---@field NPCConfig UNPCConfig
UHTNService_SetCanFireNow = {}



---@class UHTNService_SetShootLocation : UHTNService
---@field ShootLocationKey FBlackboardKeySelector
---@field EnemyKey FBlackboardKeySelector
---@field TargetLocationOffset FVector
---@field NPCConfig UNPCConfig
UHTNService_SetShootLocation = {}



---@class UHTNTask_EQSQueryCover : UHTNTask_BlackboardBase
---@field LocationBlackboardKey FBlackboardKeySelector
---@field EQSRequest FEQSParametrizedQueryExecutionRequestHTN
---@field MaxNumCandidatePlans int32
---@field Cost int32
UHTNTask_EQSQueryCover = {}



---@class UHealthComponent : UActorComponent
---@field OnDeath FHealthComponentOnDeath
---@field DifficultySettingsSubsystem URadiusDifficultySettingsSubsystem
UHealthComponent = {}

---@param Actor AActor
---@param Damage float
---@param DamageType UDamageType
---@param InstigatedBy AController
---@param DamageCauser AActor
function UHealthComponent:OnAnyDamageTaken(Actor, Damage, DamageType, InstigatedBy, DamageCauser) end
---@return float
function UHealthComponent:GetHealth() end


---@class UIniManager : UObject
UIniManager = {}

---@param Filename FString
function UIniManager:StoreInUserSave(Filename) end
---@param Filename FString
---@param Section FString
---@param Key FString
---@param Value FVector
---@return boolean
function UIniManager:SetVector(Filename, Section, Key, Value) end
---@param Filename FString
---@param Section FString
---@param Key FString
---@param Value FString
---@return boolean
function UIniManager:SetString(Filename, Section, Key, Value) end
---@param Filename FString
---@param Section FString
---@param Key FString
---@param Value int32
---@return boolean
function UIniManager:SetInt(Filename, Section, Key, Value) end
---@param Filename FString
---@param Section FString
---@param Key FString
---@param Value float
---@return boolean
function UIniManager:SetFloat(Filename, Section, Key, Value) end
---@param Filename FString
---@param Section FString
---@param Key FString
---@param bValue boolean
---@return boolean
function UIniManager:SetBool(Filename, Section, Key, bValue) end
---@param Filename FString
---@param Section FString
---@param Key FString
---@param DefaultValue FVector
---@return FVector
function UIniManager:GetVector(Filename, Section, Key, DefaultValue) end
---@param Filename FString
---@param Section FString
---@param Key FString
---@param DefaultValue FString
---@param SetIfMissing boolean
---@return FString
function UIniManager:GetString(Filename, Section, Key, DefaultValue, SetIfMissing) end
---@param Filename FString
---@param Section FString
---@param Key FString
---@param DefaultValue int32
---@param SetIfMissing boolean
---@return int32
function UIniManager:GetInt(Filename, Section, Key, DefaultValue, SetIfMissing) end
---@param Filename FString
---@param Section FString
---@param Key FString
---@param DefaultValue float
---@param SetIfMissing boolean
---@return float
function UIniManager:GetFloat(Filename, Section, Key, DefaultValue, SetIfMissing) end
---@param Filename FString
---@param Section FString
---@param Key FString
---@param DefaultValue boolean
---@param SetIfMissing boolean
---@return boolean
function UIniManager:GetBool(Filename, Section, Key, DefaultValue, SetIfMissing) end
---@param Filename FString
---@param Section FString
---@param Key FString
---@return boolean
function UIniManager:Exists(Filename, Section, Key) end


---@class UInputModifierBlockInput : UInputModifier
---@field ActionType EActionType
UInputModifierBlockInput = {}



---@class UItemsConfig : URadiusConfigurationAssetBase
---@field WeaponStaticDataTable UDataTable
---@field AmmoStaticDataTable UDataTable
---@field AmmoContainerStaticDataTable UDataTable
---@field AttachmentStaticDataTable UDataTable
---@field GeneralItemStaticDataTable UDataTable
---@field NestSettings UDataTable
---@field AmmoShellClass TSubclassOf<AActor>
---@field TimeToSleep float
---@field MainGripTag FGameplayTag
---@field DenyDistantGrippingTag FGameplayTag
---@field OnlyOwnerInteractionTag FGameplayTag
---@field DistanceGripTag FGameplayTag
---@field DetachGripTag FGameplayTag
---@field DenyItemUseTag FGameplayTag
---@field ShopItemMarkTag FGameplayTag
---@field TrashItemTag FGameplayTag
---@field FlashlightEnableMarkTag FGameplayTag
---@field ItemSilencerTag FGameplayTag
---@field ItemAmmoTag FGameplayTag
---@field ItemAmmoBoxTag FGameplayTag
---@field ItemMagazineTag FGameplayTag
---@field MissionContainerTag FGameplayTag
---@field LostAndFoundContainerTag FGameplayTag
UItemsConfig = {}



---@class UJoinSessionCallbackProxyRadius : UOnlineBlueprintCallProxyBase
---@field OnSuccess FJoinSessionCallbackProxyRadiusOnSuccess
---@field OnFailure FJoinSessionCallbackProxyRadiusOnFailure
---@field WorldContextObject UObject
UJoinSessionCallbackProxyRadius = {}

---@param WorldContextObject UObject
---@param SessionInfo FBlueprintSessionResult
---@param bShowLoadingScreen boolean
---@return UJoinSessionCallbackProxyRadius
function UJoinSessionCallbackProxyRadius:JoinRadiusGame(WorldContextObject, SessionInfo, bShowLoadingScreen) end


---@class ULevelLoadedEventTrigger : UObject
ULevelLoadedEventTrigger = {}


---@class ULootConfig : URadiusConfigurationAssetBase
---@field LootArray TMap<FGameplayTag, FLootTableConfig>
ULootConfig = {}



---@class ULyraAnimInstance : UAnimInstance
---@field GameplayTagPropertyMap FGameplayTagBlueprintPropertyMap
---@field GroundDistance float
ULyraAnimInstance = {}



---@class UMapMarkerComponent : UBillboardComponent
---@field PointConfigTag FGameplayTag
---@field AdditionalDisplayText TArray<FText>
UMapMarkerComponent = {}



---@class UMathCondition : UObject
UMathCondition = {}


---@class UMathCondition_Float : UMathCondition
---@field Value float
UMathCondition_Float = {}



---@class UMathCondition_Float_Equal : UMathCondition_Float
UMathCondition_Float_Equal = {}


---@class UMathCondition_Float_LessEqualThan : UMathCondition_Float
UMathCondition_Float_LessEqualThan = {}


---@class UMathCondition_Float_LessThan : UMathCondition_Float
UMathCondition_Float_LessThan = {}


---@class UMathCondition_Float_MoreEqualThan : UMathCondition_Float
UMathCondition_Float_MoreEqualThan = {}


---@class UMathCondition_Float_MoreThan : UMathCondition_Float
UMathCondition_Float_MoreThan = {}


---@class UMathCondition_Float_NotEqual : UMathCondition_Float
UMathCondition_Float_NotEqual = {}


---@class UMathCondition_Int : UMathCondition
---@field Value int32
UMathCondition_Int = {}



---@class UMathCondition_Int_Equal : UMathCondition_Int
UMathCondition_Int_Equal = {}


---@class UMathCondition_Int_LessEqualThan : UMathCondition_Int
UMathCondition_Int_LessEqualThan = {}


---@class UMathCondition_Int_LessThan : UMathCondition_Int
UMathCondition_Int_LessThan = {}


---@class UMathCondition_Int_MoreEqualThan : UMathCondition_Int
UMathCondition_Int_MoreEqualThan = {}


---@class UMathCondition_Int_MoreThan : UMathCondition_Int
UMathCondition_Int_MoreThan = {}


---@class UMathCondition_Int_NotEqual : UMathCondition_Int
UMathCondition_Int_NotEqual = {}


---@class UMissionObjective_DeliverItems : URadiusMissionObjectiveBase
UMissionObjective_DeliverItems = {}

---@return TArray<FString>
function UMissionObjective_DeliverItems:GetLostItemsUID() end


---@class UMissionObjective_GetArtefacts : UMissionObjective_GetItems
---@field SpawnPointTags TArray<FGameplayTag>
UMissionObjective_GetArtefacts = {}



---@class UMissionObjective_GetItems : URadiusMissionObjectiveBase
---@field ItemInstanceIDs TArray<FString>
---@field ObjectiveItemsTypesToDeliver TArray<FGameplayTag>
---@field ObjectiveItemsInstanceIDsToDeliver TArray<FString>
UMissionObjective_GetItems = {}

---@param PlayerContainerUID FString
function UMissionObjective_GetItems:OnInventoryChanged(PlayerContainerUID) end
---@param TaggedItems TArray<FGameplayTag>
---@param UidItems TArray<FString>
function UMissionObjective_GetItems:GetRequiredObjectiveItems(TaggedItems, UidItems) end


---@class UMissionObjective_GoToLocation : URadiusMissionObjectiveBase
---@field ReachedLocations TArray<FGameplayTag>
UMissionObjective_GoToLocation = {}



---@class UMissionsConfig : URadiusConfigurationAssetBase
---@field MissionRerollCost int32
---@field MissionCategories TArray<FMissionCategory>
---@field MissionPoints TMap<FGameplayTag, FLevelMissionPoints>
UMissionsConfig = {}

---@param CategoryId FGameplayTag
---@return FLinearColor
function UMissionsConfig:GetIconColorForCategory(CategoryId) end
---@param PointTag FGameplayTag
---@param OutLevel FGameplayTag
---@return FMissionPoint
function UMissionsConfig:FindMissionPoint(PointTag, OutLevel) end
---@param MissionId FGameplayTag
---@return FGameplayTag
function UMissionsConfig:FindCategoryByMissionId(MissionId) end


---@class UNPCConfig : URadiusConfigurationAssetBase
---@field AISightStaticDataTable UDataTable
---@field AIStimuliStaticDataTable UDataTable
---@field SensePriorityInfo TArray<FSensePriorityInfo>
---@field MaxSenseDistance float
---@field MatSoundProofMap TMap<UPhysicalMaterial, float>
---@field SoundProofMultiplierDefault float
---@field bIsHearingDebugEnabled boolean
---@field BulletCollisionTag FGameplayTag
---@field SuspiciousActivityLevel float
---@field DelayToStartReduceDetectionScale float
---@field ReduceScaleRate float
---@field TargetSocketNames TMap<EAISightTargetSockets, FName>
---@field DetectedTag FGameplayTag
---@field AlmostDetectedTag FGameplayTag
---@field TeamTag FGameplayTag
---@field LastKnownPositionTag FGameplayTag
---@field TargetPositionPredictionTag FGameplayTag
---@field FriendDeathSpottedTag FGameplayTag
---@field MinTracesNumNonBlockedForFullBody int32
---@field LightSourceOnTag FGameplayTag
---@field bEnablePredictionPointDebug boolean
---@field SightSockets TArray<FName>
---@field NotifyDistance float
---@field EnemyWarningTag FGameplayTag
---@field TeamLastKnownPositionTag FGameplayTag
---@field PointNotificationTag FGameplayTag
---@field NoAttackTag FGameplayTag
---@field AddAggroPtsMaxPerState TMap<ENPCState, float>
---@field ReduceAggroPtsMaxPerState TMap<ENPCState, float>
---@field AggroInfo FAggroInfo
---@field AIFactorClasses TArray<FAIFactorClasses>
---@field TargetWeightModifier float
---@field FactorReductionDelay float
---@field FactorReductionPointsPerSecond float
---@field StimuliActivityWeight float
---@field TargetActivityWeight float
---@field WeightGapToChangeTarget float
---@field AimSocketName FName
---@field NPCNumCheckLastKnownPos int32
---@field MaxNPCNumCanAttackAtTime int32
---@field StateTransitionInfo TArray<FStateTransitionInfo>
---@field bEnableOptimizationInEditor boolean
---@field NPCEnableCheckFrequency float
---@field NPCEnableDist float
---@field ForceAttackRange FFloatRange
---@field FireTargetSockets TArray<FName>
---@field MaxDistToHitThrough float
---@field TraceTargetCubeSideHalfLength float
---@field CreepAmbushes TMap<FString, FCreepAmbushData>
---@field AmbushChooseDist float
UNPCConfig = {}



---@class UNPCLib : UBlueprintFunctionLibrary
UNPCLib = {}

---@param Data FAmmoStaticData
---@param WithFleshDamage float
---@param WithArmorDamage float
---@param WithInitialVelocity float
function UNPCLib:UpdateAmmoStaticData(Data, WithFleshDamage, WithArmorDamage, WithInitialVelocity) end
---@param BlackboardComp UBlackboardComponent
---@param Key FBlackboardKeySelector
---@param Value FFloatRange
function UNPCLib:SetBlackboardValueAsRange(BlackboardComp, Key, Value) end
---@param InBroadcaster AActor
---@param InEnemy AActor
---@param InLastKnowLocation FVector
---@param EventRange float
---@param PassedInfoAge float
---@param InStrength float
---@param Tag FGameplayTag
function UNPCLib:ReportTeamEvent(InBroadcaster, InEnemy, InLastKnowLocation, EventRange, PassedInfoAge, InStrength, Tag) end
---@param World UWorld
function UNPCLib:ReinitNPC(World) end
---@param NoiseLocation FVector
---@param Loudness float
---@param Instigator AActor
---@param Tag FGameplayTag
function UNPCLib:RadiusReportNoiseEvent(NoiseLocation, Loudness, Instigator, Tag) end
---@param BlackboardComp UBlackboardComponent
---@param Key FBlackboardKeySelector
---@return FFloatRange
function UNPCLib:GetBlackboardValueAsRange(BlackboardComp, Key) end
---@param AIController AAIController
---@return FVector
function UNPCLib:GetAimLocation(AIController) end
---@param Character ACharacter
---@return FVector
function UNPCLib:GetActorFeetLocation(Character) end


---@class UObjectiveCfg_DeliverItems : URadiusMissionObjectiveConfigBase
---@field LostItemsObjective FText
UObjectiveCfg_DeliverItems = {}



---@class UObjectiveCfg_GetArtefacts : UObjectiveCfg_GetItems
---@field NestsIDs TArray<FGameplayTag>
UObjectiveCfg_GetArtefacts = {}



---@class UObjectiveCfg_GetItems : URadiusMissionObjectiveConfigBase
---@field ItemsIDs TArray<FGameplayTag>
---@field bAcceptOnlyPredefinedItems boolean
---@field SpawnSpots TArray<FGameplayTag>
UObjectiveCfg_GetItems = {}



---@class UObjectiveCfg_GoToLocation : URadiusMissionObjectiveConfigBase
UObjectiveCfg_GoToLocation = {}


---@class UPhysicalMaterialWithTags : UPhysicalMaterial
---@field Tags FGameplayTagContainer
UPhysicalMaterialWithTags = {}



---@class UPlayerConfig : URadiusConfigurationAssetBase
---@field MaxHealth float
---@field HealthSoundThresholdInPercent float
---@field HeartbeatIncreaseThresholdInPercent float
---@field MaxStamina float
---@field SprintStaminaCostPerSecond float
---@field JumpStaminaCost float
---@field StaminaRegenerationRateWhileStandingPerSecond float
---@field StaminaRegenerationRateWhileWalkingPerSecond float
---@field StaminaRegenerationDelayInSeconds float
---@field StaminaRegenerationDelayAfterFullyExhaustedInSeconds float
---@field StaminaBreathingThresholdInPercent float
---@field MaxHunger float
---@field HungerSpeedStanding float
---@field HungerSpeedWalking float
---@field HungerSpeedSprinting float
---@field HungerSpeedSleeping float
---@field WeakHungerThreshold float
---@field ModerateHungerThreshold float
---@field StrongHungerThreshold float
---@field HungerSoundFrequencyIfWeakHunger FMinMaxFloat
---@field HungerSoundFrequencyIfModerateHunger FMinMaxFloat
---@field HungerSoundFrequencyIfStrongHunger FMinMaxFloat
---@field ZeroHungerLimitingMaxStamina float
---@field StartingMoney int32
---@field StartingGear TArray<FAttachableItemInfo>
---@field ReplaceOnLeftHandedStartingGear TMap<FGameplayTag, FGameplayTag>
---@field DefaultWalkSpeed float
---@field DefaultSprintSpeed float
---@field DefaultCrouchSpeed float
---@field JumpZVelocity float
---@field WeightToMovementDecreasePercentSteps TMap<float, float>
---@field WeightToHungerSpeedIncreasePercentSteps TMap<float, float>
---@field WeightToStaminaConsumptionSpeedIncreasePercentSteps TMap<float, float>
---@field OverweightSlowdownCrouch boolean
---@field OverweightSlowdownWalk boolean
---@field OverweightSlowdownSprint boolean
---@field OverweightSpeedsUpHungerDecrease boolean
---@field OverweightIncreaseStaminaConsumptionForSprint boolean
---@field OverweightIncreaseStaminaConsumptionForJump boolean
---@field UnderwaterDepthA float
---@field UnderwaterDepthB float
---@field OxygenReserveInSeconds float
---@field DamageFromSuffocationInPercent float
---@field OxygenRestorationTimeInSeconds float
---@field MinDamageFromDangerousWaterInPercent float
---@field MaxDamageFromDangerousWaterInPercent float
---@field CurveDangerousWaterDamage UCurveFloat
---@field UnderwaterMinMovementSlowdownInPercent float
---@field UnderwaterMaxMovementSlowdownInPercent float
---@field CurveWaterDrag UCurveFloat
---@field UnderwaterSwampSlowdownMultiplier float
---@field UnderwaterJumpAffectingDepth float
---@field UnderwaterJumpAffectingStrength float
---@field HandsMaxLength float
---@field CalibrationBodyHeight float
---@field MaxCapsuleHeight float
---@field MinCapsuleHeight float
---@field MinBodyHeightToCrouch float
---@field MinBodyHeightToJump float
---@field MinStandingBodyHeight float
---@field MinCameraHeightToMove float
---@field MaxCameraHeight float
---@field MinCameraHeight float
---@field DistFromCameraBaseToCrown float
---@field CameraShiftForward float
---@field CameraShiftUp float
---@field LookDownAngle float
---@field UpperHorizontalDeadZoneRadius float
---@field LowerHorizontalDeadZoneRadius float
---@field LowerHorizontalDeadZoneHalfAngle float
---@field BodyTurnConfig FBodyTurningConfig
---@field BodyFollowHeadTurnConfig FBodyTurningConfig
---@field LowerVerticalDeadZoneSize float
---@field LowerInnerDeadZoneRadius float
---@field CrouchAnimationDuration float
---@field GripSphereRadius float
---@field DistanceGripSpeedCoeff float
---@field DistanceGripRadius float
---@field DistanceGripDeadZone float
---@field DistanceGripLength float
---@field DistanceGripFinishLerpingDistance float
---@field HelmetHolsterTag FGameplayTag
---@field LeftHandHolsterTag FGameplayTag
---@field LeftForearmHolsterTag FGameplayTag
---@field RightHandHolsterTag FGameplayTag
---@field RightForearmHolsterTag FGameplayTag
---@field VestHolsterTag FGameplayTag
---@field BackpackHolsterTag FGameplayTag
---@field TabletHolsterTag FGameplayTag
---@field SubtitlesDistanceFromCamera float
---@field SubtitlesMinAngleToReact float
---@field SubtitlesTimeToReact float
---@field SubtitlesRotationSpeed float
---@field SaveSubtitleDuration float
---@field SaveIconColor FLinearColor
---@field AutoSaveIconColor FLinearColor
---@field PlayerColors TMap<FGameplayTag, FLinearColor>
UPlayerConfig = {}

---@param TotalWeight float
---@return float
function UPlayerConfig:GetStaminaConsumptionIncreasePercentFromTotalWeight(TotalWeight) end
---@param TotalWeight float
---@return float
function UPlayerConfig:GetSlowdownPercentFromTotalWeight(TotalWeight) end
---@param TotalWeight float
---@return float
function UPlayerConfig:GetHungerSpeedIncreasePercentFromTotalWeight(TotalWeight) end


---@class UPlayerGripComponent : UActorComponent
---@field GripOverlapLeft FGripOverlap
---@field GripOverlapRight FGripOverlap
---@field Controllers TMap<EVRHand, TWeakObjectPtr<UGripMotionControllerComponent>>
---@field GrabSpheres TMap<EVRHand, TWeakObjectPtr<USphereComponent>>
---@field LeftHandLockedSockets TArray<URadiusHandSocketComponent>
---@field RightHandLockedSockets TArray<URadiusHandSocketComponent>
---@field MovementComponent TWeakObjectPtr<UVRCharacterMovementComponent>
---@field OnClimbingInitiated FPlayerGripComponentOnClimbingInitiated
---@field OnClimbingEnded FPlayerGripComponentOnClimbingEnded
---@field bIsHandClimbing boolean
---@field ClimbingHand EVRHand
---@field ClimbingObject TWeakObjectPtr<UPrimitiveComponent>
---@field ClimbingGripTransform FTransform
---@field bIsClimbingObjectRelative boolean
---@field DefaultGripTag FGameplayTag
---@field DefaultSecondaryGripTag FGameplayTag
---@field DefaultDropTag FGameplayTag
---@field DefaultSecondaryDropTag FGameplayTag
---@field bForceOverlapOnlyGripChecks boolean
---@field CollisionToCheckDuringGrip TArray<EObjectTypeQuery>
---@field CollisionToCheckForDistantGrip TArray<EObjectTypeQuery>
---@field CollisionToCheckDuringReverseLineTrace TArray<EObjectTypeQuery>
---@field bAlwaysAllowClimbing boolean
---@field GripTraceLength float
---@field bLimitMaxThrowVelocity boolean
---@field MaximumThrowingVelocity float
---@field MassScalerMin float
---@field ThrowingMassMaximum float
---@field bScaleVelocityByMass boolean
---@field bSampleGripVelocity boolean
---@field bUseControllerVelocityOnRelease boolean
---@field bDisableMovement boolean
UPlayerGripComponent = {}

---@param Hand EVRHand
---@param GripActor ARadiusGrippableActorBase
---@param bUseFakeGrip boolean
---@return boolean
function UPlayerGripComponent:UnlockGrip(Hand, GripActor, bUseFakeGrip) end
---@param Hand EVRHand
---@param Controller UGripMotionControllerComponent
---@param GrabSphere USphereComponent
function UPlayerGripComponent:SetupHand(Hand, Controller, GrabSphere) end
---@param bHolding boolean
function UPlayerGripComponent:SetHoldingX(bHolding) end
---@param bHolding boolean
function UPlayerGripComponent:SetHoldingA(bHolding) end
---@param Hand EVRHand
---@param GrippedObject UPrimitiveComponent
---@param RelativeTransform FTransform
function UPlayerGripComponent:OnClimbingInitiated__DelegateSignature(Hand, GrippedObject, RelativeTransform) end
function UPlayerGripComponent:OnClimbingEnded__DelegateSignature() end
---@param Hand EVRHand
---@param GripActor ARadiusGrippableActorBase
---@param HandSocket URadiusHandSocketComponent
---@param bUseFakeGrip boolean
---@return boolean
function UPlayerGripComponent:LockGrip(Hand, GripActor, HandSocket, bUseFakeGrip) end
---@param Hand EVRHand
---@param GripQueryType FGameplayTag
---@param HandSocket URadiusHandSocketComponent
---@return boolean
function UPlayerGripComponent:IsGripLocked(Hand, GripQueryType, HandSocket) end
---@return ACharacter
function UPlayerGripComponent:GetOwnerCharacter() end
---@param OverlappedActors TArray<AActor>
---@param GripTags FGameplayTagContainer
---@param MotionController UGripMotionControllerComponent
---@return TArray<URadiusHandSocketComponent>
function UPlayerGripComponent:GetOverlappedHandSockets(OverlappedActors, GripTags, MotionController) end
---@param Hand EVRHand
---@return USphereComponent
function UPlayerGripComponent:GetGrabSphere(Hand) end
---@param Hand EVRHand
---@return UGripMotionControllerComponent
function UPlayerGripComponent:GetController(Hand) end
---@param InputSocketArray TArray<URadiusHandSocketComponent>
---@param HandSockets TMap<FGameplayTag, URadiusHandSocketComponent>
---@param Hand EVRHand
---@param QueryController UGripMotionControllerComponent
---@param HandDirection FVector
---@param bOutDistanceGrip boolean
---@param bIsDistanceGrip boolean
function UPlayerGripComponent:FindClosestGrippableHandSockets(InputSocketArray, HandSockets, Hand, QueryController, HandDirection, bOutDistanceGrip, bIsDistanceGrip) end
---@param Hand EVRHand
---@param HandSocket URadiusHandSocketComponent
---@param bIsDistanceGrip boolean
function UPlayerGripComponent:FillGripOverlap(Hand, HandSocket, bIsDistanceGrip) end
---@param Hand EVRHand
---@param bTrigger boolean
function UPlayerGripComponent:DropGrip(Hand, bTrigger) end
---@param Hand EVRHand
function UPlayerGripComponent:ClearGripOverlap(Hand) end
---@param Hand EVRHand
---@param bIsPressed boolean
function UPlayerGripComponent:ChangePressedGrip(Hand, bIsPressed) end


---@class UPlayerGripConstraintComponent : UPhysicsConstraintComponent
UPlayerGripConstraintComponent = {}


---@class UPlayerHandsComponent : UActorComponent
---@field bDisableMovementCompletely boolean
---@field bInstantUpdateWhenMoving boolean
---@field bSweepInstantMovement boolean
---@field InstantMovementTeleportType ETeleportType
---@field MovementComponent TWeakObjectPtr<URadiusPlayerMovementComponent>
---@field PIDs TMap<EVRHand, FPIDConfig>
UPlayerHandsComponent = {}

---@param Hand EVRHand
---@param Shift FTransform
function UPlayerHandsComponent:UpdateShift(Hand, Shift) end
---@param Hand EVRHand
---@param bPidIsOn boolean
---@return boolean
function UPlayerHandsComponent:SwitchPidForHand(Hand, bPidIsOn) end
---@param Hand EVRHand
function UPlayerHandsComponent:StopDistanceLerp(Hand) end
---@param Hand EVRHand
---@param Controller UGripMotionControllerComponent
---@param PhysicsHand USkeletalMeshComponent
---@param GripConstraint UPhysicsConstraintComponent
---@param GrabSphere USphereComponent
function UPlayerHandsComponent:SetupHand(Hand, Controller, PhysicsHand, GripConstraint, GrabSphere) end
---@param Hand EVRHand
function UPlayerHandsComponent:InstantUpdate(Hand) end
---@param Hand EVRHand
---@param Primitive UPrimitiveComponent
---@param RelativeTransform FTransform_NetQuantize
function UPlayerHandsComponent:GripPrimitive(Hand, Primitive, RelativeTransform) end
---@param Hand EVRHand
---@param Actor AActor
---@param RelativeTransform FTransform_NetQuantize
function UPlayerHandsComponent:GripActor(Hand, Actor, RelativeTransform) end
---@param Hand EVRHand
function UPlayerHandsComponent:Drop(Hand) end
---@param Primitive UPrimitiveComponent
---@param Hand EVRHand
---@param GripRelativeLocation FVector
---@param GripRelativeRotation FQuat
function UPlayerHandsComponent:AddItemToDistanceLerp(Primitive, Hand, GripRelativeLocation, GripRelativeRotation) end


---@class UPlayerStatsComponent : UActorComponent
---@field OnPlayerHealthChangeAll FPlayerStatsComponentOnPlayerHealthChangeAll
---@field OnPlayerHealthChangeLocal FPlayerStatsComponentOnPlayerHealthChangeLocal
---@field OnPlayerDeathAll FPlayerStatsComponentOnPlayerDeathAll
---@field OnPlayerDeathLocal FPlayerStatsComponentOnPlayerDeathLocal
---@field CurrentHealth float
---@field OnPlayerStaminaChange FPlayerStatsComponentOnPlayerStaminaChange
---@field CurrentStamina float
---@field OnPlayerHungerChange FPlayerStatsComponentOnPlayerHungerChange
---@field CurrentHunger float
---@field GameData URadiusGameData
---@field CheatSubsystem URadiusCheatSubsystem
---@field PlayerMovementComponent URadiusPlayerMovementComponent
---@field VRMovementComponent UVRBaseCharacterMovementComponent
---@field TimeController ARadiusTimeController
UPlayerStatsComponent = {}

---@param NewStamina float
---@param NewHunger float
function UPlayerStatsComponent:Server_SetStaminaAndHungerUnreliable(NewStamina, NewHunger) end
---@param NewStamina float
---@param NewHunger float
function UPlayerStatsComponent:Server_SetStaminaAndHungerReliable(NewStamina, NewHunger) end
---@param StaminaDelta float
---@param HungerDelta float
function UPlayerStatsComponent:Server_ClientChangeStaminaAndHungerAndNotifyAll(StaminaDelta, HungerDelta) end
---@param Delta float
---@param DamageType UDamageType
---@param DamageCauser AActor
function UPlayerStatsComponent:Server_ChangeHealth(Delta, DamageType, DamageCauser) end
function UPlayerStatsComponent:OnRep_CurrentStamina() end
function UPlayerStatsComponent:OnRep_CurrentHunger() end
function UPlayerStatsComponent:OnRep_CurrentHealth() end
---@param Step ELevelLoadedEventStep
function UPlayerStatsComponent:OnLevelLoadedStep(Step) end
---@param OptionTag FGameplayTag
---@param ValueTag FGameplayTag
function UPlayerStatsComponent:OnDifficultyOptionChanged(OptionTag, ValueTag) end
---@param Actor AActor
---@param Damage float
---@param DamageType UDamageType
---@param InstigatedBy AController
---@param DamageCauser AActor
function UPlayerStatsComponent:OnAnyDamageTaken(Actor, Damage, DamageType, InstigatedBy, DamageCauser) end
---@return boolean
function UPlayerStatsComponent:IsAlive() end
---@return float
function UPlayerStatsComponent:GetStaminaPercent() end
---@return float
function UPlayerStatsComponent:GetStamina() end
---@return float
function UPlayerStatsComponent:GetMaxStaminaAffectedByHunger() end
---@return float
function UPlayerStatsComponent:GetJumpStaminaCost() end
---@return float
function UPlayerStatsComponent:GetHungerPercent() end
---@return EHungerLevel
function UPlayerStatsComponent:GetHungerLevel() end
---@return float
function UPlayerStatsComponent:GetHunger() end
---@return float
function UPlayerStatsComponent:GetHealth() end
---@param TimeChangeInSeconds float
function UPlayerStatsComponent:Client_UpdateHungerAfterTimeChange(TimeChangeInSeconds) end
---@param ChangedPlayerContainerID FString
function UPlayerStatsComponent:Client_OnWeightRecalculated(ChangedPlayerContainerID) end
---@param Stamina float
---@param Hunger float
function UPlayerStatsComponent:Client_InitStaminaAndHunger(Stamina, Hunger) end
---@param StaminaDelta float
---@param HungerDelta float
function UPlayerStatsComponent:Client_ChangeStaminaAndHungerAndNotifyAll(StaminaDelta, HungerDelta) end
---@param Delta float
function UPlayerStatsComponent:ChangeStaminaAndNotifyAll(Delta) end
---@param Delta float
function UPlayerStatsComponent:ChangeHungerAndNotifyAll(Delta) end


---@class UPreferHigherCover : UEnvQueryTest
UPreferHigherCover = {}


---@class URadiusAICoordinationSubsystem : URadiusWorldSubsystem
---@field NPCCoordinationMap TMap<ARadiusAIControllerBase, FNPCCoordinationInfo>
---@field NPCConfig UNPCConfig
---@field AttackRoleReserveTimerHandle FTimerHandle
---@field OptimizationTimerHandle FTimerHandle
---@field AmbushInfo TArray<FCreepAmbushInfo>
---@field VantageCoverVolumeInfos TMap<AActor, FCoverVolumeInfo>
---@field VantageCoverManager AVantageCoverManager
URadiusAICoordinationSubsystem = {}

---@param AIController ARadiusAIControllerBase
function URadiusAICoordinationSubsystem:UnRegisterNpc(AIController) end
---@param InController AController
function URadiusAICoordinationSubsystem:UnOccupyAmbush(InController) end
function URadiusAICoordinationSubsystem:SetAgentsStateIdleBeforeSave() end
---@param AIController ARadiusAIControllerBase
---@param AttackRoleDelegate FRequestAttackRoleAttackRoleDelegate
function URadiusAICoordinationSubsystem:RequestAttackRole(AIController, AttackRoleDelegate) end
---@param AIController ARadiusAIControllerBase
function URadiusAICoordinationSubsystem:RegisterNpc(AIController) end
---@param InController AController
---@param AmbushIdx int32
function URadiusAICoordinationSubsystem:OccupyAmbush(InController, AmbushIdx) end
---@param InVantageCoverManager AVantageCoverManager
function URadiusAICoordinationSubsystem:InitVantageCoverManager(InVantageCoverManager) end
---@param QuerierPawn AActor
---@param MaxAttackDist float
---@param bIsVantageVolume boolean
---@return TArray<AActor>
function URadiusAICoordinationSubsystem:GetRelevantVantageCoverVolumes(QuerierPawn, MaxAttackDist, bIsVantageVolume) end
---@param QuerierPawn AActor
---@return FCreepAmbushInfo
function URadiusAICoordinationSubsystem:GetAmbush(QuerierPawn) end
---@param Radius float
---@param QuerierPawn AActor
---@return TArray<APawn>
function URadiusAICoordinationSubsystem:GetAgentsInRadius(Radius, QuerierPawn) end
---@param AIController ARadiusAIControllerBase
function URadiusAICoordinationSubsystem:FreeAttackRole(AIController) end


---@class URadiusAIPerceptionComponent : UAIPerceptionComponent
---@field GameConfigSubsystem URadiusConfigurationSubsystem
---@field Config UNPCConfig
---@field Owner AActor
---@field AIPerceptionSystem UAIPerceptionSystem
---@field BodyActor AActor
---@field StimulusTarget AActor
---@field PriorBestTarget AActor
---@field AIFactorArray TArray<FAIFactors>
---@field TargetAIFactors TArray<UAIFactor>
---@field StimulusAIFactors TArray<UAIFactor>
---@field DamageValues TMap<AActor, float>
---@field Targets TMap<AActor, FTargetInfo>
---@field VisibleTargets TArray<AActor>
URadiusAIPerceptionComponent = {}

---@param Target AActor
---@return boolean
function URadiusAIPerceptionComponent:IsTargetVisible(Target) end
---@return TMap<AActor, FTargetInfo>
function URadiusAIPerceptionComponent:GetTargets() end
---@return AActor
function URadiusAIPerceptionComponent:GetBestStimulusTarget() end
function URadiusAIPerceptionComponent:ForgetPriorityStimulus() end


---@class URadiusAIPerceptionStimuliSourceComponent : UAIPerceptionStimuliSourceComponent
---@field GameConfigSubsystem URadiusConfigurationSubsystem
---@field GameplayTag FGameplayTag
URadiusAIPerceptionStimuliSourceComponent = {}



---@class URadiusAISenseConfig_Hearing : UAISenseConfig
---@field Implementation TSubclassOf<URadiusAISense_Hearing>
---@field HearingRange float
---@field LoSHearingRange float
---@field bUseLoSHearing boolean
---@field DetectionByAffiliation FAISenseAffiliationFilter
URadiusAISenseConfig_Hearing = {}



---@class URadiusAISenseConfig_Sight : UAISenseConfig
---@field Implementation TSubclassOf<URadiusAISense_Sight>
---@field SightRadius float
---@field LoseSightRadius float
---@field PeripheralVisionAngleDegrees float
---@field DetectionByAffiliation FAISenseAffiliationFilter
---@field AutoSuccessRangeFromLastSeenLocation float
---@field PointOfViewBackwardOffset float
---@field NearClippingRadius float
URadiusAISenseConfig_Sight = {}



---@class URadiusAISenseConfig_Team : UAISenseConfig
---@field Implementation TSubclassOf<UAISense>
URadiusAISenseConfig_Team = {}



---@class URadiusAISenseEvent_Hearing : UAISenseEvent
---@field Event FRadiusAINoiseEvent
URadiusAISenseEvent_Hearing = {}



---@class URadiusAISense_Hearing : UAISense
---@field NoiseEvents TArray<FRadiusAINoiseEvent>
---@field SpeedOfSoundSq float
URadiusAISense_Hearing = {}

---@param WorldContextObject UObject
---@param NoiseLocation FVector
---@param Loudness float
---@param Instigator AActor
---@param MaxRange float
---@param Tag FName
function URadiusAISense_Hearing:ReportNoiseEvent(WorldContextObject, NoiseLocation, Loudness, Instigator, MaxRange, Tag) end


---@class URadiusAISense_Sight : UAISense
---@field MaxTracesPerTick int32
---@field MaxAsyncTracesPerTick int32
---@field MinQueriesPerTimeSliceCheck int32
---@field MaxTimeSlicePerTick double
---@field HighImportanceQueryDistanceThreshold float
---@field MaxQueryImportance float
---@field SightLimitQueryImportance float
---@field PendingQueriesBudgetReductionRatio float
---@field bUseAsynchronousTraceForDefaultSightQueries boolean
URadiusAISense_Sight = {}



---@class URadiusAISense_Team : UAISense
---@field RegisteredEvents TArray<FRadiusAITeamStimulusEvent>
---@field GroupEnemiesInfos TMap<uint8, FGroupEnemiesInfo>
---@field NPCConfig UNPCConfig
URadiusAISense_Team = {}



---@class URadiusAISightZoneDebugComponent : UDynamicMeshComponent
---@field DistCentimeters float
---@field HorizontalAngle float
---@field VerticalAngle float
---@field SphereMesh UStaticMesh
---@field FrustumMesh UStaticMesh
---@field MaterialInterface UMaterialInterface
---@field bEnableComputeMeshPool boolean
---@field DynamicMeshPool UDynamicMeshPool
URadiusAISightZoneDebugComponent = {}

function URadiusAISightZoneDebugComponent:Update() end
---@param Radius float
---@param HAngle float
---@param VAngle float
function URadiusAISightZoneDebugComponent:Setup(Radius, HAngle, VAngle) end


---@class URadiusAnalyticsSubsystem : URadiusGameInstanceSubsystem
URadiusAnalyticsSubsystem = {}

---@return FString
function URadiusAnalyticsSubsystem:TryGetClientUniqueIdAsString() end
---@param MissionConfig USingleMissionConfig
function URadiusAnalyticsSubsystem:SendMissionConfigFailure(MissionConfig) end
---@return boolean
function URadiusAnalyticsSubsystem:IsStandalone() end
---@return boolean
function URadiusAnalyticsSubsystem:IsServer() end
---@param Player ARadiusPlayerCharacterGameplay
---@return boolean
function URadiusAnalyticsSubsystem:IsLocalPlayer(Player) end
---@return boolean
function URadiusAnalyticsSubsystem:IsInMainMenu() end
---@return boolean
function URadiusAnalyticsSubsystem:IsCoopSession() end
---@return boolean
function URadiusAnalyticsSubsystem:IsClient() end
---@return FString
function URadiusAnalyticsSubsystem:GetUserLocation() end
---@param PlayerState APlayerState
---@return FString
function URadiusAnalyticsSubsystem:GetUniqueIdFromPlayerStateAsString(PlayerState) end
---@return float
function URadiusAnalyticsSubsystem:GetRealPlaytimeInMinutes() end
---@return int32
function URadiusAnalyticsSubsystem:GetPlayerAccessLevel() end
---@return FString
function URadiusAnalyticsSubsystem:GetLocalPlayerUniqueId() end
---@return APlayerState
function URadiusAnalyticsSubsystem:GetLocalPlayerState() end
---@return URadiusLevelSubsystem
function URadiusAnalyticsSubsystem:GetLevelSubsystem() end
---@return FString
function URadiusAnalyticsSubsystem:GetHostUniqueIdAsString() end
---@return FString
function URadiusAnalyticsSubsystem:GetGPUBrandName() end
---@return FString
function URadiusAnalyticsSubsystem:GetGameUid() end
---@return FString
function URadiusAnalyticsSubsystem:GetGamePurchaseDateString() end
---@return URadiusGameDataSubsystem
function URadiusAnalyticsSubsystem:GetGameDataSubsystem() end
---@param GameDataReplicator ARadiusGameDataReplicator
---@return boolean
function URadiusAnalyticsSubsystem:GetGameDataReplicator(GameDataReplicator) end
---@return FString
function URadiusAnalyticsSubsystem:GetFirstSessionDateString() end
---@return URadiusEventsSubsystem
function URadiusAnalyticsSubsystem:GetEventsSubsystem() end
---@return URadiusDifficultySettingsSubsystem
function URadiusAnalyticsSubsystem:GetDifficultySettingsSubsystem() end
---@return FString
function URadiusAnalyticsSubsystem:GetCPUVendorName() end
---@return FString
function URadiusAnalyticsSubsystem:GetCPUBrandName() end
---@return URadiusConfigurationSubsystem
function URadiusAnalyticsSubsystem:GetConfigSubsystem() end
---@param IdToFind FUniqueNetIdRepl
---@param IsFound boolean
---@return APlayerState
function URadiusAnalyticsSubsystem:FindPlayerStateByUniqueNetId(IdToFind, IsFound) end


---@class URadiusArtefactNestSaveData : UObject
---@field bHasArtefact boolean
URadiusArtefactNestSaveData = {}



---@class URadiusBodyComponent : UActorComponent
---@field PlayerBodyRef USkeletalMeshComponent
URadiusBodyComponent = {}

function URadiusBodyComponent:SetInitialized() end
---@param BodyLocation FVector
---@param OldHeadLocation FVector
---@param Angle float
---@return FVector
function URadiusBodyComponent:GetHeadLocationAfterTurn(BodyLocation, OldHeadLocation, Angle) end


---@class URadiusBulletComponent : UActorComponent
---@field AmmoStaticData FAmmoStaticData
---@field BulletTag FName
---@field MaxImpactVelocity float
---@field DefaultDensity float
---@field NoiseLoudness float
---@field NoiseRange float
---@field DefaultMaterial UPhysicalMaterial
---@field MetalMaterial UPhysicalMaterial
---@field RicochetDegreesRange FVector2D
---@field PenetrationScale float
---@field PenetrationDensityInputRange FVector2D
---@field PenetrationDensityOutputRange FVector2D
---@field PenetrationConeDegreesRange FVector2D
---@field RicochetForceScale float
---@field DamageTypeClass TSubclassOf<URadiusDamageType>
---@field OnImpact FRadiusBulletComponentOnImpact
---@field OnRicochet FRadiusBulletComponentOnRicochet
---@field OnDestroy FRadiusBulletComponentOnDestroy
URadiusBulletComponent = {}

---@param HitResult FHitResult
---@param Velocity FVector
function URadiusBulletComponent:ProcessHit(HitResult, Velocity) end
---@param InAmmoData FAmmoStaticData
---@param InMuzzleVelocity float
---@param InDamageModifier float
---@param Owner AActor
function URadiusBulletComponent:Initialize(InAmmoData, InMuzzleVelocity, InDamageModifier, Owner) end


---@class URadiusBulletImpulseComponent : UActorComponent
---@field Target UPrimitiveComponent
---@field SpeedDropCurve TSoftObjectPtr<UCurveFloat>
---@field DistanceDivider float
---@field OnWhistleEvent FRadiusBulletImpulseComponentOnWhistleEvent
---@field OnStopped FRadiusBulletImpulseComponentOnStopped
---@field OnHit FRadiusBulletImpulseComponentOnHit
URadiusBulletImpulseComponent = {}

---@param IsSuspend boolean
function URadiusBulletImpulseComponent:Suspend(IsSuspend) end
function URadiusBulletImpulseComponent:Stop() end
function URadiusBulletImpulseComponent:Start() end
---@param Location FVector
---@param Force FVector
---@param IsPenetration boolean
function URadiusBulletImpulseComponent:Ricochet(Location, Force, IsPenetration) end


---@class URadiusBulletProjectileInfo : URadiusFirearmProjectileInfo
URadiusBulletProjectileInfo = {}

---@param InAmmoData FAmmoStaticData
---@param InVelocity float
---@param InBaseDamage float
---@param InForceTracer boolean
---@return URadiusBulletProjectileInfo
function URadiusBulletProjectileInfo:Initialize(InAmmoData, InVelocity, InBaseDamage, InForceTracer) end
---@param AmmoData FAmmoStaticData
---@param Velocity float
---@param BaseDamage float
---@param ForceTracer boolean
---@return URadiusBulletProjectileInfo
function URadiusBulletProjectileInfo:CreateInfo(AmmoData, Velocity, BaseDamage, ForceTracer) end


---@class URadiusBulletTracerComponent : UStaticMeshComponent
---@field TracerTag FGameplayTag
---@field DebugColor FColor
---@field DebugLineDuration float
---@field DebugLineThickness float
---@field DefaultScale float
---@field ScaleFactorInputRange FVector2D
---@field ScaleFactorOutputRange FVector2D
---@field StartDelay float
URadiusBulletTracerComponent = {}

---@param bSuspend boolean
function URadiusBulletTracerComponent:Suspend(bSuspend) end
function URadiusBulletTracerComponent:Stop() end
function URadiusBulletTracerComponent:Start() end
---@param ForceTracer boolean
---@param AmmoTypeID FGameplayTag
function URadiusBulletTracerComponent:Initialize(ForceTracer, AmmoTypeID) end


---@class URadiusCheatManager : UCheatManager
URadiusCheatManager = {}

---@param X float
---@param Y float
---@param Z float
---@param Yaw float
function URadiusCheatManager:TeleportPlayer(X, Y, Z, Yaw) end
---@param SaveNr int32
function URadiusCheatManager:SaveGame(SaveNr) end
function URadiusCheatManager:PrintPlayerRotation() end
function URadiusCheatManager:PrintPlayerLocation() end
function URadiusCheatManager:NoClip() end
---@param ProfileNr int32
---@param SaveNr int32
---@param bAutosave boolean
function URadiusCheatManager:LoadGame(ProfileNr, SaveNr, bAutosave) end
---@param ProfileNr int32
---@param bSinglePlayer boolean
---@param SaveNr int32
---@param bAutosave boolean
function URadiusCheatManager:DeleteSave(ProfileNr, bSinglePlayer, SaveNr, bAutosave) end
function URadiusCheatManager:AutoSave() end


---@class URadiusCheatSubsystem : URadiusGameInstanceSubsystem
URadiusCheatSubsystem = {}

---@param LevelTag FGameplayTag
function URadiusCheatSubsystem:TravelTo(LevelTag) end
function URadiusCheatSubsystem:ToggleControllerVisibility() end
function URadiusCheatSubsystem:SwitchNoClip() end
function URadiusCheatSubsystem:SpawnStartingGear() end
function URadiusCheatSubsystem:SetTideTime() end
---@param Value float
function URadiusCheatSubsystem:SetSpeedCheatValue(Value) end
---@param bTurnOn boolean
function URadiusCheatSubsystem:SetSpeedCheat(bTurnOn) end
---@param bEnable boolean
function URadiusCheatSubsystem:SetShowPlayerName(bEnable) end
---@param bNewShowControllers boolean
function URadiusCheatSubsystem:SetShowControllers(bNewShowControllers) end
---@param bTurnOn boolean
function URadiusCheatSubsystem:SetNoClip(bTurnOn) end
---@param bEnable boolean
function URadiusCheatSubsystem:SetMagReloadCheat(bEnable) end
---@param bTurnOn boolean
function URadiusCheatSubsystem:SetJumpAllowed(bTurnOn) end
---@param bEnable boolean
function URadiusCheatSubsystem:SetInvisibleMode(bEnable) end
---@param bEnable boolean
function URadiusCheatSubsystem:SetInfiniteAmmoCheat(bEnable) end
---@param bEnable boolean
function URadiusCheatSubsystem:SetImmortalMode(bEnable) end
---@param bEnable boolean
function URadiusCheatSubsystem:SetGodMode(bEnable) end
---@param AccessLevel int32
function URadiusCheatSubsystem:SetAccessLevel(AccessLevel) end
function URadiusCheatSubsystem:RegenerateLoot() end
---@return boolean
function URadiusCheatSubsystem:IsSpeedCheat() end
---@return boolean
function URadiusCheatSubsystem:IsShowPlayerName() end
---@return boolean
function URadiusCheatSubsystem:IsMagReloadCheat() end
---@return boolean
function URadiusCheatSubsystem:IsJumpAllowed() end
---@return boolean
function URadiusCheatSubsystem:IsInvisibleMode() end
---@return boolean
function URadiusCheatSubsystem:IsInfiniteAmmoCheat() end
---@return boolean
function URadiusCheatSubsystem:IsImmortalMode() end
---@return boolean
function URadiusCheatSubsystem:IsGodMode() end
---@return float
function URadiusCheatSubsystem:GetSpeedCheatValue() end
---@return boolean
function URadiusCheatSubsystem:GetShowControllers() end
---@return APawn
function URadiusCheatSubsystem:GetOwner() end
---@return boolean
function URadiusCheatSubsystem:GetNoClip() end
function URadiusCheatSubsystem:DestroyAllItemsAndData() end
function URadiusCheatSubsystem:CrashGame() end
---@param AccessPoints int32
function URadiusCheatSubsystem:AddAccessPoints(AccessPoints) end


---@class URadiusCommonGameData : ULocalPlayerSaveGame
---@field SaveDateTime FDateTime
---@field IsFirstGameStart boolean
---@field FirstSessionDateString FString
---@field LastProfile int32
---@field bTutorialFinished boolean
---@field VisitedCoopGames TArray<FVisitedCoopGame>
---@field TotalSeconds float
URadiusCommonGameData = {}

---@param SessionInfo FBlueprintSessionResult
function URadiusCommonGameData:UpdateVisitedCoopGames(SessionInfo) end
function URadiusCommonGameData:SetTutorialFinished() end
---@param ProfileNum int32
function URadiusCommonGameData:SetLastProfile(ProfileNum) end
function URadiusCommonGameData:SetFirstStartDisable() end
---@return boolean
function URadiusCommonGameData:IsFirstStart() end
---@param SessionInfo FBlueprintSessionResult
---@return boolean
function URadiusCommonGameData:HadVisitedCoopGame(SessionInfo) end
---@return float
function URadiusCommonGameData:GetTotalPlayTimeInSeconds() end
---@param GameInfo FVisitedCoopGame
function URadiusCommonGameData:ForgetVisitedCoopGame(GameInfo) end
---@param CoopGame FVisitedCoopGame
---@param FoundSessions TArray<FBlueprintSessionResult>
---@param bFound boolean
---@param SessionInfo FBlueprintSessionResult
function URadiusCommonGameData:FindGameInSessions(CoopGame, FoundSessions, bFound, SessionInfo) end
function URadiusCommonGameData:AddTimeStampIfNeeded() end


---@class URadiusCondition : UObject
URadiusCondition = {}


---@class URadiusCondition_FloatCheck : URadiusCondition
---@field ValueCheck UMathCondition_Float
URadiusCondition_FloatCheck = {}



---@class URadiusCondition_IntCheck : URadiusCondition
---@field ValueCheck UMathCondition_Int
URadiusCondition_IntCheck = {}



---@class URadiusCondition_MORCheck : URadiusCondition
---@field Minimum int32
---@field Conditions TArray<URadiusCondition>
URadiusCondition_MORCheck = {}



---@class URadiusCondition_MinimumPlayerLevelCheck : URadiusCondition
---@field MinimumPlayerLevel int32
URadiusCondition_MinimumPlayerLevelCheck = {}



---@class URadiusCondition_MissionAmountCheck : URadiusCondition_IntCheck
URadiusCondition_MissionAmountCheck = {}


---@class URadiusCondition_MissionCheck : URadiusCondition_Trigger
---@field bIsFinished boolean
URadiusCondition_MissionCheck = {}



---@class URadiusCondition_MoneyCheck : URadiusCondition_FloatCheck
URadiusCondition_MoneyCheck = {}


---@class URadiusCondition_ORCheck : URadiusCondition
---@field ORConditions TArray<URadiusCondition>
URadiusCondition_ORCheck = {}



---@class URadiusCondition_PlayerAccessPointsCheck : URadiusCondition_IntCheck
---@field AccessPointsThreshold int32
URadiusCondition_PlayerAccessPointsCheck = {}



---@class URadiusCondition_PlayerLevelCheck : URadiusCondition
---@field PlayerLevelRange FMinMaxInt
URadiusCondition_PlayerLevelCheck = {}



---@class URadiusCondition_Trigger : URadiusCondition
---@field TriggerTag FGameplayTag
URadiusCondition_Trigger = {}



---@class URadiusCondition_TriggerCheck : URadiusCondition_Trigger
---@field PassedCheck boolean
URadiusCondition_TriggerCheck = {}



---@class URadiusConfigReportSubsystem : URadiusGameInstanceSubsystem
---@field IniManager UIniManager
URadiusConfigReportSubsystem = {}

---@param Data TMap<FString, FString>
function URadiusConfigReportSubsystem:WriteData(Data) end


---@class URadiusConfigurationAssetBase : UPrimaryDataAsset
URadiusConfigurationAssetBase = {}


---@class URadiusConfigurationSubsystem : URadiusGameInstanceSubsystem
---@field ItemsConfig UItemsConfig
---@field MissionConfig UMissionsConfig
---@field GameConfig UGameConfig
---@field PlayerConfig UPlayerConfig
---@field WeaponConfig UWeaponDefaultsConfig
---@field NPCConfig UNPCConfig
---@field SystemConfig USystemConfig
---@field LootConfig ULootConfig
---@field DifficultyConfig UDifficultyConfig
---@field Configurations TMap<UClass, URadiusConfigurationAssetBase>
---@field AIFactors TArray<FAIFactors>
URadiusConfigurationSubsystem = {}

---@param SwapResult FSwapAudioOutputResult
function URadiusConfigurationSubsystem:SwapResult(SwapResult) end
---@param AvailableDevices TArray<FAudioOutputDeviceInfo>
function URadiusConfigurationSubsystem:SwapOutputDevices(AvailableDevices) end
function URadiusConfigurationSubsystem:SetupConfigValues() end
---@param ItemType FGameplayTag
---@return FStimuliData
function URadiusConfigurationSubsystem:GetStimulusDataByTag(ItemType) end
---@param ItemId FGameplayTag
---@param ItemActor TSoftClassPtr<AActor>
---@return boolean
function URadiusConfigurationSubsystem:GetRadiusItemClassByTag(ItemId, ItemActor) end
---@param ItemType FGameplayTag
---@param OutData FWeaponStaticData
---@return boolean
function URadiusConfigurationSubsystem:GetPureWeaponStaticDataByTag(ItemType, OutData) end
---@param ActorClass TSubclassOf<AActor>
---@return FPoolActorConfig
function URadiusConfigurationSubsystem:GetPoolActorConfig(ActorClass) end
---@param ItemType FGameplayTag
---@return FRadiusNPCStaticData
function URadiusConfigurationSubsystem:GetNPCStaticDataByTag(ItemType) end
---@param NPCBody APawn
---@return FRadiusNPCStaticData
function URadiusConfigurationSubsystem:GetNPCData(NPCBody) end
---@param ItemClass TSoftClassPtr<AActor>
---@return FGameplayTag
function URadiusConfigurationSubsystem:GetItemTagBySoftClass(ItemClass) end
---@param ItemActor AActor
---@return FGameplayTag
function URadiusConfigurationSubsystem:GetItemTagByClass(ItemActor) end
---@return UDifficultyConfig
function URadiusConfigurationSubsystem:GetDifficultyConfig() end
---@param DeathReason FGameplayTag
---@return FText
function URadiusConfigurationSubsystem:GetDeathReasonTextByTag(DeathReason) end
---@param ControllerType FGameplayTag
---@param OutTransform FTransform
---@return boolean
function URadiusConfigurationSubsystem:GetControllerTransformAdjustment(ControllerType, OutTransform) end
---@param ItemType FGameplayTag
---@param OutData FRadiusItemStaticData
---@return boolean
function URadiusConfigurationSubsystem:GetBasicStaticDataByTag(ItemType, OutData) end
---@param AnomalyType FGameplayTag
---@return FText
function URadiusConfigurationSubsystem:GetAnomalyNameByTag(AnomalyType) end
---@param ItemType FGameplayTag
---@param OutData FAmmoStaticData
---@return boolean
function URadiusConfigurationSubsystem:GetAmmoStaticDataByTag(ItemType, OutData) end
---@param ItemType FGameplayTag
---@param OutData FAmmoContainerStaticData
---@return boolean
function URadiusConfigurationSubsystem:GetAmmoContainerStaticDataByTag(ItemType, OutData) end
---@param Actor AActor
---@param Material UPhysicalMaterial
---@param DefaultRow FName
---@param ImpactAssetRow FRadiusImpactAssetRow
---@return boolean
function URadiusConfigurationSubsystem:FindImpactAssetData(Actor, Material, DefaultRow, ImpactAssetRow) end
---@param AmmoCaliber FGameplayTag
---@param AmmoType FGameplayTag
---@param OutData FAmmoStaticData
---@return boolean
function URadiusConfigurationSubsystem:FindAmmoStaticData(AmmoCaliber, AmmoType, OutData) end


---@class URadiusContainerSubsystem : URadiusTickableWorldSubsystem
---@field InventoryContainers TMap<FString, FItemContainerData>
---@field HolstersAndHolders TMap<FString, UObject>
---@field RelevantHandContainers TMap<EVRHand, UObject>
---@field RelevantHandContainersForAttachedItems TMap<EVRHand, UObject>
---@field ItemsInHands TMap<EVRHand, AActor>
---@field HandToAttachedItem TMap<EVRHand, AActor>
URadiusContainerSubsystem = {}

---@param ContainerUid FString
function URadiusContainerSubsystem:UnregisterHolster(ContainerUid) end
---@param Hand EVRHand
---@param bAttachedItem boolean
---@return boolean
function URadiusContainerSubsystem:TryAttachItemToMostRelevantHolster(Hand, bAttachedItem) end
---@param Hand EVRHand
function URadiusContainerSubsystem:RemoveItemFromTrack(Hand) end
---@param Hand EVRHand
function URadiusContainerSubsystem:RemoveAttachedItemFromTrack(Hand) end
---@param ContainerUid FString
---@param ContainerObject UObject
function URadiusContainerSubsystem:RegisterHolster(ContainerUid, ContainerObject) end
function URadiusContainerSubsystem:PrintContainersStructure() end
---@param ContainerID FString
---@return boolean
function URadiusContainerSubsystem:IsPlayerContainerID(ContainerID) end
---@param ContainerUid FString
---@param InitialTransform FTransform
---@return FTransform
function URadiusContainerSubsystem:GetWorldTransform(ContainerUid, InitialTransform) end
---@param ContainerID FString
---@return FString
function URadiusContainerSubsystem:GetTopParentContainerID(ContainerID) end
---@param ContainerID FString
---@param ContainerObject UObject
---@param ParentID FString
---@param RelativeTransform FTransform
---@param bUpdateContainerObject boolean
---@return FItemContainerData
function URadiusContainerSubsystem:GetOrCreateItemContainer(ContainerID, ContainerObject, ParentID, RelativeTransform, bUpdateContainerObject) end
---@param Hand EVRHand
---@return UObject
function URadiusContainerSubsystem:GetMostRelevantContainer(Hand) end
---@param ContainerID FString
---@param bFound boolean
---@param ContainerData FItemContainerData
function URadiusContainerSubsystem:GetItemContainerBP(ContainerID, bFound, ContainerData) end
---@return TMap<FString, FItemContainerData>
function URadiusContainerSubsystem:GetContainers() end
---@param ContainerID FString
---@return UObject
function URadiusContainerSubsystem:GetContainerObject(ContainerID) end
---@param Player AActor
---@param Items TArray<ARadiusItemBase>
---@return boolean
function URadiusContainerSubsystem:GetAllPlayerItems(Player, Items) end
---@param ParentContainerID FString
---@param bIncludeChildren boolean
---@return TArray<FString>
function URadiusContainerSubsystem:GetAllChildContainerIDs(ParentContainerID, bIncludeChildren) end
---@param Hand EVRHand
---@param bAttachedItem boolean
---@return boolean
function URadiusContainerSubsystem:CanAttachItemToMostRelevantHolster(Hand, bAttachedItem) end
---@param Hand EVRHand
---@param Item AActor
function URadiusContainerSubsystem:AddItemToTrack(Hand, Item) end
---@param ContainerID FString
---@param ParentID FString
---@param RelativeTransform FTransform
function URadiusContainerSubsystem:AddContainerToContainer(ContainerID, ParentID, RelativeTransform) end
---@param Hand EVRHand
---@param AttachedItem AActor
function URadiusContainerSubsystem:AddAttachedItemToTrack(Hand, AttachedItem) end


---@class URadiusCoopSubsystem : URadiusGameInstanceSubsystem
URadiusCoopSubsystem = {}

---@param FriendInfo FBPFriendInfo
---@return EBlueprintResultSwitch
function URadiusCoopSubsystem:SendInvite(FriendInfo) end


---@class URadiusCrashAnalyticsSubsystem : URadiusGameInstanceSubsystem
---@field SentrySubsystem USentrySubsystem
URadiusCrashAnalyticsSubsystem = {}

function URadiusCrashAnalyticsSubsystem:OnSettingsChanged() end
function URadiusCrashAnalyticsSubsystem:OnLevelLoaded() end
---@param Settings USentrySettings
function URadiusCrashAnalyticsSubsystem:HandleSettingsDelegate(Settings) end


---@class URadiusDamageType : UDamageType
---@field DamageCategory EDamageCategory
---@field DamageHandler UDamageHandler
URadiusDamageType = {}



---@class URadiusDataComponent : UActorComponent
---@field OnDataLinked FRadiusDataComponentOnDataLinked
---@field OnDataUnlinking FRadiusDataComponentOnDataUnlinking
---@field GameplayTags FGameplayTagContainer
---@field ItemDynamicDataPtr TWeakObjectPtr<URadiusItemDynamicData>
---@field OnDataReplicated FRadiusDataComponentOnDataReplicated
URadiusDataComponent = {}

function URadiusDataComponent:OnRep_ItemDynamicDataPtr() end
---@param HolsterComponent URadiusHolsterComponent
---@param RadiusItem ARadiusGrippableActorBase
---@param bHasAttached boolean
function URadiusDataComponent:OnHolsteredItemChanged(HolsterComponent, RadiusItem, bHasAttached) end


---@class URadiusDifficultySettingsSubsystem : URadiusGameInstanceSubsystem
URadiusDifficultySettingsSubsystem = {}

---@param OptionTag FGameplayTag
---@param ValueTag FGameplayTag
function URadiusDifficultySettingsSubsystem:Set(OptionTag, ValueTag) end
---@return float
function URadiusDifficultySettingsSubsystem:GetTimeToTide() end
---@return boolean
function URadiusDifficultySettingsSubsystem:GetShowSubtitles() end
---@return boolean
function URadiusDifficultySettingsSubsystem:GetShowPlayersOnMap() end
---@return float
function URadiusDifficultySettingsSubsystem:GetMissionRewards() end
---@return FGameplayTag
function URadiusDifficultySettingsSubsystem:GetLootAmount() end
---@return float
function URadiusDifficultySettingsSubsystem:GetItemsSellPrice() end
---@return float
function URadiusDifficultySettingsSubsystem:GetItemsDurability() end
---@return FGameplayTag
function URadiusDifficultySettingsSubsystem:GetItemsDroppedOnDeath() end
---@return boolean
function URadiusDifficultySettingsSubsystem:GetIronMan() end
---@return float
function URadiusDifficultySettingsSubsystem:GetHunger() end
---@return boolean
function URadiusDifficultySettingsSubsystem:GetFriendlyFire() end
---@return float
function URadiusDifficultySettingsSubsystem:GetEnemySpotTimeModifier() end
---@return float
function URadiusDifficultySettingsSubsystem:GetEnemySpotDistanceModifier() end
---@return float
function URadiusDifficultySettingsSubsystem:GetEnemyHearingDistModifier() end
---@return float
function URadiusDifficultySettingsSubsystem:GetEnemyHealth() end
---@return float
function URadiusDifficultySettingsSubsystem:GetEnemyDamageModifier() end
---@return float
function URadiusDifficultySettingsSubsystem:GetEnemyAmount() end
---@return FGameplayTag
function URadiusDifficultySettingsSubsystem:GetBulletTracers() end
---@return float
function URadiusDifficultySettingsSubsystem:GetAnomaliesDamage() end
---@return float
function URadiusDifficultySettingsSubsystem:GetAnomaliesAmount() end
---@param BasePrice float
---@return int32
function URadiusDifficultySettingsSubsystem:CalcSellPrice(BasePrice) end


---@class URadiusEventsSubsystem : URadiusGameInstanceSubsystem
---@field OnGameDataSaved FRadiusEventsSubsystemOnGameDataSaved
---@field OnGameDataLoaded FRadiusEventsSubsystemOnGameDataLoaded
---@field OnCommonGameDataSaved FRadiusEventsSubsystemOnCommonGameDataSaved
---@field OnCommonGameDataLoaded FRadiusEventsSubsystemOnCommonGameDataLoaded
---@field OnGlobalTriggersChange FRadiusEventsSubsystemOnGlobalTriggersChange
---@field OnGameStart FRadiusEventsSubsystemOnGameStart
---@field OnMainMenuLoaded FRadiusEventsSubsystemOnMainMenuLoaded
---@field OnReplicatorCreated FRadiusEventsSubsystemOnReplicatorCreated
---@field OnSettingsChanged FRadiusEventsSubsystemOnSettingsChanged
---@field OnDifficultyOptionChanged FRadiusEventsSubsystemOnDifficultyOptionChanged
---@field OnCoopVersionsMismatch FRadiusEventsSubsystemOnCoopVersionsMismatch
---@field OnStartLoadLevel FRadiusEventsSubsystemOnStartLoadLevel
---@field OnFinishLoadLevel FRadiusEventsSubsystemOnFinishLoadLevel
---@field OnLoadLevelStep FRadiusEventsSubsystemOnLoadLevelStep
---@field OnArtefactNestSpawned FRadiusEventsSubsystemOnArtefactNestSpawned
---@field OnArtefactNestDestroyed FRadiusEventsSubsystemOnArtefactNestDestroyed
---@field OnFirstPlayerEnteredShop FRadiusEventsSubsystemOnFirstPlayerEnteredShop
---@field OnSwitchLoadingScreen FRadiusEventsSubsystemOnSwitchLoadingScreen
---@field OnMissionListUpdate FRadiusEventsSubsystemOnMissionListUpdate
---@field OnMissionStarted FRadiusEventsSubsystemOnMissionStarted
---@field OnMissionFinished FRadiusEventsSubsystemOnMissionFinished
---@field OnPlayerWalking FRadiusEventsSubsystemOnPlayerWalking
---@field OnPlayerRunning FRadiusEventsSubsystemOnPlayerRunning
---@field OnPlayerDied FRadiusEventsSubsystemOnPlayerDied
---@field OnPlayerPossessedPawn FRadiusEventsSubsystemOnPlayerPossessedPawn
---@field OnPlayerPostPossessedPawn FRadiusEventsSubsystemOnPlayerPostPossessedPawn
---@field OnAccessLevelChanged FRadiusEventsSubsystemOnAccessLevelChanged
---@field OnAccessLvlPointsChanged FRadiusEventsSubsystemOnAccessLvlPointsChanged
---@field OnPlayerDeathPointsChanged FRadiusEventsSubsystemOnPlayerDeathPointsChanged
---@field OnPlayerKill FRadiusEventsSubsystemOnPlayerKill
---@field OnSleep FRadiusEventsSubsystemOnSleep
---@field OnItemGripped FRadiusEventsSubsystemOnItemGripped
---@field OnItemGrippedFirstTime FRadiusEventsSubsystemOnItemGrippedFirstTime
---@field OnItemDropped FRadiusEventsSubsystemOnItemDropped
---@field OnContainerChangeParent FRadiusEventsSubsystemOnContainerChangeParent
---@field OnContainerChildrenChange FRadiusEventsSubsystemOnContainerChildrenChange
---@field OnPlayerInventoryChanged FRadiusEventsSubsystemOnPlayerInventoryChanged
---@field OnItemStackChange FRadiusEventsSubsystemOnItemStackChange
---@field OnAssetsLoaded FRadiusEventsSubsystemOnAssetsLoaded
---@field OnGameTimeChanged FRadiusEventsSubsystemOnGameTimeChanged
---@field OnGameTimeChangedSignificantly FRadiusEventsSubsystemOnGameTimeChangedSignificantly
---@field OnGameTimeRefresh FRadiusEventsSubsystemOnGameTimeRefresh
---@field OnDayNightChanged FRadiusEventsSubsystemOnDayNightChanged
---@field OnTideEventHappening FRadiusEventsSubsystemOnTideEventHappening
---@field OnMoneyChanged FRadiusEventsSubsystemOnMoneyChanged
---@field OnAshesChanged FRadiusEventsSubsystemOnAshesChanged
---@field OnTutorialStarted FRadiusEventsSubsystemOnTutorialStarted
---@field OnTutorialFinished FRadiusEventsSubsystemOnTutorialFinished
---@field OnIngameMenuOpened FRadiusEventsSubsystemOnIngameMenuOpened
---@field OnIngameMenuClosed FRadiusEventsSubsystemOnIngameMenuClosed
---@field OnSplashScreenShown FRadiusEventsSubsystemOnSplashScreenShown
---@field OnPlayerConnected FRadiusEventsSubsystemOnPlayerConnected
---@field OnPlayerDisconnected FRadiusEventsSubsystemOnPlayerDisconnected
---@field OnHostGame FRadiusEventsSubsystemOnHostGame
URadiusEventsSubsystem = {}

---@param bShow boolean
function URadiusEventsSubsystem:FireSwitchLoadingScreen(bShow) end
---@param TutorialTag FString
function URadiusEventsSubsystem:FireOnTutorialStarted(TutorialTag) end
---@param TutorialID FString
---@param CompletedStepsNum int32
---@param Seconds int32
---@param IsTutorialSkipped boolean
function URadiusEventsSubsystem:FireOnTutorialFinished(TutorialID, CompletedStepsNum, Seconds, IsTutorialSkipped) end
---@param LevelTag FGameplayTag
function URadiusEventsSubsystem:FireOnStartLoadLevel(LevelTag) end
function URadiusEventsSubsystem:FireOnSplashScreenShown() end
---@param Location FVector
function URadiusEventsSubsystem:FireOnSleep(Location) end
function URadiusEventsSubsystem:FireOnSettingsChanged() end
function URadiusEventsSubsystem:FireOnReplicatorCreated() end
function URadiusEventsSubsystem:FireOnPlayerRunning() end
---@param NPCTag FGameplayTag
---@param Weapon AActor
---@param NPCLocation FVector
---@param DistanceToNPC int32
function URadiusEventsSubsystem:FireOnPlayerKill(NPCTag, Weapon, NPCLocation, DistanceToNPC) end
---@param PlayerUID FString
function URadiusEventsSubsystem:FireOnPlayerInventoryChanged(PlayerUID) end
---@param UniqueNetId FUniqueNetIdRepl
function URadiusEventsSubsystem:FireOnPlayerDisconnected(UniqueNetId) end
function URadiusEventsSubsystem:FireOnPlayerDeathPointsChanged() end
---@param UniqueNetId FUniqueNetIdRepl
function URadiusEventsSubsystem:FireOnPlayerConnected(UniqueNetId) end
---@param Mission UAvailableMission
function URadiusEventsSubsystem:FireOnMissionStarted(Mission) end
function URadiusEventsSubsystem:FireOnMissionListUpdate() end
---@param Mission UAvailableMission
---@param State EMissionCompleteState
---@param CurrentObjectiveIndex int32
function URadiusEventsSubsystem:FireOnMissionFinished(Mission, State, CurrentObjectiveIndex) end
function URadiusEventsSubsystem:FireOnMainMenuLoaded() end
---@param NewLvlPoints int32
function URadiusEventsSubsystem:FireOnLvlPointsChanged(NewLvlPoints) end
---@param Step ELevelLoadedEventStep
function URadiusEventsSubsystem:FireOnLoadLevelStep(Step) end
function URadiusEventsSubsystem:FireOnIngameMenuOpened() end
function URadiusEventsSubsystem:FireOnIngameMenuClosed() end
function URadiusEventsSubsystem:FireOnHostGame() end
function URadiusEventsSubsystem:FireOnGlobalTriggersChange() end
function URadiusEventsSubsystem:FireOnGameStart() end
function URadiusEventsSubsystem:FireOnGameDataSaved() end
function URadiusEventsSubsystem:FireOnGameDataLoaded() end
function URadiusEventsSubsystem:FireOnFirstPlayerEnteredShop() end
function URadiusEventsSubsystem:FireOnFinishLoadLevel() end
---@param OptionTag FGameplayTag
---@param ValueTag FGameplayTag
function URadiusEventsSubsystem:FireOnDifficultyOptionChanged(OptionTag, ValueTag) end
function URadiusEventsSubsystem:FireOnCoopVersionsMismatch() end
function URadiusEventsSubsystem:FireOnCommonGameDataSaved() end
function URadiusEventsSubsystem:FireOnCommonGameDataLoaded() end
---@param Nest AActor
function URadiusEventsSubsystem:FireOnArtefactNestSpawned(Nest) end
---@param Nest AActor
function URadiusEventsSubsystem:FireOnArtefactNestDestroyed(Nest) end
---@param NewLevel int32
function URadiusEventsSubsystem:FireOnAccessLevelChanged(NewLevel) end


---@class URadiusFirearmComponent : UBoxComponent
---@field ChamberAmmoSound USoundBase
---@field GameplayTags FGameplayTagContainer
---@field bCanLoadToChamber boolean
---@field EjectForceMultipliers FMinMaxVector
---@field bDrawEjectionDebug boolean
---@field bCanShootCacheForABP boolean
---@field bShouldEject boolean
---@field OnFireModeChanged FRadiusFirearmComponentOnFireModeChanged
---@field OnShootInputChanged FRadiusFirearmComponentOnShootInputChanged
---@field OnSliderLock FRadiusFirearmComponentOnSliderLock
---@field OnAmmoInserted FRadiusFirearmComponentOnAmmoInserted
---@field RelevantMuzzle UActorComponent
---@field RelevantMagazine UActorComponent
---@field bHasShootInput boolean
---@field InternalBullets TArray<UActorComponent>
URadiusFirearmComponent = {}

function URadiusFirearmComponent:TryShoot() end
---@param bIsManual boolean
---@return boolean
function URadiusFirearmComponent:TryReload(bIsManual) end
---@return boolean
function URadiusFirearmComponent:TryNextAutomaticFire() end
---@param bOn boolean
function URadiusFirearmComponent:ToggleChamberLoading(bOn) end
---@return FGameplayTag
function URadiusFirearmComponent:SwitchNextFireMode() end
function URadiusFirearmComponent:StartFire() end
function URadiusFirearmComponent:ShootNext() end
---@param bSet boolean
---@param bForce boolean
---@return boolean
function URadiusFirearmComponent:SetSliderLock(bSet, bForce) end
---@param NewFireMode FGameplayTag
function URadiusFirearmComponent:SetCurrentFireMode(NewFireMode) end
---@param AmmoTag FGameplayTag
---@param Index int32
---@return boolean
function URadiusFirearmComponent:SetAmmoInChamberTag(AmmoTag, Index) end
---@param BulletTag FGameplayTag
function URadiusFirearmComponent:Server_ShootProjectile(BulletTag) end
---@param NewInput boolean
function URadiusFirearmComponent:Server_SetShootingInput(NewInput) end
---@param Index int32
function URadiusFirearmComponent:ReplaceBulletWithShell(Index) end
function URadiusFirearmComponent:OnRep_bHasShootInput() end
---@param Tag FGameplayTag
---@param bAdded boolean
function URadiusFirearmComponent:OnItemAdditionalTagChanged(Tag, bAdded) end
---@param PreviousDynamicData URadiusItemDynamicData
function URadiusFirearmComponent:OnDynamicDataUnlinked(PreviousDynamicData) end
function URadiusFirearmComponent:OnDynamicDataLinked() end
---@param OverlappedComponent UPrimitiveComponent
---@param OtherActor AActor
---@param OtherComp UPrimitiveComponent
---@param OtherBodyIndex int32
---@param bFromSweep boolean
---@param HitResult FHitResult
function URadiusFirearmComponent:OnBeginOverlap(OverlappedComponent, OtherActor, OtherComp, OtherBodyIndex, bFromSweep, HitResult) end
---@param BulletTag FGameplayTag
function URadiusFirearmComponent:Multicast_ShootProjectile(BulletTag) end
---@return boolean
function URadiusFirearmComponent:IsSliderLock() end
---@return boolean
function URadiusFirearmComponent:IsOnSafety() end
---@param AmmoType FGameplayTag
---@return boolean
function URadiusFirearmComponent:IsAcceptsAmmoType(AmmoType) end
function URadiusFirearmComponent:InitializeMagazine() end
---@return boolean
function URadiusFirearmComponent:HasAmmoInBarrel() end
---@return FGameplayTag
function URadiusFirearmComponent:GetCurrentFireModeTag() end
function URadiusFirearmComponent:EndFire() end
---@return FGameplayTag
function URadiusFirearmComponent:EjectChamber() end
---@return boolean
function URadiusFirearmComponent:DeliverAmmoFromMagToChamber() end
---@return boolean
function URadiusFirearmComponent:CanShoot() end


---@class URadiusFirearmProjectileInfo : URadiusProjectileInfo
URadiusFirearmProjectileInfo = {}


---@class URadiusGameData : ULocalPlayerSaveGame
---@field ProfileNr int32
---@field bSinglePlayer boolean
---@field SingleGameID FString
---@field CoopGameID FString
---@field bIronman boolean
---@field CurrentLevelTag FGameplayTag
---@field PreviousLevelTag FGameplayTag
---@field bLoadingFromSave boolean
---@field Money int32
---@field Ash int32
---@field AccessLevel int32
---@field AccessLvlPoints int32
---@field NewItemLabelCounters TArray<int32>
---@field TimeData FRadiusTimeData
---@field PlayersData TArray<FRadiusPlayerGameData>
---@field SaveMessage FString
---@field SavedItems TArray<FRadiusSavedItem>
---@field LosslessItems TMap<FString, FRadiusLosslessItem>
---@field CreatedUniqueItems TArray<FString>
---@field GlobalTriggers TArray<FGameplayTag>
---@field UID int64
---@field PlayersAddedStartingGear TArray<FUniqueNetIdRepl>
---@field FinishedMissions TArray<FGameplayTag>
---@field SavedMissions TArray<FRadiusSerializedObject>
---@field SavedObjectives TArray<FRadiusSerializedObject>
---@field SavedMissionConfigs TArray<FRadiusSerializedObject>
---@field SavedObjectiveConfigs TArray<FRadiusSerializedObject>
---@field SavedGroups TMap<FString, FGroupSpawnDataContainer>
---@field SavedSpawners TMap<FString, FPointSpawnDataContainer>
---@field SavedNpc TMap<FString, FRadiusNpcGameDataContainer>
---@field SavedAnomaly TMap<FString, FRadiusAnomalyGameDataContainer>
---@field SavedArtefactNest TMap<FString, FRadiusAnomalyGameDataContainer>
---@field SavedLootSpawnGroup TMap<FString, FLootSpawnGroupDataContainer>
---@field SavedLootSpawnPoint TMap<FString, FLootSpawnPointDataContainer>
---@field SavedArtefactSpawnPoint TMap<FString, FArtefactSpawnPointDataContainer>
---@field AnomalySaveData TMap<FString, FRadiusSerializedObject>
---@field ArtefactNestsSaveData TMap<FString, FRadiusSerializedObject>
---@field DifficultySettings TMap<FGameplayTag, FGameplayTag>
URadiusGameData = {}

---@return float
function URadiusGameData:GetRealPlaytimeMinutes() end
---@return float
function URadiusGameData:GetPlaytimeMinutes() end
---@return TMap<FGameplayTag, FGameplayTag>
function URadiusGameData:GetDifficultySettings() end
---@param WorldContextObject UObject
function URadiusGameData:ClearDynamicDatas(WorldContextObject) end


---@class URadiusGameDataSubsystem : URadiusGameInstanceSubsystem
---@field SinglePlayerProfilesNumber int32
---@field SinglePlayerManualSavesNumber int32
---@field SinglePlayerAutoSavesNumber int32
---@field MultiplayerHostProfilesNumber int32
---@field MultiplayerGuestSlotsNumber int32
---@field MultiplayerManualSavesNumber int32
---@field MultiplayerAutoSavesNumber int32
---@field MinSinglePlayerProfileNumber int32
---@field MinSinglePlayerManualSaveNumber int32
---@field MinSinglePlayerAutoSaveNumber int32
---@field MinMultiplayerHostProfileNumber int32
---@field MinMultiplayerGuestSlotNumber int32
---@field MinMultiplayerManualSaveNumber int32
---@field MinMultiplayerAutoSaveNumber int32
---@field EditorProfileNumber int32
---@field PrintLogs boolean
---@field GameData URadiusGameData
---@field CommonGameData URadiusCommonGameData
---@field GameDataReplicator ARadiusGameDataReplicator
URadiusGameDataSubsystem = {}

function URadiusGameDataSubsystem:UnloadGameData() end
---@param ContainerID FString
---@param ItemTypeID FGameplayTag
---@param ItemInstanceID FString
---@return boolean
function URadiusGameDataSubsystem:SaveLosslessItem(ContainerID, ItemTypeID, ItemInstanceID) end
---@param ProfileNr int32
---@param SaveNr int32
function URadiusGameDataSubsystem:SaveGameData(ProfileNr, SaveNr) end
function URadiusGameDataSubsystem:SaveCommonGameData() end
---@param ProfileNr int32
---@param SaveNr int32
---@param bAutosave boolean
---@param bSinglePlayer boolean
---@return URadiusGameData
function URadiusGameDataSubsystem:ReadGameData(ProfileNr, SaveNr, bAutosave, bSinglePlayer) end
function URadiusGameDataSubsystem:OnFirstGameDataLevelLoaded() end
---@param ProfileNr int32
---@param SaveNr int32
---@param bAutosave boolean
---@param bSinglePlayer boolean
function URadiusGameDataSubsystem:LoadGameData(ProfileNr, SaveNr, bAutosave, bSinglePlayer) end
function URadiusGameDataSubsystem:LevelUp() end
---@param ProfileNr int32
---@param bSinglePlayer boolean
---@return boolean
function URadiusGameDataSubsystem:HasSaves(ProfileNr, bSinglePlayer) end
---@param ProfileNum int32
---@param bSinglePlayer boolean
---@param bAutosave boolean
---@return boolean
function URadiusGameDataSubsystem:HasProfileSavesByParameters(ProfileNum, bSinglePlayer, bAutosave) end
---@param ProfileNr int32
---@return boolean
function URadiusGameDataSubsystem:HasProfileSaves(ProfileNr) end
---@param Money int32
---@return boolean
function URadiusGameDataSubsystem:HasMoney(Money) end
---@param LevelPoints int32
---@return boolean
function URadiusGameDataSubsystem:HasLevelPoints(LevelPoints) end
---@param SaveNr int32
---@param bAutosave boolean
---@return FString
function URadiusGameDataSubsystem:GetSaveName(SaveNr, bAutosave) end
---@param ProfileNr int32
---@param SaveNr int32
---@param bAutosave boolean
---@param bSinglePlayer boolean
---@param SaveInfo FSaveInfo
---@return boolean
function URadiusGameDataSubsystem:GetSaveInfo(ProfileNr, SaveNr, bAutosave, bSinglePlayer, SaveInfo) end
---@param ProfileNr int32
---@param bSinglePlayer boolean
---@param ProfileInfo FProfileInfo
---@return boolean
function URadiusGameDataSubsystem:GetProfileInfo(ProfileNr, bSinglePlayer, ProfileInfo) end
---@param ProfileNr int32
---@param bSinglePlayer boolean
---@return FString
function URadiusGameDataSubsystem:GetProfileFolderPath(ProfileNr, bSinglePlayer) end
---@param bSinglePlayer boolean
---@param bAutosave boolean
---@return int32
function URadiusGameDataSubsystem:GetMinSaveNumber(bSinglePlayer, bAutosave) end
---@param bSinglePlayer boolean
---@return int32
function URadiusGameDataSubsystem:GetMinProfileNumber(bSinglePlayer) end
---@param bSinglePlayer boolean
---@param bAutosave boolean
---@return int32
function URadiusGameDataSubsystem:GetMaxSaveNumber(bSinglePlayer, bAutosave) end
---@param bSinglePlayer boolean
---@return int32
function URadiusGameDataSubsystem:GetMaxProfileNumber(bSinglePlayer) end
---@return int32
function URadiusGameDataSubsystem:GetLastProfileNum() end
---@param WorldContextObject UObject
---@return ARadiusGameDataReplicator
function URadiusGameDataSubsystem:GetGameDataReplicator(WorldContextObject) end
---@return URadiusGameData
function URadiusGameDataSubsystem:GetGameData() end
---@return URadiusCommonGameData
function URadiusGameDataSubsystem:GetCommonGameData() end
---@return FString
function URadiusGameDataSubsystem:GetAbsoluteDataPath() end
---@param ProfileNr int32
---@param SaveNr int32
---@param bAutosave boolean
---@param bSinglePlayer boolean
function URadiusGameDataSubsystem:DeleteSave(ProfileNr, SaveNr, bAutosave, bSinglePlayer) end
---@param ProfileNr int32
---@param bSinglePlayer boolean
---@param bIsTutorialEnabled boolean
---@param DifficultySettings TMap<FGameplayTag, FGameplayTag>
---@param bShouldClearProfile boolean
---@return boolean
function URadiusGameDataSubsystem:CreateNewGameData(ProfileNr, bSinglePlayer, bIsTutorialEnabled, DifficultySettings, bShouldClearProfile) end
---@param ProfileNr int32
---@param bSinglePlayer boolean
---@return boolean
function URadiusGameDataSubsystem:Continue(ProfileNr, bSinglePlayer) end
---@param ProfileNr int32
---@param bSinglePlayer boolean
function URadiusGameDataSubsystem:ClearProfile(ProfileNr, bSinglePlayer) end
---@param ProfileNr int32
---@param SaveNr int32
---@param bAutosave boolean
---@param bSinglePlayer boolean
---@return boolean
function URadiusGameDataSubsystem:CheckSave(ProfileNr, SaveNr, bAutosave, bSinglePlayer) end
---@param ProfileNr int32
---@param bSinglePlayer boolean
---@return boolean
function URadiusGameDataSubsystem:CheckProfile(ProfileNr, bSinglePlayer) end
function URadiusGameDataSubsystem:AutoSaveGameDataWithConditions() end
function URadiusGameDataSubsystem:AutoSaveGameData() end
---@param NewMission UAvailableMission
function URadiusGameDataSubsystem:AddNewMission(NewMission) end
---@param DeltaMoney int32
---@param AnalyticsString FString
---@param MoneyChangeReason EMoneyChangeReason
function URadiusGameDataSubsystem:AddMoney(DeltaMoney, AnalyticsString, MoneyChangeReason) end
---@param DeltaLevelPoints int32
function URadiusGameDataSubsystem:AddLevelPoints(DeltaLevelPoints) end
---@param DeltaAsh int32
function URadiusGameDataSubsystem:AddAsh(DeltaAsh) end


---@class URadiusGameInstance : UAdvancedFriendsGameInstance
---@field SplashDescriptions TArray<FRadiusSplashDesc>
---@field SeamlessTravelActorsList TArray<AActor>
---@field IngameMenuClass TSubclassOf<AActor>
---@field bIsSaveLoadTemporarilyDisabled boolean
---@field LevelLoadedEventTrigger ULevelLoadedEventTrigger
---@field BPRadiusCheatSubsystem TSubclassOf<URadiusCheatSubsystem>
---@field BPRadiusAnalyticsSubsystem TSubclassOf<URadiusGameInstanceSubsystem>
URadiusGameInstance = {}

function URadiusGameInstance:OnLevelLoaded() end
function URadiusGameInstance:OnGameStart() end
function URadiusGameInstance:ExitGame() end


---@class URadiusGameInstanceSubsystem : UGameInstanceSubsystem
URadiusGameInstanceSubsystem = {}

function URadiusGameInstanceSubsystem:OnStart() end
function URadiusGameInstanceSubsystem:OnShutdown() end


---@class URadiusHandSocketComponent : UHandSocketComponent
---@field SocketPriority uint8
---@field bUseActorLocationForSelector boolean
---@field AdditionalSlotTags FGameplayTagContainer
---@field bIsSecondary boolean
---@field bTriggerOnly boolean
---@field bDenyDistanceGrip boolean
---@field AllowedHands EVRHand
---@field ControllerType FGameplayTag
---@field SystConfig USystemConfig
URadiusHandSocketComponent = {}

---@param bShowMesh boolean
function URadiusHandSocketComponent:SetShowVisualizationMesh(bShowMesh) end
---@param bNewIsSecondary boolean
function URadiusHandSocketComponent:SetIsSecondary(bNewIsSecondary) end
---@param bNewDenyDistanceGrip boolean
function URadiusHandSocketComponent:SetDenyDistanceGrip(bNewDenyDistanceGrip) end
---@param Hand EVRHand
---@return boolean
function URadiusHandSocketComponent:IsSlotForHand(Hand) end
---@return FGameplayTagContainer
function URadiusHandSocketComponent:GetSocketGrabTag() end
---@return FVector
function URadiusHandSocketComponent:GetHandSocketWorldLocation() end
---@param QueryController UGripMotionControllerComponent
---@param bIgnoreOnlySnapMesh boolean
---@return FTransform
function URadiusHandSocketComponent:GetHandSocketTransformBP(QueryController, bIgnoreOnlySnapMesh) end


---@class URadiusHolsterComponent : USceneComponent
---@field OnHolsterComponentInitialized FRadiusHolsterComponentOnHolsterComponentInitialized
---@field OnItemHolsterAttachChanged FRadiusHolsterComponentOnItemHolsterAttachChanged
---@field HolsterID FGameplayTag
---@field bOnlyOwnerCanInteract boolean
---@field bDisableWhenOnPlayer boolean
---@field bDisableWhenNotInHands boolean
---@field bCanBeArmored boolean
---@field bCanDistanceGripStoredItems boolean
---@field AllowedGripTags FGameplayTagContainer
---@field bPreventCollisionWithAttachedItem boolean
---@field bOnlyGripInOverlapZone boolean
---@field bOnlyDetachTopAttachment boolean
---@field bVisualHandLock boolean
---@field bOnlyGripItemByMainHandSocket boolean
---@field bIsDisabled boolean
---@field OptionalCollision UShapeComponent
---@field HolsteredActor ARadiusGrippableActorBase
---@field HolsterCacheForReps ARadiusGrippableActorBase
---@field OverlappedGrabSpheres TArray<USphereComponent>
URadiusHolsterComponent = {}

function URadiusHolsterComponent:WaitForSyncTransformComponent() end
---@param ItemActor AActor
function URadiusHolsterComponent:UpdateItemAsInContainer(ItemActor) end
function URadiusHolsterComponent:SpawnSavedItems() end
---@param ActorToHolster ARadiusGrippableActorBase
function URadiusHolsterComponent:SetHolsteredActor(ActorToHolster) end
---@param bNewDisabled boolean
function URadiusHolsterComponent:SetHolsterDisabled(bNewDisabled) end
function URadiusHolsterComponent:RemoveHolsteredActor() end
function URadiusHolsterComponent:PreInitialize() end
function URadiusHolsterComponent:OnRep_HolsteredActor() end
---@param OverlappedComponent UPrimitiveComponent
---@param OtherActor AActor
---@param OtherComp UPrimitiveComponent
---@param OtherBodyIndex int32
function URadiusHolsterComponent:OnEndOverlapCustomCollision(OverlappedComponent, OtherActor, OtherComp, OtherBodyIndex) end
---@param PreviousDynamicData URadiusItemDynamicData
function URadiusHolsterComponent:OnDataUnlinking(PreviousDynamicData) end
---@param OverlappedComponent UPrimitiveComponent
---@param OtherActor AActor
---@param OtherComp UPrimitiveComponent
---@param OtherBodyIndex int32
---@param bFromSweep boolean
---@param SweepResult FHitResult
function URadiusHolsterComponent:OnBeginOverlapCustomCollision(OverlappedComponent, OtherActor, OtherComp, OtherBodyIndex, bFromSweep, SweepResult) end
---@return boolean
function URadiusHolsterComponent:IsReadyToHolster() end
---@return boolean
function URadiusHolsterComponent:IsDisabled() end
function URadiusHolsterComponent:InitializeContainer_Internal() end
---@param OtherActor AActor
---@param OverlapComponent UPrimitiveComponent
function URadiusHolsterComponent:HandleHolsterEndOverlap(OtherActor, OverlapComponent) end
---@param MotionController UGripMotionControllerComponent
---@param GripInfo FBPActorGripInformation
function URadiusHolsterComponent:HandleHolsteredActorGrip(MotionController, GripInfo) end
---@param OtherActor AActor
---@param OverlapComponent UPrimitiveComponent
function URadiusHolsterComponent:HandleHolsterBeginOverlap(OtherActor, OverlapComponent) end
---@return FString
function URadiusHolsterComponent:GetOwnerContainerUid() end
---@return ARadiusGrippableActorBase
function URadiusHolsterComponent:GetHolsteredActor() end
---@param ActorTag FGameplayTag
---@return FTransform
function URadiusHolsterComponent:GetAdditionalTransformByTag(ActorTag) end
function URadiusHolsterComponent:DoInstantHolster() end
---@param ItemActor AActor
---@param ItemDynamicData URadiusItemDynamicData
function URadiusHolsterComponent:Continue_SpawnSavedItems(ItemActor, ItemDynamicData) end
---@param HolsterComponent URadiusHolsterComponent
function URadiusHolsterComponent:Continue_InstantHolsterActor(HolsterComponent) end
function URadiusHolsterComponent:Continue_InitializeContainer_Internal() end


---@class URadiusIngameMenuSubsystem : URadiusWorldSubsystem
---@field IngameMenu AActor
URadiusIngameMenuSubsystem = {}

function URadiusIngameMenuSubsystem:ToggleIngameMenu() end
---@param bOn boolean
function URadiusIngameMenuSubsystem:SwitchIngameMenu(bOn) end
---@return boolean
function URadiusIngameMenuSubsystem:IsInIngameMenu() end


---@class URadiusInputModifier_TurnDeadZone : UInputModifierDeadZone
URadiusInputModifier_TurnDeadZone = {}

function URadiusInputModifier_TurnDeadZone:OnSettingsChanged() end


---@class URadiusInputModifier_WalkDeadZone : UInputModifier
URadiusInputModifier_WalkDeadZone = {}

function URadiusInputModifier_WalkDeadZone:UpdateThreshold() end


---@class URadiusInputTrigger_Crouch : UInputTrigger
URadiusInputTrigger_Crouch = {}


---@class URadiusInputTrigger_IndexGrip : UInputTrigger
URadiusInputTrigger_IndexGrip = {}


---@class URadiusInputTrigger_Jump : UInputTrigger
URadiusInputTrigger_Jump = {}


---@class URadiusInputTrigger_Turn : UInputTriggerTimedBase
---@field bTriggerOnStart boolean
---@field Interval float
---@field TriggerLimit int32
---@field bIsSnapTurn boolean
URadiusInputTrigger_Turn = {}



---@class URadiusItemConditionalComponent : UStaticMeshComponent
---@field ShowConditionTag FGameplayTag
URadiusItemConditionalComponent = {}

---@param PreviousDynamicData URadiusItemDynamicData
function URadiusItemConditionalComponent:OnDataUnlinking(PreviousDynamicData) end
function URadiusItemConditionalComponent:OnDataLinked() end
---@param Tag FGameplayTag
---@param bAdded boolean
function URadiusItemConditionalComponent:OnAdditionalTagChanged(Tag, bAdded) end
---@return boolean
function URadiusItemConditionalComponent:CheckCondition() end


---@class URadiusItemDynamicData : UObject
---@field InstanceUid FString
---@field ActorReference TWeakObjectPtr<AActor>
---@field Attachments TArray<URadiusItemDynamicData>
---@field ContainingItemTagsStack TArray<FGameplayTag>
---@field ContainingShellsInStack TArray<boolean>
---@field DynamicLocation FVector_NetQuantize
---@field DynamicRotation FVector_NetQuantize
---@field ParentContainerUid FString
---@field Durability float
---@field ItemType FGameplayTag
---@field Upgrades TArray<FGameplayTag>
---@field OnStackChanged FRadiusItemDynamicDataOnStackChanged
---@field OnDurabilityChanged FRadiusItemDynamicDataOnDurabilityChanged
---@field OnAdditionalTagChanged FRadiusItemDynamicDataOnAdditionalTagChanged
---@field OnParentIDChanged FRadiusItemDynamicDataOnParentIDChanged
---@field AdditionalTags TArray<FGameplayTag>
URadiusItemDynamicData = {}

---@param ItemActor ARadiusItemBase
---@return boolean
function URadiusItemDynamicData:TryGetItemActor(ItemActor) end
---@param NewDurability float
function URadiusItemDynamicData:SetDurability(NewDurability) end
---@param Tag FGameplayTag
---@return boolean
function URadiusItemDynamicData:RemoveAdditionalTag(Tag) end
function URadiusItemDynamicData:OnRep_ParentContainerUid() end
function URadiusItemDynamicData:OnRep_Durability() end
---@param PreviousStack TArray<FGameplayTag>
function URadiusItemDynamicData:OnRep_ContainingItemTagsStack(PreviousStack) end
---@param PreviousTags TArray<FGameplayTag>
function URadiusItemDynamicData:OnRep_AdditionalTags(PreviousTags) end
---@param ItemIndex int32
---@return FGameplayTag
function URadiusItemDynamicData:GetTopItemTagInStack(ItemIndex) end
---@param ItemIndex int32
---@return FGameplayTag
function URadiusItemDynamicData:GetItemTagFromStack(ItemIndex) end
---@param OutData FRadiusItemStaticData
---@return boolean
function URadiusItemDynamicData:GetItemBasicStaticData(OutData) end
---@return TArray<FGameplayTag>
function URadiusItemDynamicData:GetAdditionalTags() end
---@param Tag FGameplayTag
---@return boolean
function URadiusItemDynamicData:ContainsAdditionalTag(Tag) end
---@return boolean
function URadiusItemDynamicData:CheckItem() end
---@param Tag FGameplayTag
---@return boolean
function URadiusItemDynamicData:AddAdditionalTag(Tag) end


---@class URadiusItemStackComponent : UBoxComponent
---@field OnStackChanged FRadiusItemStackComponentOnStackChanged
---@field GameplayTags FGameplayTagContainer
---@field ExtractedItem ARadiusItemBase
URadiusItemStackComponent = {}

function URadiusItemStackComponent:OnRep_ExtractedItem() end
function URadiusItemStackComponent:OnExtractedItem() end
---@param PreviousDynamicData URadiusItemDynamicData
function URadiusItemStackComponent:OnDataUnlinked(PreviousDynamicData) end
function URadiusItemStackComponent:OnDataLinked() end
function URadiusItemStackComponent:FireOnStackChanged() end


---@class URadiusLevelSubsystem : URadiusGameInstanceSubsystem
---@field OnPreLoadLevel FRadiusLevelSubsystemOnPreLoadLevel
URadiusLevelSubsystem = {}

---@param LevelTag FGameplayTag
---@return FGameplayTag
function URadiusLevelSubsystem:ValidateLevelTag(LevelTag) end
function URadiusLevelSubsystem:OnLevelLoaded_DoAutosave() end
---@param LevelTag FGameplayTag
---@param bHardTravel boolean
---@param bDisconnect boolean
---@param bTransitionBetweenLevels boolean
function URadiusLevelSubsystem:LoadLevel(LevelTag, bHardTravel, bDisconnect, bTransitionBetweenLevels) end
---@param LevelTag FGameplayTag
---@return FText
function URadiusLevelSubsystem:GetLevelName(LevelTag) end
---@return FText
function URadiusLevelSubsystem:GetCurrentLevelName() end
---@return FGameplayTag
function URadiusLevelSubsystem:GetCurrentLevel() end
function URadiusLevelSubsystem:DoLoadLevel() end


---@class URadiusLightComponent : UActorComponent
URadiusLightComponent = {}

---@param bOn boolean
function URadiusLightComponent:UpdateLight(bOn) end
---@param bIsOn boolean
function URadiusLightComponent:SetLightState(bIsOn) end
---@param bIsOn boolean
function URadiusLightComponent:Server_SetLightState(bIsOn) end
---@param Tag FGameplayTag
---@param bAdded boolean
function URadiusLightComponent:OnItemTagChanged(Tag, bAdded) end
---@param PreviousDynamicData URadiusItemDynamicData
function URadiusLightComponent:OnItemDataUnlink(PreviousDynamicData) end
function URadiusLightComponent:OnItemDataLink() end


---@class URadiusMissionObjectiveBase : UObject
---@field OnObjectiveCompleted FRadiusMissionObjectiveBaseOnObjectiveCompleted
---@field OwningMission UAvailableMission
---@field ObjectiveConfig TSoftObjectPtr<URadiusMissionObjectiveConfigBase>
---@field bHasBegun boolean
---@field ObjectiveUid FString
URadiusMissionObjectiveBase = {}

function URadiusMissionObjectiveBase:UndoObjective() end
function URadiusMissionObjectiveBase:OnRep_OwningMission() end
---@param ShortDescription FText
---@param LongDescription FText
function URadiusMissionObjectiveBase:GetObjectiveDescriptions(ShortDescription, LongDescription) end
---@return URadiusMissionObjectiveConfigBase
function URadiusMissionObjectiveBase:GetObjectiveConfig() end
function URadiusMissionObjectiveBase:FinishObjective() end
---@return boolean
function URadiusMissionObjectiveBase:CanFinishObjective() end
---@return boolean
function URadiusMissionObjectiveBase:BeginObjective() end


---@class URadiusMissionObjectiveConfigBase : UObject
---@field bShouldTriggerGoalUpdate boolean
---@field ObjectiveDescription FText
---@field FullObjectiveDescription FText
---@field Triggers TArray<FGameplayTag>
---@field TriggersUnset TArray<FGameplayTag>
---@field MapPoints TArray<FGameplayTag>
URadiusMissionObjectiveConfigBase = {}

---@param Outer UObject
---@return URadiusMissionObjectiveBase
function URadiusMissionObjectiveConfigBase:CreateObjective(Outer) end


---@class URadiusMissionSubsystem : URadiusGameInstanceSubsystem
---@field OnMissionUpdate FRadiusMissionSubsystemOnMissionUpdate
---@field MissionConfigsMap TMap<FGameplayTag, USingleMissionConfig>
URadiusMissionSubsystem = {}

---@param Mission UAvailableMission
function URadiusMissionSubsystem:StartMission(Mission) end
---@param bIsFullReroll boolean
function URadiusMissionSubsystem:RerollMissions(bIsFullReroll) end
---@param ItemUid FString
---@param ItemType FGameplayTag
---@return boolean
function URadiusMissionSubsystem:IsMissionItem(ItemUid, ItemType) end
---@return boolean
function URadiusMissionSubsystem:HasActiveMission() end
---@param MissionId FGameplayTag
---@return USingleMissionConfig
function URadiusMissionSubsystem:GetMissionConfigByTag(MissionId) end
---@param CategoryTag FGameplayTag
---@return TArray<UAvailableMission>
function URadiusMissionSubsystem:GetInactiveMissionsWithCategory(CategoryTag) end
---@param bActiveMissions boolean
---@param bInactiveMissions boolean
---@return TArray<UAvailableMission>
function URadiusMissionSubsystem:GetAvailableMissions(bActiveMissions, bInactiveMissions) end
---@return TArray<UAvailableMission>
function URadiusMissionSubsystem:GetActiveMissions() end
---@param Mission UAvailableMission
function URadiusMissionSubsystem:FinishMission(Mission) end
---@param MissionId FGameplayTag
---@return UAvailableMission
function URadiusMissionSubsystem:FindAvailableMission(MissionId) end
function URadiusMissionSubsystem:FillMissions() end
---@param Mission UAvailableMission
function URadiusMissionSubsystem:CancelMission(Mission) end


---@class URadiusMuzzleComponent : USceneComponent
---@field GameplayTags FGameplayTagContainer
---@field ComponentPriority int32
---@field OnBulletFired FRadiusMuzzleComponentOnBulletFired
---@field ItemOwner AActor
---@field ParticleComponent UActorComponent
URadiusMuzzleComponent = {}

function URadiusMuzzleComponent:PlayParticleFX() end
---@param WeaponStaticData FWeaponStaticData
---@return boolean
function URadiusMuzzleComponent:GetOwnerWeaponStaticData(WeaponStaticData) end


---@class URadiusPhysicalHand : USkeletalMeshComponent
---@field OwningChar AVRBaseCharacter
---@field MainController UGripMotionControllerComponent
---@field SecondaryController UGripMotionControllerComponent
---@field bIsRightHand boolean
---@field AttachLerpSpeed float
---@field HandAnimState EHandAnimState
---@field CustomPoseSnapshot FPoseSnapshot
---@field CustomAnimation UAnimSequence
---@field HandState FGameplayTag
---@field bIsTriggerFingerOn boolean
---@field GripAlpha float
---@field TriggerAlpha float
---@field bIsPointingUi boolean
---@field TargetMeshTransform FTransform
---@field bUseTargetMeshTransform boolean
URadiusPhysicalHand = {}

---@param GripInfo FBPActorGripInformation
function URadiusPhysicalHand:OnLerpToHandFinish(GripInfo) end
---@param GripInfo FBPActorGripInformation
function URadiusPhysicalHand:OnGrippedSecondary(GripInfo) end
---@param GripInfo FBPActorGripInformation
function URadiusPhysicalHand:OnGripped(GripInfo) end
---@param GripInfo FBPActorGripInformation
function URadiusPhysicalHand:OnDroppedSecondary(GripInfo) end
---@param GripInfo FBPActorGripInformation
---@param bWasSocketed boolean
function URadiusPhysicalHand:OnDropped(GripInfo, bWasSocketed) end
function URadiusPhysicalHand:DetachFakeGrip() end
---@param GripInfo FBPActorGripInformation
function URadiusPhysicalHand:AttachFakeGrip(GripInfo) end


---@class URadiusPlayerAnimInstance : UAnimInstance
---@field Body USkeletalMeshComponent
---@field HMDTransformObject UObject
---@field PlayerHeight float
---@field BodyOffset float
---@field BodyRotationOffset float
URadiusPlayerAnimInstance = {}



---@class URadiusPlayerMovementComponent : UActorComponent
---@field ArcControllerClass TSubclassOf<ARadiusTeleportArcController>
---@field ArcController ARadiusTeleportArcController
---@field NeedTeleportVertThreshold float
---@field NoStuckSkin float
---@field bWantsToSprint boolean
---@field OwnerCharacter TWeakObjectPtr<ACharacter>
---@field OwnerCapsule TWeakObjectPtr<UCapsuleComponent>
---@field MovementComponent TWeakObjectPtr<UVRCharacterMovementComponent>
---@field CameraComponent TWeakObjectPtr<USceneComponent>
---@field LeftControllerComponent TWeakObjectPtr<USceneComponent>
---@field RightControllerComponent TWeakObjectPtr<USceneComponent>
---@field SettingsSubsystem URadiusSettingsSubsystem
---@field PlayerStatsComponent UPlayerStatsComponent
URadiusPlayerMovementComponent = {}

---@return boolean
function URadiusPlayerMovementComponent:ToggleSprint() end
function URadiusPlayerMovementComponent:StopAllMovement() end
---@param PointsToTeleport TArray<FVector_NetQuantize10>
function URadiusPlayerMovementComponent:Server_StartTeleporting(PointsToTeleport) end
---@param NewMovementType EMovementType
function URadiusPlayerMovementComponent:Server_SetMovementType(NewMovementType) end
---@param NewSpeed float
function URadiusPlayerMovementComponent:Server_SetMaxWalkSpeed(NewSpeed) end
---@param SnapTurnDelta float
function URadiusPlayerMovementComponent:ProcessSnapTurn(SnapTurnDelta) end
---@param From FVector
---@param To FVector
---@return TArray<FTeleportPointInfo>
function URadiusPlayerMovementComponent:PreparePointsToTeleport(From, To) end
---@param ChangedPlayerContainerID FString
function URadiusPlayerMovementComponent:OnWeightRecalculateEvent(ChangedPlayerContainerID) end
---@return boolean
function URadiusPlayerMovementComponent:IsTeleporting() end
---@return boolean
function URadiusPlayerMovementComponent:IsSprinting() end
---@return boolean
function URadiusPlayerMovementComponent:IsMovingBack() end
---@return boolean
function URadiusPlayerMovementComponent:IsMoving() end
---@return boolean
function URadiusPlayerMovementComponent:IsCrouching() end
---@param NewMovementType EMovementType
function URadiusPlayerMovementComponent:DoSetMovementType(NewMovementType) end
---@param InputValue float
function URadiusPlayerMovementComponent:CalculateTurnInput(InputValue) end
---@param InputValue float
---@return FVector
function URadiusPlayerMovementComponent:CalculateSidewaysInput(InputValue) end
---@param InputValue float
---@return FVector
function URadiusPlayerMovementComponent:CalculateForwardInput(InputValue) end


---@class URadiusPoolSubsystem : URadiusGameInstanceSubsystem
---@field Pool TMap<TSubclassOf<AActor>, FActorsArray>
URadiusPoolSubsystem = {}

---@param Actor AActor
function URadiusPoolSubsystem:Server_ReturnActor(Actor) end
---@param Actor AActor
---@return boolean
function URadiusPoolSubsystem:ReturnActor(Actor) end
function URadiusPoolSubsystem:PrefillPoolFromConfig() end
---@param Actor AActor
---@return boolean
function URadiusPoolSubsystem:IsActorInPool(Actor) end
---@param ActorList TArray<AActor>
---@param bReplicated boolean
---@param bReturnToPool boolean
function URadiusPoolSubsystem:GetSeamlessTravelActorList(ActorList, bReplicated, bReturnToPool) end
---@param ActorClass TSubclassOf<AActor>
---@param Transform FTransform
---@param Owner AActor
---@param Instigator APawn
---@param ItemConfiguration FItemConfiguration
---@return AActor
function URadiusPoolSubsystem:GetActor(ActorClass, Transform, Owner, Instigator, ItemConfiguration) end


---@class URadiusProjectileInfo : UObject
URadiusProjectileInfo = {}


---@class URadiusRadioComponent : UActorComponent
---@field RadioStartSound USoundBase
---@field RadioEndSound USoundBase
---@field RadioErrorSound USoundBase
---@field RadioWhiteNoiseSound USoundBase
---@field RadioAttenuation USoundAttenuation
---@field RadioVoiceEffect USoundEffectSourcePresetChain
---@field ComponentVoiceAttachTo USceneComponent
---@field bIsTalkingInRadio boolean
URadiusRadioComponent = {}

function URadiusRadioComponent:TryTalkInRadio() end
function URadiusRadioComponent:SwitchVoiceSettings() end
---@param Value boolean
function URadiusRadioComponent:SwitchIsTalkingInRadioRPC(Value) end
function URadiusRadioComponent:StopTalkInRadio() end
---@param Radio UStaticMeshComponent
---@param VOIP URadiusVoiceChatComponent
function URadiusRadioComponent:Setup(Radio, VOIP) end
function URadiusRadioComponent:PlayRadioStartSound() end
function URadiusRadioComponent:PlayRadioErrorSound() end
function URadiusRadioComponent:PlayRadioEndSound() end
function URadiusRadioComponent:OnRep_bIsTalkingInRadio() end
---@return boolean
function URadiusRadioComponent:IsTalkingInRadio() end
function URadiusRadioComponent:ApplyRadioVoiceEffect() end


---@class URadiusSettingsSubsystem : URadiusGameInstanceSubsystem
---@field IniManager UIniManager
URadiusSettingsSubsystem = {}

---@return boolean
function URadiusSettingsSubsystem:TabletOnLeft() end
---@param Value float
function URadiusSettingsSubsystem:SetWalkInputDeadZone(Value) end
---@param Value float
function URadiusSettingsSubsystem:SetVolumeVoiceChat(Value) end
---@param Value float
function URadiusSettingsSubsystem:SetVolumeSounds(Value) end
---@param Value float
function URadiusSettingsSubsystem:SetVolumeMusic(Value) end
---@param Value float
function URadiusSettingsSubsystem:SetVolumeMaster(Value) end
---@param Value boolean
function URadiusSettingsSubsystem:SetVoiceChatMode(Value) end
---@param Value boolean
function URadiusSettingsSubsystem:SetVirtualStock(Value) end
---@param Value EQualityType
function URadiusSettingsSubsystem:SetViewDistance(Value) end
---@param Value float
function URadiusSettingsSubsystem:SetTurnInputDeadZone(Value) end
---@param Value ETurningType
function URadiusSettingsSubsystem:SetTurningType(Value) end
---@param Value EQualityType
function URadiusSettingsSubsystem:SetTextures(Value) end
---@param bValue boolean
function URadiusSettingsSubsystem:SetTabletOnLeft(bValue) end
---@param bIsOn boolean
function URadiusSettingsSubsystem:SetSubtitlesOn(bIsOn) end
---@param NewSpeakersName FString
function URadiusSettingsSubsystem:SetSpeakersName(NewSpeakersName) end
---@param Value float
function URadiusSettingsSubsystem:SetSnapTurningAngle(Value) end
---@param Value float
function URadiusSettingsSubsystem:SetSmoothTurningSpeed(Value) end
---@param bValue boolean
function URadiusSettingsSubsystem:SetSittingMode(bValue) end
---@param Value EQualityType
function URadiusSettingsSubsystem:SetShadowQuality(Value) end
---@param Value int32
function URadiusSettingsSubsystem:SetResolution(Value) end
---@param Value EQualityType
function URadiusSettingsSubsystem:SetOverallQuality(Value) end
---@param Value EMovementType
function URadiusSettingsSubsystem:SetMovementType(Value) end
---@param Value EMovementDirectionType
function URadiusSettingsSubsystem:SetMovementDirectionType(Value) end
---@param NewMicrophoneName FString
function URadiusSettingsSubsystem:SetMicrophoneName(NewMicrophoneName) end
---@param NewLocale FString
function URadiusSettingsSubsystem:SetLocale(NewLocale) end
---@param bValue boolean
function URadiusSettingsSubsystem:SetLeftHanded(bValue) end
---@param Value float
function URadiusSettingsSubsystem:SetJumpInputThreshold(Value) end
---@param bIsEnabled boolean
function URadiusSettingsSubsystem:SetIsVignetteOnTurnEnabled(bIsEnabled) end
---@param bIsEnabled boolean
function URadiusSettingsSubsystem:SetIsVignetteOnRunEnabled(bIsEnabled) end
---@param Index int32
function URadiusSettingsSubsystem:SetIndexOfColorTable(Index) end
---@param Value float
function URadiusSettingsSubsystem:SetIndexGripThreshold(Value) end
---@param Value float
function URadiusSettingsSubsystem:SetHolsterOffset(Value) end
---@param Value boolean
function URadiusSettingsSubsystem:SetHighlightDroppedItems(Value) end
---@param bIsTap boolean
function URadiusSettingsSubsystem:SetGrippingMode(bIsTap) end
---@param bIsOn boolean
function URadiusSettingsSubsystem:SetGripHapticState(bIsOn) end
---@param Value EQualityType
function URadiusSettingsSubsystem:SetGeometry(Value) end
---@param Value int32
function URadiusSettingsSubsystem:SetFoveation(Value) end
---@param Value EQualityType
function URadiusSettingsSubsystem:SetFoliageDensity(Value) end
---@param Value boolean
function URadiusSettingsSubsystem:SetExperimentalOptimizations(Value) end
---@param Value EQualityType
function URadiusSettingsSubsystem:SetEffects(Value) end
---@param Value float
function URadiusSettingsSubsystem:SetCrouchInputThreshold(Value) end
---@param CheatName FString
---@param Value float
function URadiusSettingsSubsystem:SetCheatValue(CheatName, Value) end
---@param CheatName FString
---@param bValue boolean
function URadiusSettingsSubsystem:SetCheatEnabled(CheatName, bValue) end
---@param NewHeight float
function URadiusSettingsSubsystem:SetCalibratedHeight(NewHeight) end
---@param bValue boolean
function URadiusSettingsSubsystem:SetBraceletOnLeft(bValue) end
---@param Value boolean
function URadiusSettingsSubsystem:SetBodyFollowHeadRotation(Value) end
---@param bValue boolean
function URadiusSettingsSubsystem:SetBackpackOnLeft(bValue) end
---@param Value float
function URadiusSettingsSubsystem:SetAmbientVolume(Value) end
---@param Value float
function URadiusSettingsSubsystem:SetAimSmoothingIntensity(Value) end
function URadiusSettingsSubsystem:ResetVolume() end
---@return boolean
function URadiusSettingsSubsystem:IsVoiceChatEnabled() end
---@return boolean
function URadiusSettingsSubsystem:IsVirtualStockOn() end
---@return boolean
function URadiusSettingsSubsystem:IsVignetteOnTurnEnabled() end
---@return boolean
function URadiusSettingsSubsystem:IsVignetteOnRunEnabled() end
---@return boolean
function URadiusSettingsSubsystem:IsSubtitlesOn() end
---@return boolean
function URadiusSettingsSubsystem:IsSittingMode() end
---@return boolean
function URadiusSettingsSubsystem:IsLeftHanded() end
---@return boolean
function URadiusSettingsSubsystem:IsHighlightDroppedItemsOn() end
---@return boolean
function URadiusSettingsSubsystem:IsGrippingTap() end
---@param CheatName FString
---@param bDefaultValue boolean
---@return boolean
function URadiusSettingsSubsystem:IsCheatEnabled(CheatName, bDefaultValue) end
---@return boolean
function URadiusSettingsSubsystem:IsBodyFollowHeadRotation() end
---@return float
function URadiusSettingsSubsystem:GetWalkInputDeadZone() end
---@return float
function URadiusSettingsSubsystem:GetVolumeVoiceChat() end
---@return float
function URadiusSettingsSubsystem:GetVolumeSounds() end
---@return float
function URadiusSettingsSubsystem:GetVolumeMusic() end
---@return float
function URadiusSettingsSubsystem:GetVolumeMaster() end
---@return EQualityType
function URadiusSettingsSubsystem:GetViewDistance() end
---@return float
function URadiusSettingsSubsystem:GetTurnInputDeadZone() end
---@return ETurningType
function URadiusSettingsSubsystem:GetTurningType() end
---@return EQualityType
function URadiusSettingsSubsystem:GetTextures() end
---@return FString
function URadiusSettingsSubsystem:GetSpeakersName() end
---@return float
function URadiusSettingsSubsystem:GetSnapTurningAngle() end
---@return float
function URadiusSettingsSubsystem:GetSmoothTurningSpeed() end
---@return EQualityType
function URadiusSettingsSubsystem:GetShadowQuality() end
---@return TArray<int32>
function URadiusSettingsSubsystem:GetScreenPercentageList() end
---@return int32
function URadiusSettingsSubsystem:GetResolution() end
---@return TArray<float>
function URadiusSettingsSubsystem:GetPixelDensityList() end
---@return EQualityType
function URadiusSettingsSubsystem:GetOverallQuality() end
---@return EMovementType
function URadiusSettingsSubsystem:GetMovementType() end
---@return EMovementDirectionType
function URadiusSettingsSubsystem:GetMovementDirectionType() end
---@return FString
function URadiusSettingsSubsystem:GetMicrophoneName() end
---@return FString
function URadiusSettingsSubsystem:GetLocale() end
---@return float
function URadiusSettingsSubsystem:GetJumpInputThreshold() end
---@return int32
function URadiusSettingsSubsystem:GetIndexOfColorTable() end
---@return float
function URadiusSettingsSubsystem:GetIndexGripThreshold() end
---@return float
function URadiusSettingsSubsystem:GetHolsterOffset() end
---@return boolean
function URadiusSettingsSubsystem:GetGripHapticState() end
---@return EQualityType
function URadiusSettingsSubsystem:GetGeometry() end
---@return int32
function URadiusSettingsSubsystem:GetFoveation() end
---@return EQualityType
function URadiusSettingsSubsystem:GetFoliageDensity() end
---@return boolean
function URadiusSettingsSubsystem:GetExperimentalOptimizations() end
---@return EQualityType
function URadiusSettingsSubsystem:GetEffects() end
---@return float
function URadiusSettingsSubsystem:GetCrouchInputThreshold() end
---@param CheatName FString
---@return float
function URadiusSettingsSubsystem:GetCheatValue(CheatName) end
---@return float
function URadiusSettingsSubsystem:GetCalibratedHeight() end
---@return float
function URadiusSettingsSubsystem:GetAmbientVolume() end
---@return float
function URadiusSettingsSubsystem:GetAimSmoothingIntensity() end
---@return boolean
function URadiusSettingsSubsystem:BraceletOnLeft() end
---@return boolean
function URadiusSettingsSubsystem:BackpackOnLeft() end
function URadiusSettingsSubsystem:ApplyAllGraphicsSettings() end


---@class URadiusShrapnelProjectileInfo : URadiusFirearmProjectileInfo
URadiusShrapnelProjectileInfo = {}

---@param InAmmoData FAmmoStaticData
---@param InBaseDamage float
---@param InAccuracyInternal float
---@param InAccuracyMultiplier float
---@param InOffset float
---@param InTraceDistance float
---@return URadiusShrapnelProjectileInfo
function URadiusShrapnelProjectileInfo:Initialize(InAmmoData, InBaseDamage, InAccuracyInternal, InAccuracyMultiplier, InOffset, InTraceDistance) end
---@param AmmoData FAmmoStaticData
---@param BaseDamage float
---@param AccuracyInternal float
---@param AccuracyMultiplier float
---@param Offset float
---@param TraceDistance float
---@return URadiusShrapnelProjectileInfo
function URadiusShrapnelProjectileInfo:CreateInfo(AmmoData, BaseDamage, AccuracyInternal, AccuracyMultiplier, Offset, TraceDistance) end


---@class URadiusSliderComponent : UBoxComponent
---@field OnSliderHitPoint FRadiusSliderComponentOnSliderHitPoint
---@field OnSliderFinishedLerping FRadiusSliderComponentOnSliderFinishedLerping
---@field bUpdateInTick boolean
---@field MaxSlideDistance FVector
---@field MinSlideDistance FVector
---@field SliderBehaviorWhenReleased EVRInteractibleSliderDropBehavior
---@field FramesToAverage int32
---@field SliderMomentumFriction float
---@field SliderRestitution float
---@field MaxSliderMomentum float
---@field bIsLerping boolean
---@field CurrentSliderProgress float
---@field MaxSliderProgressOnSafety float
---@field bSlideDistanceIsInParentSpace boolean
---@field bIsLocked boolean
---@field bAutoDropWhenLocked boolean
---@field bUseLegacyLogic boolean
---@field EventThrowThreshold float
---@field PrimarySlotRange float
---@field SecondarySlotRange float
---@field GripPriority int32
---@field SplineComponentToFollow USplineComponent
---@field bFollowSplineRotationAndScale boolean
---@field bEnforceSplineLinearity boolean
---@field SplineLerpType EVRInteractibleSliderLerpType
---@field SplineLerpValue float
---@field bSliderUsesSnapPoints boolean
---@field SnapIncrement float
---@field SnapThreshold float
---@field bIncrementProgressBetweenSnapPoints boolean
---@field InitialRelativeTransform FTransform_NetQuantize
---@field GameplayTags FGameplayTagContainer
---@field bRepGameplayTags boolean
---@field bReplicateMovement boolean
---@field MovementReplicationSetting EGripMovementReplicationSettings
---@field BreakDistance float
---@field bDenyGripping boolean
---@field bIsHeld boolean
---@field HoldingGrip FBPGripPair
---@field OnGripped FRadiusSliderComponentOnGripped
---@field OnDropped FRadiusSliderComponentOnDropped
URadiusSliderComponent = {}

---@param bOnSafety boolean
function URadiusSliderComponent:UpdateMaxSliderProgress(bOnSafety) end
---@param SplineToFollow USplineComponent
function URadiusSliderComponent:SetSplineComponentToFollow(SplineToFollow) end
---@param NewSliderProgress float
function URadiusSliderComponent:SetSliderProgress(NewSliderProgress) end
---@param bNewLockedState boolean
function URadiusSliderComponent:SetIsLocked(bNewLockedState) end
---@param NewGripPriority int32
function URadiusSliderComponent:SetGripPriority(NewGripPriority) end
function URadiusSliderComponent:ResetInitialSliderLocation() end
---@param SliderProgressPoint float
function URadiusSliderComponent:ReceiveSliderHitPoint(SliderProgressPoint) end
---@param FinalProgress float
function URadiusSliderComponent:ReceiveSliderFinishedLerping(FinalProgress) end
function URadiusSliderComponent:OnRep_InitialRelativeTransform() end
---@return float
function URadiusSliderComponent:CalculateSliderProgress() end


---@class URadiusSpawnControlSubsystem : URadiusWorldSubsystem
---@field CollectedSpawners TArray<AActor>
---@field AvailableSpawners TArray<TScriptInterface<IRadiusSpawnerInterface>>
---@field DisabledSpawners TArray<TScriptInterface<IRadiusSpawnerInterface>>
URadiusSpawnControlSubsystem = {}

function URadiusSpawnControlSubsystem:Tick() end
function URadiusSpawnControlSubsystem:OnTideEvent() end
---@param Mission UAvailableMission
---@param State EMissionCompleteState
---@param CurrentObjectiveIndex int32
function URadiusSpawnControlSubsystem:OnMissionFinished(Mission, State, CurrentObjectiveIndex) end
---@param LevelTag FGameplayTag
function URadiusSpawnControlSubsystem:OnLoadLevel(LevelTag) end
function URadiusSpawnControlSubsystem:OnLevelLoaded() end
function URadiusSpawnControlSubsystem:OnGlobalTriggersChange() end
---@param LevelOrPoints int32
function URadiusSpawnControlSubsystem:OnAccessLevelOrPointsChanged(LevelOrPoints) end
---@param SpawnerId FString
function URadiusSpawnControlSubsystem:KillAllActors(SpawnerId) end


---@class URadiusStoreItemPointComponent : USceneComponent
---@field ItemActorClass TSubclassOf<ARadiusItemBase>
---@field Attachments TArray<FAttachableItemInfo>
---@field ItemRelativeTransform FTransform
---@field TimeToRespawn float
---@field NumberOfRespawns int32
---@field AccessLevelNeeded int32
---@field RespawnTimer_Del FRadiusStoreItemPointComponentRespawnTimer_Del
---@field TH_RespawnTimer FTimerHandle
---@field CurrentItem ARadiusItemBase
URadiusStoreItemPointComponent = {}

---@param Unused int32
function URadiusStoreItemPointComponent:UpdateItemLock(Unused) end
function URadiusStoreItemPointComponent:RespawnActor() end
function URadiusStoreItemPointComponent:ResetRespawn() end
---@param Controller UGripMotionControllerComponent
---@param GripInfo FBPActorGripInformation
function URadiusStoreItemPointComponent:ItemTaken(Controller, GripInfo) end


---@class URadiusTextBlock : UTextBlock
URadiusTextBlock = {}

---@param Offset float
function URadiusTextBlock:SetWrapTextAt(Offset) end


---@class URadiusTickableWorldSubsystem : URadiusWorldSubsystem
URadiusTickableWorldSubsystem = {}


---@class URadiusTimeSubsystem : URadiusWorldSubsystem
URadiusTimeSubsystem = {}

---@param NewDateTime FDateTime
---@return boolean
function URadiusTimeSubsystem:SetDateTime(NewDateTime) end
---@return boolean
function URadiusTimeSubsystem:IsDay() end
---@param Hour int32
---@param Minute int32
function URadiusTimeSubsystem:GetTime(Hour, Minute) end
---@return float
function URadiusTimeSubsystem:GetSecondsTillTide() end
---@param Hour float
---@return int32
function URadiusTimeSubsystem:GetSecondsTill(Hour) end
---@return float
function URadiusTimeSubsystem:GetGameSecondsPassed() end
---@return float
function URadiusTimeSubsystem:GetGameHoursPassed() end
---@param Date FString
---@param DayOfWeek FString
---@param Hour FString
---@param Minute FString
---@param Second FString
function URadiusTimeSubsystem:GetDateTimeStrings(Date, DayOfWeek, Hour, Minute, Second) end
---@return FDateTime
function URadiusTimeSubsystem:GetDateTime() end
---@return float
function URadiusTimeSubsystem:GetCurrentHour() end
---@param Hour float
function URadiusTimeSubsystem:DebugSetHour(Hour) end
---@param Hour float
function URadiusTimeSubsystem:AddTimeTill(Hour) end
---@param Seconds int32
function URadiusTimeSubsystem:AddSeconds(Seconds) end
---@param RealSeconds int32
function URadiusTimeSubsystem:AddRealTime(RealSeconds) end
---@param Hours float
function URadiusTimeSubsystem:AddHours(Hours) end


---@class URadiusVoiceChatComponent : UVOIPTalker
---@field DefaultAttenuation USoundAttenuation
---@field DefaultVoiceEffect USoundEffectSourcePresetChain
---@field DefaultComponentVoiceAttachTo USceneComponent
URadiusVoiceChatComponent = {}

function URadiusVoiceChatComponent:SetDefaultVoiceEffect() end


---@class URadiusVoiceSubsystem : URadiusWorldSubsystem
URadiusVoiceSubsystem = {}

function URadiusVoiceSubsystem:UnmuteSelf() end
---@param SelfPlayerController APlayerController
---@param UnmutePlayerId FUniqueNetIdRepl
function URadiusVoiceSubsystem:UnmutePlayer(SelfPlayerController, UnmutePlayerId) end
function URadiusVoiceSubsystem:UnmuteOtherPlayers() end
function URadiusVoiceSubsystem:UnmuteInGameMenuIfNeeded() end
function URadiusVoiceSubsystem:StopTalkInChat() end
function URadiusVoiceSubsystem:StartTalkInChat() end
function URadiusVoiceSubsystem:SetRadioFree() end
function URadiusVoiceSubsystem:SetRadioBusy() end
function URadiusVoiceSubsystem:MuteSelf() end
---@param SelfPlayerController APlayerController
---@param MutePlayerId FUniqueNetIdRepl
function URadiusVoiceSubsystem:MutePlayer(SelfPlayerController, MutePlayerId) end
function URadiusVoiceSubsystem:MuteOtherPlayers() end
function URadiusVoiceSubsystem:MuteInGameMenu() end
---@return boolean
function URadiusVoiceSubsystem:IsRadioBusy() end
---@return boolean
function URadiusVoiceSubsystem:IsMutedSelf() end
---@return boolean
function URadiusVoiceSubsystem:IsMutedOtherPlayers() end
---@param PlayerState APlayerState
---@return boolean
function URadiusVoiceSubsystem:IsMuted(PlayerState) end
---@return boolean
function URadiusVoiceSubsystem:IsInitAfterTransition() end
function URadiusVoiceSubsystem:EnableVoiceInput() end
function URadiusVoiceSubsystem:DisableVoiceInput() end
function URadiusVoiceSubsystem:ApplyVoiceChanges() end


---@class URadiusWidgetComponent : UWidgetComponent
---@field bDisableWhileIngameMenu boolean
---@field bDisableWhileDead boolean
---@field bDisableForOtherPlayers boolean
URadiusWidgetComponent = {}

---@param PlayerPawn APawn
function URadiusWidgetComponent:OnPlayerPossessedPawn(PlayerPawn) end
---@param PlayerPawn APawn
---@param DamageCauser AActor
function URadiusWidgetComponent:OnPlayerDied(PlayerPawn, DamageCauser) end
function URadiusWidgetComponent:OnIngameMenuOpened() end
function URadiusWidgetComponent:OnIngameMenuClosed() end


---@class URadiusWidgetInteractionComponent : UWidgetInteractionComponent
---@field Controller UGripMotionControllerComponent
---@field Hand EVRHand
---@field BeamParticleSystem UNiagaraComponent
---@field UiCollisionShape UShapeComponent
---@field BeamParticleSystemVariableName FString
---@field BeamOpacityName FString
---@field BeamParticleOpacityName FString
---@field FingerInteractionBeamThreshold float
---@field OnBeamActivated FRadiusWidgetInteractionComponentOnBeamActivated
---@field InteractionDistanceMenu float
---@field LinkedMeshComponent USkeletalMeshComponent
---@field OverlappedUiComponent UPrimitiveComponent
URadiusWidgetInteractionComponent = {}

---@param bForce boolean
function URadiusWidgetInteractionComponent:SetForceShow(bForce) end
---@param OverlappedComponent UPrimitiveComponent
---@param OtherActor AActor
---@param OtherComp UPrimitiveComponent
---@param OtherBodyIndex int32
function URadiusWidgetInteractionComponent:OnEndOverlapUiCollision(OverlappedComponent, OtherActor, OtherComp, OtherBodyIndex) end
---@param OverlappedComponent UPrimitiveComponent
---@param OtherActor AActor
---@param OtherComp UPrimitiveComponent
---@param OtherBodyIndex int32
---@param bFromSweep boolean
---@param SweepResult FHitResult
function URadiusWidgetInteractionComponent:OnBeginOverlapUiCollision(OverlappedComponent, OtherActor, OtherComp, OtherBodyIndex, bFromSweep, SweepResult) end
---@param MeshComponent USkeletalMeshComponent
---@param SocketName FName
function URadiusWidgetInteractionComponent:LinkBeamSocket(MeshComponent, SocketName) end


---@class URadiusWorldSubsystem : UWorldSubsystem
URadiusWorldSubsystem = {}


---@class UResourceComponent : UActorComponent
---@field OnResourceChange FResourceComponentOnResourceChange
---@field ResourceAmount int32
UResourceComponent = {}

---@param NewAmount int32
function UResourceComponent:SetResource(NewAmount) end
function UResourceComponent:OnRep_ResourceAmount() end
---@return int32
function UResourceComponent:GetResourceAmount() end
---@param bIsSuccess boolean
function UResourceComponent:Client_ResourceChangeCallback(bIsSuccess) end
---@param DeltaAmount int32
---@return boolean
function UResourceComponent:ChangeResource(DeltaAmount) end


---@class USingleMissionConfig : UDataAsset
---@field MissionId FGameplayTag
---@field Conditions TArray<URadiusCondition>
---@field MissionLocation FGameplayTag
---@field bIsTopPriority boolean
---@field MissionCooldown int32
---@field MissionName FText
---@field Description FText
---@field MissionReward FMissionReward
---@field bMarkTutorialFinished boolean
---@field TriggersUnsetOnFinish TArray<FGameplayTag>
---@field TriggersUnsetOnCancel TArray<FGameplayTag>
---@field MissionIcon TSoftObjectPtr<UTexture2D>
---@field ObjectiveConfigs TArray<URadiusMissionObjectiveConfigBase>
USingleMissionConfig = {}

---@param WorldContextObject UObject
---@return int32
function USingleMissionConfig:GetMoneyReward(WorldContextObject) end
---@return int32
function USingleMissionConfig:GetAccessPointsThreshold() end
---@return boolean
function USingleMissionConfig:CheckConditions() end


---@class USubtitlesWidget : UUserWidget
---@field RichTextBlock URichTextBlock
---@field BackgroundImage UWidget
---@field SaveImage UImage
---@field ShowMessageAnimation UWidgetAnimation
---@field SaveImageAnimation UWidgetAnimation
---@field OwningActor AActor
---@field InstigatorNames UDataTable
---@field SubtitleStyles UDataTable
USubtitlesWidget = {}

---@return URichTextBlock
function USubtitlesWidget:GetTextComponent() end
---@return UWidgetAnimation
function USubtitlesWidget:GetShowMessageAnimation() end
---@return UImage
function USubtitlesWidget:GetSaveImageComponent() end
---@return UWidgetAnimation
function USubtitlesWidget:GetSaveIconAnimation() end
---@return UWidget
function USubtitlesWidget:GetBackgroundComponent() end


---@class USyncTransformComponent : UActorComponent
---@field UpdateInterval float
---@field DistanceSqrThreshold float
---@field AngularThreshold float
---@field SpeedThreshold float
---@field LerpCoeff float
---@field OnSyncTransformInitialized FSyncTransformComponentOnSyncTransformInitialized
---@field SyncTransform FTransform_NetQuantize
---@field SyncSpeed float
USyncTransformComponent = {}

function USyncTransformComponent:TimeToSleep() end
---@param WakingComponent UPrimitiveComponent
---@param BoneName FName
function USyncTransformComponent:OnWake(WakingComponent, BoneName) end
---@param bShow boolean
function USyncTransformComponent:OnSwitchLoadingScreen(bShow) end
---@param WakingComponent UPrimitiveComponent
---@param BoneName FName
function USyncTransformComponent:OnSleep(WakingComponent, BoneName) end
function USyncTransformComponent:OnRep_SyncTransform() end
---@param HolsterComponent URadiusHolsterComponent
function USyncTransformComponent:OnOwnerHolstered(HolsterComponent) end
---@param GrippingController UGripMotionControllerComponent
---@param GripInformation FBPActorGripInformation
function USyncTransformComponent:OnOwnerGripped(GrippingController, GripInformation) end
---@param bIsDistanceLerping boolean
function USyncTransformComponent:OnDistanceGripChanged(bIsDistanceLerping) end


---@class USystemConfig : URadiusConfigurationAssetBase
---@field PoolActorConfigs TArray<FPoolActorConfig>
---@field ContainerCollisionChannels TArray<ECollisionChannel>
---@field MicThreshold float
---@field SilenceDetectionThreshold float
---@field DefaultAttenuation USoundAttenuation
---@field DefaultVoiceEffect USoundEffectSourcePresetChain
---@field RadioAttenuation USoundAttenuation
---@field RadioVoiceEffect USoundEffectSourcePresetChain
---@field RadioStartSound USoundBase
---@field RadioEndSound USoundBase
---@field RadioErrorSound USoundBase
---@field RadioWhiteNoise USoundBase
---@field ControllerDisplacementTransforms TMap<FGameplayTag, FTransform>
---@field LowQualityCPUs TArray<FString>
---@field LowQualityGPUs TArray<FString>
---@field MediumQualityCPUs TArray<FString>
---@field MediumQualityGPUs TArray<FString>
---@field HighQualityCPUs TArray<FString>
---@field HighQualityGPUs TArray<FString>
---@field NumericalTags TArray<FGameplayTag>
USystemConfig = {}



---@class UTargetVisibilityComponent : UActorComponent
---@field CollisionChannel ECollisionChannel
---@field VegetationCollisionProfileNameArr TArray<FName>
---@field VegetationMultiplierDecreasePerUnit float
---@field GameConfigSubsystem URadiusConfigurationSubsystem
---@field DifficultySettingsSubsystem URadiusDifficultySettingsSubsystem
---@field NPCConfig UNPCConfig
---@field TimeSubsystem URadiusTimeSubsystem
---@field OwnerMovementComp UCharacterMovementComponent
---@field Replicator ARadiusGameDataReplicator
---@field Owner AActor
UTargetVisibilityComponent = {}



---@class UTexture2DArrayWrapper : UObject
---@field Postfix FString
---@field Textures TArray<UTexture2D>
UTexture2DArrayWrapper = {}



---@class UUnderwaterBehaviorComponent : UActorComponent
---@field UnderWaterStateChanged FUnderwaterBehaviorComponentUnderWaterStateChanged
---@field WaterSplashEffect UParticleSystem
---@field SideEffectFrequency float
---@field WaterSplashEffectFrequency float
---@field DamageTypeClass TSubclassOf<URadiusDamageType>
UUnderwaterBehaviorComponent = {}

---@return float
function UUnderwaterBehaviorComponent:GetCurrentDepth() end
function UUnderwaterBehaviorComponent:BeginPlay() end


---@class UWeaponDefaultsConfig : URadiusConfigurationAssetBase
---@field FireModesCategoryTag FGameplayTag
---@field FireModes TMap<EWeaponFireMode, FGameplayTag>
---@field FireModeNames TMap<EWeaponFireMode, FText>
---@field SliderLockTag FGameplayTag
---@field ShellLifeTime float
---@field AmmoCaliberNames TMap<FGameplayTag, FText>
---@field AmmoTypeNames TMap<FGameplayTag, FText>
---@field BulletClassActor TSubclassOf<AActor>
---@field BulletsFlyBySoundDistance float
---@field BulletCollisionStimuliTag FGameplayTag
---@field DamageStimuliTag FGameplayTag
---@field ImpactDataTable UDataTable
---@field WeaponCockedTag FGameplayTag
UWeaponDefaultsConfig = {}



