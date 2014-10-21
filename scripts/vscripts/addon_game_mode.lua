require('CFRoundThinker')
require('CFSpawner')
require('playerstats')
require('buildinghelper')

hulage=0

if legiontdGameMode == nil then
	legiontdGameMode = class({})
end

function Precache( context )
	--[[
		Precache things we know we'll use.  Possible file types include (but not limited to):
			PrecacheResource( "model", "*.vmdl", context )
			PrecacheResource( "soundfile", "*.vsndevts", context )
			PrecacheResource( "particle", "*.vpcf", context )
			PrecacheResource( "particle_folder", "particles/folder", context )
	]]
	
	PrecacheResource( "model", "models/courier/octopus/octopus.vmdl", context)
	PrecacheResource( "model", "models/heroes/slark/slark.vmdl", context)
	
	PrecacheResource( "model", "models/heroes/lycan/lycan.vmdl", context)
	PrecacheResource( "model", "models/heroes/lycan/lycan_wolf.vmdl", context)
	PrecacheResource( "model", "models/items/beastmaster/boar/fotw_wolf/fotw_wolf.vmdl", context)
	PrecacheResource( "model", "models/props_structures/bad_ancient_destruction.vmdl", context)
	PrecacheResource( "model", "models/creeps/greevil_shopkeeper/greevil_shopkeeper.vmdl", context)
	PrecacheResource( "model", "models/props_structures/good_ancient_fountain001.vmdl", context)
	PrecacheResource( "model", "models/props_structures/good_ancient_fountain001.vmdl", context)
	
--orc����ģ������	
	PrecacheResource( "model", "models/creeps/neutral_creeps/n_creep_gnoll/n_creep_gnoll_frost.vmdl", context)
	PrecacheResource( "model", "models/creeps/neutral_creeps/n_creep_gnoll/n_creep_gnoll.vmdl", context)
	PrecacheResource( "model", "models/creeps/neutral_creeps/n_creep_beast/n_creep_beast.vmdl", context)
	PrecacheResource( "model", "models/creeps/neutral_creeps/n_creep_forest_trolls/n_creep_forest_troll_high_priest.vmdl", context)
	PrecacheResource( "model", "models/creeps/neutral_creeps/n_creep_troll_dark_b/n_creep_troll_dark_b.vmdl", context)
	PrecacheResource( "model", "models/items/lone_druid/true_form/form_of_the_atniw/form_of_the_atniw.vmdl", context)
	PrecacheResource( "model", "models/items/lone_druid/true_form/rabid_black_bear/rabid_black_bear.vmdl", context)
	PrecacheResource( "model", "models/heroes/witchdoctor/witchdoctor.vmdl", context)
	PrecacheResource( "model", "models/heroes/blood_seeker/blood_seeker.vmdl", context)
	PrecacheResource( "model", "models/items/lycan/wolves/icewrack_pack/icewrack_pack.vmdl", context)
	PrecacheResource( "model", "models/items/lycan/ultimate/sirius_curse/sirius_curse.vmdl", context)
	PrecacheResource( "model", "models/heroes/magnataur/magnataur.vmdl", context)
	PrecacheResource( "model", "models/heroes/beastmaster/beastmaster.vmdl", context)


	
	
	PrecacheResource( "particle", "particles/drow/wave.vpcf", context )
	

  print("done precache")
end

-- Create the game mode when we activate
function Activate()
	GameRules.AddonTemplate = legiontdGameMode()
	
	
	GameRules.AddonTemplate:InitGameMode()
	
	
	
	print("done activate")
end

--init
function legiontdGameMode:InitGameMode()
	GameRules:SetPreGameTime(60)
	GameRules:GetGameModeEntity():SetThink( "OnThink", self, "GlobalThink", 2 )
  
  GameRules:SetSameHeroSelectionEnabled(true)
  hulage=0
  CFRoundThinker:InitPara()
  print("preparing")
 
end



-- Evaluate the state of the game
function legiontdGameMode:OnThink()


  if hulage==0 then
    playerstats:init()
    print("axb")
    hulage=1
  end
  



	if GameRules:State_Get() == DOTA_GAMERULES_STATE_GAME_IN_PROGRESS then
	  print("executing thinking")
		CFRoundThinker:Think()
	elseif GameRules:State_Get() >= DOTA_GAMERULES_STATE_POST_GAME then
		return nil
	end
	return 1
end


