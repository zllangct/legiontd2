require('buildinghelper')
require('playerstats')
--require('cfroundthinker')

BUILD_TIME=1.0

jjj={"orc","nature","element","knight","beast","semi","demon","spirit"}

function getBuildingPoint(keys)

	local point = BuildingHelper:AddBuildingToGrid(keys.target_points[1], 2, keys.caster)
	local inTrigger = false
	local CHECKINGRADIUS = 10
	local caster = keys.caster
  local pid = caster:GetPlayerID()
  local name = keys.UName
  local rk = keys.RenKou
  local gc = keys.GoldCost
  if PlayerS[pid][1]>=gc then
  
    
    
    for _,thing in pairs(Entities:FindAllInSphere(GetGroundPosition(keys.target_points[1], nil), CHECKINGRADIUS) )  do
 
        if (thing:GetName() == PlayerS[pid][10]) or (thing:GetName() == PlayerS[pid][11]) then
            inTrigger = true
        else
            inTrigger = false
        end
 
        if (inTrigger == true) then
         	if point ~= -1 then
         	  if ((PlayerS[pid][4]-PlayerS[pid][3])>=rk) then
         	  
         	    PlayerS[12]=PlayerS[12]+1;  --玩家操控单位数量+1
         	    PlayerS[pid][1]=PlayerS[pid][1]-gc  --扣除金钱
         	  
              
              PlayerS[13][PlayerS[12]]=CreateUnitByName(name, point, false, nil, nil, keys.caster:GetTeam())
              
              PlayerS[pid][3]=PlayerS[pid][3]+rk;
              
              PlayerS[13][PlayerS[12]]:AddNewModifier(caster, nil, "modifier_rooted", nil)
            
		          BuildingHelper:AddBuilding(PlayerS[13][PlayerS[12]])
		          PlayerS[13][PlayerS[12]]:UpdateHealth(BUILD_TIME,true,.85)
		          PlayerS[13][PlayerS[12]]:SetHullRadius(64)
		          PlayerS[13][PlayerS[12]]:SetControllableByPlayer( keys.caster:GetPlayerID(), true )
		          
		          PlayerS[13][PlayerS[12]]:SetOwner(PlayerResource:GetPlayer(pid))
		          
		          PlayerS[13][PlayerS[12]]:SetContext("name",tostring(PlayerS[12]),0)
		          PlayerS[13][PlayerS[12]]:SetContext("pid",tostring(pid),0)
		          PlayerS[14][PlayerS[12]]=pid    --pid
		          
		          PlayerS[15][PlayerS[12]]=point
		          PlayerS[16][PlayerS[12]]=name
		          
		          PlayerS[17][PlayerS[12]]=caster
		          PlayerS[18][PlayerS[12]]=keys.caster:GetTeam()
		          sendinfotoui();                     --更新面板
		        else
		          Say(nil,"you need more food!", false)
		        
		        end
        	else
		        Say(nil,"you can't build on a existing unit", false)
		  
	        end
	      else
	 --       Say(nil,"you can't build here", false)
	        
        end
    end
	else
	  Say(nil,"not enough gold", false)
	end
	
	
	

end




function change_little(keys)
  local caster = 	keys.caster
  local point = caster:GetAbsOrigin()
  
  
  
  local newcaster = keys.NewUnit
  local rk=keys.RenKou
  local gc=keys.GoldCost
  
  
 --xuhao是单位序号 axb是pid

  

  local xuhao=0
      
      
      for i=1,PlayerS[12],1 do

        print(i)
        temp1=PlayerS[13][i]:GetContext("name")
        if temp1==caster:GetContext("name") then
          xuhao=i
          break
        end
      
      end
      
  axb=PlayerS[14][xuhao]
  
  if PlayerS[axb][1]>=gc then
  
    if ((PlayerS[axb][4]-PlayerS[axb][3])>=rk) then
    
      PlayerS[axb][1]=PlayerS[axb][1]-gc  --扣除金钱
      
      
      PlayerS[axb][3]=PlayerS[axb][3]+rk
      
      
      PlayerS[13][xuhao] = CreateUnitByName(newcaster, point, false, nil, nil, keys.caster:GetTeam())
      PlayerS[13][xuhao]:SetContext("name", tostring(xuhao), 0)

      PlayerS[16][xuhao] = newcaster
      
      sendinfotoui();                     --更新面板

      caster:SetAbsOrigin(zibao)
      caster:ForceKill(true)
      
      local pid=PlayerS[14][xuhao]
  
      PlayerS[13][xuhao]:SetControllableByPlayer(axb,true)
      
      PlayerS[13][xuhao]:SetOwner(PlayerResource:GetPlayer(axb))
      PlayerS[13][xuhao]:SetBaseMoveSpeed(1)
      --升级的单位未更新name context 可能会有问题
      
      PlayerS[13][xuhao]:SetContext("pid",tostring(axb),0)
      PlayerS[13][xuhao]:AddNewModifier(caster, nil, "modifier_rooted", nil)
    else
      Say(nil,"you need more food!", false)
    end
  else
  
    Say(nil,"not enough gold", false)
  
  end

end




function hire(keys)                --购买佣兵

  --math.randomseed(os.time())       --随机种子
  

  
  local name=keys.Hire_Unit
  
  local caster=keys.caster
  
  local tim=caster:GetTeam()
  
  local born=nil
  
  local lc=keys.LumberCost
  
  
  
  pid=caster:GetPlayerOwnerID()
  
  print(pid)
  print(lc)
  if PlayerS[pid][2]>=tonumber(lc) then
  
    PlayerS[pid][2]=PlayerS[pid][2]-lc
    sendinfotoui()
  
    if tim==2 then
    
       born="team1_hirer"
   
       local pla=(Entities:FindByName(nil,born)):GetAbsOrigin()  --获得雇佣兵出生位置
  
       PlayerS[25]=PlayerS[25]+1


       PlayerS[26][PlayerS[25]]=CreateUnitByName(name, pla+ RandomVector(math.random(400)),true,nil,nil,DOTA_TEAM_NEUTRALS) 
       PlayerS[28][PlayerS[25]]=name
       local count;
       count=0
       gg={}
       for i=5,8,1 do
         if not(PlayerS[i][30]==0) then
           count=count+1
           gg[count]=i
         end  
       end
      if count==0 then
         PlayerS[27][PlayerS[25]]=5
      else
         PlayerS[27][PlayerS[25]]=rc(gg);
      end
      print("suiji")
      print(PlayerS[27][PlayerS[25]])
     else
     
       born="team2_hirer"
       
       local pla=(Entities:FindByName(nil,born)):GetAbsOrigin()  --获得雇佣兵出生位置
  
       PlayerS[25]=PlayerS[25]+1
  
       PlayerS[26][PlayerS[25]]=CreateUnitByName(name, pla+ RandomVector(math.random(400)),true,nil,nil,DOTA_TEAM_NEUTRALS) 
       
       local count;
       count=0
       gg={}
       for i=1,4,1 do
         if not(PlayerS[i-1][30]==0) then
           count=count+1
           gg[count]=i
         end  
       end
      if count==0 then
         PlayerS[27][PlayerS[25]]=1
      else
         PlayerS[27][PlayerS[25]]=rc(gg);
      end 
  
    end


  else
       Say(nil,"not enough lumber", false)
  end
   
end

function renkou(keys)
  


  local gc=keys.GoldCost
  local lc=keys.LumberCost
  local caster=keys.caster
  
  
  print(caster:GetContext("name"))
  pid=tonumber(caster:GetContext("name"))  
  print(pid)
  if PlayerS[pid][1]>=gc then
    if PlayerS[pid][2]>=lc then
      
      PlayerS[pid][1]=PlayerS[pid][1]-gc
      PlayerS[pid][2]=PlayerS[pid][2]-lc
      PlayerS[pid][4]=PlayerS[pid][4]+10
      
      sendinfotoui()
      
    else
      Say(nil,"not enough lumber", false)
    end
  
  else
    Say(nil,"not enough gold", false)
  end
end

function keji(keys)
  


  local caster=keys.caster
  
  
  print(caster:GetContext("name"))
  pid=tonumber(caster:GetContext("name"))  
  print(pid)

  local gc=PlayerS[pid][8]*20+50
  local lc=gc


  if PlayerS[pid][1]>=gc then
    if PlayerS[pid][2]>=lc then
      if PlayerS[pid][8]<=150 then
        PlayerS[pid][1]=PlayerS[pid][1]-gc
        PlayerS[pid][2]=PlayerS[pid][2]-lc
        PlayerS[pid][8]=PlayerS[pid][8]+1
      
        sendinfotoui()
      else
         Say(nil,"alreay max lv", false)
      end
    else
      Say(nil,"not enough lumber", false)
    end
  
  else
    Say(nil,"not enough gold", false)
  end
end

function gegeda_1( keys )
	local caster = keys.caster
  print("chufale")
  keys.ability:ApplyDataDrivenModifier(caster, caster, "gelaoshi", nil)
--	ParticleManager:SetParticleControl(effect1, 0, caster:GetOrigin())

 --   ParticleManager:ReleaseParticleIndex(effect1)
end

function gegeda_2( keys )
	local caster = keys.caster
  local tt=caster:GetContext("name")
  local pid=tonumber(caster:GetContext("name")) 
  if PlayerS[pid][1]>=50 then

	GameRules:GetGameModeEntity():SetContextThink(DoUniqueString("gegeda"), 
		function( )
			local effect2 = ParticleManager:CreateParticle(keys.effect2, PATTACH_WORLDORIGIN, caster)
			ParticleManager:SetParticleControl(effect2, 0, caster:GetOrigin())
			ParticleManager:ReleaseParticleIndex(effect2)
				--增加木材
			PopupNumbers(caster, "heal", Vector(0, 255, 0), 1.0, 10+PlayerS[pid][8], POPUP_SYMBOL_PRE_PLUS, nil)

			
	
			PlayerS[pid][2]=PlayerS[pid][2]+10+PlayerS[pid][8]
			
			sendinfotoui()
			return keys.time
			
		
		
			
			
		end, 0)
  caster:RemoveAbility("gegeda")
  PlayerS[pid][7]=PlayerS[pid][7]+1
  sendinfotoui()
  else
      Say(nil,"not enough gold", false)
  end  
end

function rerollskill(keys)
  
  local caster=keys.caster

  --if CFRoundThinker._currentState==ROUND_STATE_PREPARE then  --只允许在准备阶段roll技能
    caster:RemoveAbility("reroll")
    for i=1,6,1 do
      caster:AddAbility(rc(jjj).."_"..tostring(i))
    end

    for j = 0,15,1 do
        local temp1=caster:GetAbilityByIndex(j) --获取技能实体
        if temp1 then
          temp1:SetLevel(1)                     --设置技能等级
        end
      end
--  else
--    Say(nil,"you can't reroll during battle", false)
--  end

end  


function rc(mm)            --随机函数
  local i=1;
  while not(mm[i]==nil) do
    i=i+1
  end
  return mm[math.random(i)];
end


function lightkinghp(keys)
  local caster=keys.caster
  local temp=caster:GetContext("name")
  local pid=tonumber(temp)

  if PlayerS[pid][2]>=100 then
    if lwang[1]<15 then
      if pid<4 then
        wang_1:CreatureLevelUp(1)    
        lwang[1]=lwang[1]+1
        PlayerS[pid][2]=PlayerS[pid][2]-100              --扣木材                
        PlayerS[pid][12]=PlayerS[pid][12]+3              --加收入
        sendinfotoui()
      else
        if dwang[1]<15 then
          wang_2:CreatureLevelUp(1)    
          dwang[1]=dwang[1]+1
          PlayerS[pid][2]=PlayerS[pid][2]-100              --扣木材                
          PlayerS[pid][12]=PlayerS[pid][12]+3              --加收入
          sendinfotoui()
        else
          Say(nil,"Already Max Level!",false)
        end
      end

    else
      Say(nil,"Already Max Level!",false)
    end
  else
    Say(nil,"need more lumber",false)
  end

end

function lightkingheal(keys)
  local caster=keys.caster
  local temp=caster:GetContext("name")
  local pid=tonumber(temp)

  if PlayerS[pid][2]>=100 then
    if lwang[2]<15 then
      if pid<4 then
        wang_1:SetBaseHealthRegen(50*lwang[2])
        lwang[2]=lwang[2]+1
        PlayerS[pid][2]=PlayerS[pid][2]-100              --扣木材 
        PlayerS[pid][12]=PlayerS[pid][12]+3
        sendinfotoui()
      else
        if dwang[2]<15 then
          wang_2:SetBaseHealthRegen(50*dwang[2])  
          dwang[2]=dwang[2]+1
          PlayerS[pid][2]=PlayerS[pid][2]-100              --扣木材 
          PlayerS[pid][12]=PlayerS[pid][12]+3
          sendinfotoui()          
        else
          Say(nil,"Already Max Level!",false)
        end
      end




    else
      Say(nil,"Already Max Level!",false)
    end
  else
    Say(nil,"need more lumber",false)
  end
end

function lightkingatk(keys)
  local caster=keys.caster
  local temp=caster:GetContext("name")
  local pid=tonumber(temp)

  if PlayerS[pid][2]>=100 then
    if lwang[3]<15 then
      if pid<4 then
        wang_1:SetBaseDamageMax(100+lwang[3]*50)
        lwang[3]=lwang[3]+1
        PlayerS[pid][2]=PlayerS[pid][2]-100              --扣木材 
        PlayerS[pid][12]=PlayerS[pid][12]+3
        sendinfotoui()
      else
        if dwang[3]<15 then
          wang_2:SetBaseDamageMax(100+dwang[3]*50) 
          dwang[3]=dwang[3]+1
          PlayerS[pid][2]=PlayerS[pid][2]-100              --扣木材 
          PlayerS[pid][12]=PlayerS[pid][12]+3
          sendinfotoui()
        else
          Say(nil,"Already Max Level!",false)
        end
      end
      
    else
      Say(nil,"Already Max Level!",false)
    end
  else
    Say(nil,"need more lumber",false)
  end
end

function PopupNumbers(target, pfx, color, lifetime, number, presymbol, postsymbol)
    local pfxPath = string.format("particles/msg_fx/msg_%s.vpcf", pfx)
    local pidx = ParticleManager:CreateParticle(pfxPath, PATTACH_ABSORIGIN_FOLLOW, target) -- target:GetOwner()

    local digits = 0
    if number ~= nil then
        digits = #tostring(number)
    end
    if presymbol ~= nil then
        digits = digits + 1
    end
    if postsymbol ~= nil then
        digits = digits + 1
    end

    ParticleManager:SetParticleControl(pidx, 1, Vector(tonumber(presymbol), tonumber(number), tonumber(postsymbol)))
    ParticleManager:SetParticleControl(pidx, 2, Vector(lifetime, digits, 0))
    ParticleManager:SetParticleControl(pidx, 3, color)
end