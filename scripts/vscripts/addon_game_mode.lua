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

 local zr={
    "models/items/chen/squareskystaff_weapon/squareskystaff_weapon.vmdl",
    "models/items/chen/weapon_navi/weapon_navi.vmdl",
    "models/items/chen/armor_navi/armor_navi.vmdl",
    "models/items/chen/arms_navi/arms_navi.vmdl",
    "models/items/chen/head_navi/head_navi.vmdl",
    "models/items/chen/mount_navi_new/mount_navi_new.vmdl",
    "models/items/chen/shoulder_navi/shoulder_navi.vmdl",

    "models/heroes/windrunner/windrunner_bow.vmdl",
"models/heroes/windrunner/windrunner_cape.vmdl",
"models/heroes/windrunner/windrunner_head.vmdl",
"models/heroes/windrunner/windrunner_quiver.vmdl",
"models/heroes/windrunner/windrunner_shoulderpads.vmdl",


"models/items/windrunner/wild_wind_bow/wild_wind_bow.vmdl",
"models/items/windrunner/wild_wind_cape/wild_wind_cape.vmdl",
"models/items/windrunner/wild_wind_hair/wild_wind_hair.vmdl",
"models/items/windrunner/wild_wind_jacket/wild_wind_jacket.vmdl",
"models/items/windrunner/wild_wind_quiver/wild_wind_quiver.vmdl",


"models/heroes/sven/sven_belt.vmdl",
"models/heroes/sven/sven_gauntlet.vmdl",
"models/heroes/sven/sven_mask.vmdl",
"models/heroes/sven/sven_shoulder.vmdl",
"models/heroes/sven/sven_sword.vmdl",


"models/items/sven/warrirors_retribution_pauldrons_sven/warrirors_retribution_pauldrons_sven.vmdl",
"models/items/sven/warriors_retribution_sven_sword/warriors_retribution_sven_sword.vmdl",
"models/items/sven/warriors_retribution_sven_head/warriors_retribution_sven_head.vmdl",
"models/items/sven/warriors_retribution_sven_gauntlets/warriors_retribution_sven_gauntlets.vmdl",
"models/items/sven/warriors_retribution_sven_cape/warriors_retribution_sven_cape.vmdl",
"models/items/sven/warriors_retribution_sven_belt/warriors_retribution_sven_belt.vmdl",


"models/items/silencer/whispertribunal__weapon/whispertribunal__weapon.vmdl",
"models/items/silencer/whispertribunal_arms/whispertribunal_arms.vmdl",
"models/items/silencer/whispertribunal_belt/whispertribunal_belt.vmdl",
"models/items/silencer/whispertribunal_head/whispertribunal_head.vmdl",
"models/items/silencer/whispertribunal_shield/whispertribunal_shield.vmdl",
"models/items/silencer/whispertribunal_shoulder/whispertribunal_shoulder.vmdl",


"models/items/omniknight/winged_shoulders/winged_shoulders.vmdl",
"models/items/omniknight/winged_helmet/winged_helmet.vmdl",
"models/items/omniknight/winged_gauntlet3/winged_gauntlet3.vmdl",
"models/items/omniknight/winged_cape2/winged_cape2.vmdl",
"models/items/omniknight/winged_axe/winged_axe.vmdl",
"models/heroes/omniknight/head.vmdl",


"models/items/dragon_knight/crimson_wyvern_shield/crimson_wyvern_shield.vmdl",
"models/items/dragon_knight/wyvern_bracers/Wyvern_Bracers.vmdl",
"models/items/dragon_knight/wyvern_shoulder/wyvern_shoulder.vmdl",
"models/items/dragon_knight/wyvern_sword3/Wyvern_Sword3.vmdl",
"models/items/dragon_knight/wyvern_skirt3ba/Wyvern_Skirt3ba.vmdl",
"models/items/dragon_knight/blazingsuperiority_head/blazingsuperiority_head.vmdl",
"models/items/dragon_knight/blazingsuperiority_back/blazingsuperiority_back.vmdl",


"models/items/chaos_knight/rising_chaos_blade/rising_chaos_blade.vmdl",
"models/items/chaos_knight/rising_chaos_helm/rising_chaos_helm.vmdl",
"models/items/chaos_knight/rising_chaos_spaulders/rising_chaos_spaulders.vmdl",
"models/items/chaos_knight/rising_chaos_steed/rising_chaos_steed.vmdl",


"models/items/disruptor/tempestwrath_arms/tempestwrath_arms.vmdl",
"models/items/disruptor/tempestwrath_back/tempestwrath_back.vmdl",
"models/items/disruptor/tempestwrath_head/tempestwrath_head.vmdl",
"models/items/disruptor/tempestwrath_mount/tempestwrath_mount.vmdl",
"models/items/disruptor/tempestwrath_shoulder/tempestwrath_shoulder.vmdl",
"models/items/disruptor/tempestwrath_weapon/tempestwrath_weapon.vmdl",


"models/items/death_prophet/acherontia/acherontia_dress.vmdl",
"models/items/siren/outcast_helm/outcast_helm.vmdl",

"models/items/death_prophet/corset_of_the_mortal_coil/corset_of_the_mortal_coil.vmdl",

"models/items/siren/outcast_dagger/outcast_dagger.vmdl",
"models/items/siren/outcast_spear/outcast_spear.vmdl",
--spirit_41
"models/items/death_prophet/acherontia/acherontia_dress.vmdl",
"models/heroes/death_prophet/death_prophet_hair.vmdl",
"models/heroes/death_prophet/death_prophet_dresstop.vmdl",
"models/heroes/death_prophet/death_prophet_scarf.vmdl",
"models/heroes/death_prophet/death_prophet_vortex.vmdl",

--demo_12
"models/heroes/clinkz/clinkz_head.vmdl",
"models/heroes/clinkz/clinkz_bow.vmdl",
"models/heroes/clinkz/clinkz_pads.vmdl",
"models/heroes/clinkz/clinkz_back.vmdl",
"models/heroes/clinkz/clinkz_horns.vmdl",
"models/heroes/clinkz/clinkz_gloves.vmdl",


--demo_13
"models/heroes/pugna/pugna_head.vmdl",
"models/heroes/pugna/pugna_cape.vmdl",
"models/heroes/pugna/pugna_bracers.vmdl",
"models/heroes/pugna/pugna_weapon.vmdl",
"models/heroes/pugna/pugna_belt.vmdl",

--demo_21
"models/heroes/broodmother/broodmother_hair.vmdl",
"models/heroes/broodmother/broodmother_legs.vmdl",
"models/heroes/broodmother/broodmother_abdomen.vmdl",


--demo_51
"models/heroes/nightstalker/nightstalker_wings_night.vmdl",
"models/heroes/nightstalker/nightstalker_legarmor_night.vmdl",
"models/heroes/nightstalker/nightstalker_tail_night.vmdl",


--demo_60
"models/items/shadow_demon/back_ishobolaa/back_ishobolaa.vmdl",
"models/items/shadow_demon/belt_demonlord/belt_demonlord.vmdl",
"models/items/shadow_demon/diabolical_back/diabolical_back.vmdl",
"models/items/shadow_demon/tail_bishobola/tail_bishobola.vmdl",


--demo_61
"models/items/slark/anuxi_encore_dagger/anuxi_encore_dagger.vmdl",
"models/items/doom/eternal_fire_helmet/eternal_fire_helmet.vmdl",
"models/items/doom/eternal_fire_arms/eternal_fire_arms.vmdl",
"models/items/doom/eternal_fire_back/eternal_fire_back.vmdl",
"models/items/doom/eternal_fire_belt/eternal_fire_belt.vmdl",
"models/items/doom/eternal_fire_shoulders/eternal_fire_shoulders.vmdl",
"models/items/doom/eternal_fire_tail/eternal_fire_tail.vmdl",
--orc_40
"models/items/witchdoctor/megadon_mask/megadon_mask.vmdl",
"models/items/witchdoctor/tale_tellers_poncho.vmdl",
"models/items/witchdoctor/shrunken_head_staff.vmdl",
"models/items/witchdoctor/tale_tellers_dress.vmdl",

--orc_41
"models/items/blood_seeker/arms_savagebeast.vmdl",
"models/items/blood_seeker/back_savagebeast.vmdl",
"models/items/blood_seeker/belt_savagebeast.vmdl",
"models/items/blood_seeker/head_savagebeast.vmdl",
"models/items/blood_seeker/offhand_savagebeast.vmdl",
"models/items/blood_seeker/shoulder_savagebeast.vmdl",
"models/items/blood_seeker/weapon_savagebeast.vmdl",

--orc_60
"models/items/magnataur/defender_arms/defender_arms.vmdl",
"models/items/magnataur/defender_belt/defender_belt.vmdl",
"models/items/magnataur/defender_head/defender_head.vmdl",
"models/items/magnataur/defender_horn/defender_horn.vmdl",
"models/items/magnataur/defender_weapon/defender_weapon.vmdl",

--orc_61
"models/heroes/beastmaster/beastmaster_arms.vmdl",
"models/heroes/beastmaster/beastmaster_belt.vmdl",
"models/heroes/beastmaster/beastmaster_head.vmdl",
"models/heroes/beastmaster/beastmaster_weapon.vmdl",
"models/heroes/beastmaster/beastmaster_shoulder.vmdl",

--semi_40
"models/heroes/shadowshaman/armarmor.vmdl",
"models/heroes/shadowshaman/belt.vmdl",
"models/heroes/shadowshaman/head.vmdl",
"models/heroes/shadowshaman/weapon.vmdl",
"models/heroes/shadowshaman/weapon_offhand.vmdl",
"models/heroes/shadowshaman/helmet.vmdl",


--semi_41
"models/heroes/shadowshaman/head.vmdl",
"models/items/shadowshaman/vagabond_pack/vagabond_pack.vmdl",
"models/items/shadowshaman/vagabond_wand/vagabond_wand.vmdl",
"models/items/shadowshaman/vagabond_hat/vagabond_hat.vmdl",
"models/items/shadowshaman/vagabond_drink/vagabond_drink.vmdl",
"models/items/shadowshaman/visage_of_eki_bukaw/visage_of_eki_bukaw.vmdl",


--semi_50
"models/items/enchantress/anuxi_summer_spear/anuxi_summer_spear.vmdl",
"models/items/enchantress/anuxi_summer_skirt/anuxi_summer_skirt.vmdl",
"models/items/enchantress/anuxi_summer_shoulder/anuxi_summer_shoulder.vmdl",
"models/items/enchantress/anuxi_summer_head/anuxi_summer_head.vmdl",
"models/items/enchantress/anuxi_summer_arms/anuxi_summer_arms.vmdl",


--semi_51
"models/items/enchantress/anuxi_wildkin_arm/anuxi_wildkin_arm.vmdl",
"models/items/enchantress/anuxi_wildkin_neck/anuxi_wildkin_neck.vmdl",
"models/items/enchantress/anuxi_wldkin_weapon2/anuxi_wldkin_weapon2.vmdl",
"models/items/enchantress/anuxi_wldkin_hair2/anuxi_wldkin_hair2.vmdl",
"models/items/enchantress/anuxi_wldkin_dress2/anuxi_wldkin_dress2.vmdl",


--semi_60
"models/items/earthshaker/redguardian_head/redguardian_head.vmdl",
"models/items/earthshaker/helm_of_impasse/helm_of_impasse.vmdl",
"models/items/earthshaker/redguardian_belt/redguardian_belt.vmdl",
"models/items/lion/hell_arm/hell_arm.vmdl",

--semi_61
"models/items/elder_titan/worldforger_weapon/worldforger_weapon.vmdl",
"models/items/elder_titan/worldforger_arms/worldforger_arms.vmdl",
"models/items/elder_titan/worldforger_head/worldforger_head.vmdl",
"models/items/elder_titan/worldforger_shoulder/worldforger_shoulder.vmdl",
"models/items/elder_titan/worldforger_back/worldforger_back.vmdl",


--element_11
"models/heroes/earth_spirit/earth_spirit_head.vmdl",
"models/items/earth_spirit/vanquishing_demons_arms/vanquishing_demons_arms.vmdl",
"models/items/earth_spirit/vanquishing_demons_belt/vanquishing_demons_belt.vmdl",
"models/items/earth_spirit/vanquishing_demons_neck/vanquishing_demons_neck.vmdl",
"models/items/earth_spirit/dragon_soul/dragon_soul.vmdl",

--element_21
"models/items/ember_spirit/lucky_disc/lucky_disc.vmdl",
"models/items/ember_spirit/crimson_guard_of_prosperity/crimson_guard_of_prosperity.vmdl",
"models/items/ember_spirit/phoenix_helm_of_prosperity/phoenix_helm_of_prosperity.vmdl",
"models/items/ember_spirit/ember_pauldrons_of_prosperity/ember_pauldrons_of_prosperity.vmdl",
"models/items/ember_spirit/greaterpurifier_weapon/greaterpurifier_weapon.vmdl",
"models/items/ember_spirit/lesserpurifier_offhand_weapon/lesserpurifier_offhand_weapon.vmdl",


--element_31
"models/items/storm_spirit/festive_dress_of_good_fortune/festive_dress_of_good_fortune.vmdl",
"models/items/storm_spirit/scale_pauldrons_of_good_fortune/scale_pauldrons_of_good_fortune.vmdl",
"models/items/storm_spirit/hat_orchid/hat_orchid.vmdl",


--element_51
"models/items/warlock/hellborn_grasp/warlock_hellborn_grasp_staff.vmdl",
"models/items/warlock/archivist_head/archivist_head.vmdl",
"models/items/warlock/archivists_robe/archivists_robe.vmdl",
"models/items/warlock/archivist_lantern/archivist_lantern.vmdl",
"models/items/warlock/archivist_bracers/archivist_bracers.vmdl",
"models/items/warlock/archivist_shoulders/archivist_shoulders.vmdl",



--element_60
"models/items/puck/mysticcoils_wings/mysticcoils_wings.vmdl",
"models/items/puck/mysticcoils_antennae/mysticcoils_antennae.vmdl",
"models/items/puck/mischievous_tail/mischievous_tail.vmdl",
"models/items/puck/mischievousfruits_head/mischievousfruits_head.vmdl",

 

--nature_62
"models/heroes/treant_protector/head.vmdl",
"models/heroes/treant_protector/foliage.vmdl",
"models/heroes/treant_protector/hands.vmdl",
"models/heroes/treant_protector/legs.vmdl",

--beast_41
"models/heroes/troll_warlord/troll_warlord_axe_ranged_r.vmdl",
"models/heroes/troll_warlord/troll_warlord_axe_ranged_l.vmdl",
"models/heroes/vengeful/vengeful_hair.vmdl"


    }
     

    print("loading shiping")
	local t=#zr;
	for i=1,t do

      PrecacheResource( "model", zr[i], context)

    end

    print("done loading shiping")


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
	GameRules:SetPreGameTime(60)
	GameRules:GetGameModeEntity():SetThink( "OnThink", self, "GlobalThink", 2 )
  
  GameRules:SetSameHeroSelectionEnabled(true)
  GameRules:SetUseUniversalShopMode(true)
  
  GameRules:GetGameModeEntity():SetRecommendedItemsDisabled(true)
  hulage=0
  CFRoundThinker:InitPara()



  ListenToGameEvent("npc_spawned", Dynamic_Wrap(legiontdGameMode, "OnNPCSpawned"), self)
end


function legiontdGameMode:OnNPCSpawned( keys )

   local unit =  EntIndexToHScript(keys.entindex)
   
   if unit:IsHero() then                      --如果是英雄
      unit:SetAbilityPoints(0)                --取消技能点
      local j=0
      
      for j = 0,5,1 do
        local temp1=unit:GetAbilityByIndex(j) --获取技能实体
        if temp1 then
          temp1:SetLevel(1)                     --设置技能等级
        end
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


