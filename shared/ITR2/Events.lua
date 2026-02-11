Events = {
	Level = {
		OnLevelLoaded = function(func)
			RegisterHook("/Script/IntoTheRadius2.RadiusGameMode:OnFinishLoadLevel", func)
		end,
	},

	Enemy = {
		-- Function gets called with (DeathInstigator, DiedPawn)
		OnHumanDeath = function(func)
			RegisterHook("/Script/IntoTheRadius2.RadiusAICharacterBase:OnDeath", func)
		end,

		-- Function gets called with (DeathInstigator, DiedPawn)
		OnNonHumanDeath = function(func)
			RegisterHook("/Script/IntoTheRadius2.RadiusNonHumanAICharacter:OnDeath", func)
		end,
	},
}
return Events
