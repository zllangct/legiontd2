require('CFRoundThinker')
require('CFSpawner')
require('playerstats')
require('buildinghelper')

hulage=0
if legiontdGameMode == nil then
	legiontdGameMode = class({})
end
function PrecacheEveryThingFromKV( context )
	local kv_files = {"scripts/npc/npc_units_custom.txt","scripts/npc/npc_abilities_custom.txt","scripts/npc/npc_heroes_custom.txt","scripts/npc/npc_abilities_override.txt","npc_items_custom.txt"}
	for _, kv in pairs(kv_files) do
		local kvs = LoadKeyValues(kv)
		if kvs then
			print("BEGIN TO PRECACHE RESOURCE FROM: ", kv)
			PrecacheEverythingFromTable( context, kvs)
		end
	end
end
function PrecacheEverythingFromTable( context, kvtable)
	for key, value in pairs(kvtable) do
		if type(value) == "table" then
			PrecacheEverythingFromTable( context, value )
		else
			if string.find(value, "vpcf") then
				PrecacheResource( "particle",  value, context)
				print("PRECACHE PARTICLE RESOURCE", value)
			end
			if string.find(value, "vmdl") then
				PrecacheResource( "model",  value, context)
				print("PRECACHE MODEL RESOURCE", value)
			end
			if string.find(value, "vsndevts") then
				PrecacheResource( "soundfile",  value, context)
				print("PRECACHE SOUND RESOURCE", value)
			end
		end
	end
end
function Precache( context )
	--[[
		Precache things we know we'll use.  Possible file types include (but not limited to):
			PrecacheResource( "model", "*.vmdl", context )
			PrecacheResource( "soundfile", "*.vsndevts", context )
			PrecacheResource( "particle", "*.vpcf", context )
			PrecacheResource( "particle_folder", "particles/folder", context )

	
	PrecacheResource( "model", "models/courier/octopus/octopus.vmdl", context)
	PrecacheResource( "model", "models/heroes/slark/slark.vmdl", context)
	
	PrecacheResource( "model", "models/heroes/lycan/lycan.vmdl", context)
	PrecacheResource( "model", "models/heroes/lycan/lycan_wolf.vmdl", context)
	PrecacheResource( "model", "models/items/beastmaster/boar/fotw_wolf/fotw_wolf.vmdl", context)
	PrecacheResource( "model", "models/props_structures/bad_ancient_destruction.vmdl", context)
	PrecacheResource( "model", "models/creeps/greevil_shopkeeper/greevil_shopkeeper.vmdl", context)
	PrecacheResource( "model", "models/props_structures/good_ancient_fountain001.vmdl", context)
	PrecacheResource( "model", "models/props_structures/good_ancient_fountain001.vmdl", context)
	
--orc兵种模型载入	
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
	
	PrecacheItemByNameSync( "item_hirer1", context )
  print("done precache")]]

  	print("BEGIN TO PRECACHE RESOURCE")
	local time = GameRules:GetGameTime()
	PrecacheEveryThingFromKV( context )
	time = time - GameRules:GetGameTime()
	print("DONE PRECACHEING IN:"..tostring(time).."Seconds")
end

-- Create the game mode when we activate
function Activate()
	GameRules.AddonTemplate = legiontdGameMode()
	
	
	GameRules.AddonTemplate:InitGameMode()
	
	
	
	print("done activate")
end

--init
function legiontdGameMode:InitGameMode()

  --准备时间
	GameRules:SetPreGameTime(10)
	GameRules:GetGameModeEntity():SetThink( "OnThink", self, "GlobalThink", 2 )
  
  GameRules:SetSameHeroSelectionEnabled(true)
  GameRules:SetUseUniversalShopMode(true)
  
  local temp=GameRules:GetGameModeEntity()
  temp:SetRecommendedItemsDisabled(true)
  hulage=0
  CFRoundThinker:InitPara()
  print("preparing")
 
  ListenToGameEvent("npc_spawned", Dynamic_Wrap(legiontdGameMode, "OnNPCSpawned"), self)
end


function legiontdGameMode:OnNPCSpawned( keys )

   local unit =  EntIndexToHScript(keys.entindex)
   
   if unit:IsHero() then                      --如果是英雄
      unit:SetAbilityPoints(0)                --取消技能点
      local j=0
      
      for j = 0,5,1 do
        local temp1=unit:GetAbilityByIndex(j) --获取技能实体
        temp1:SetLevel(1)                     --设置技能等级
      end
      

      unit:AddNewModifier(unit, nil, "modifier_invulnerable", nil)  --农民无敌

      local temp=unit:GetPlayerOwnerID()
      

      yx[temp]=unit;
     --local pid=unit:GetPlayerID()             --获取玩家id
     
     --PlayerS[pid][18]:SetOwner(unit)          --设置人口拥有者
   end

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


