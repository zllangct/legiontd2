require('buildinghelper')
require('playerstats')

BUILD_TIME=1.0


function getBuildingPoint(keys)

	local point = BuildingHelper:AddBuildingToGrid(keys.target_points[1], 2, keys.caster)
	local inTrigger = false
	local CHECKINGRADIUS = 10
	local caster = keys.caster
  local pid = caster:GetPlayerID()
  local name = keys.UName
  local rk = keys.RenKou
  local gc = keys.GoldCost
  print(pid)
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
         	    sendinfotoui();                     --更新面板
              
              PlayerS[13][PlayerS[12]]=CreateUnitByName(name, point, false, caster, caster, keys.caster:GetTeam())
            
              
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
        local temp1=PlayerS[13][i]:GetContext("name")
        if temp1==caster:GetContext("name") then
          xuhao=i
          break
        end
      
      end
      
  axb=PlayerS[14][xuhao]
  
  if PlayerS[axb][1]>=gc then
  
    if ((PlayerS[axb][4]-PlayerS[axb][3])>=rk) then
    
      PlayerS[axb][1]=PlayerS[axb][1]-gc  --扣除金钱
      
      

      
      
      PlayerS[13][xuhao] = CreateUnitByName(newcaster, point, false, caster:GetOwner(), caster:GetOwner() or caster, keys.caster:GetTeam())
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


function purchase_worker(keys)  --农民激活

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
  
       print("wohaocaia1")

       PlayerS[26][PlayerS[25]]=CreateUnitByName(name, pla+ RandomVector(math.random(400)),true,nil,nil,DOTA_TEAM_NEUTRALS) 
     
       print("wohaocaia2")
       
       PlayerS[27]=RandomInt(5,8)
       
     else
     
       born="team2_hirer"
       
       local pla=(Entities:FindByName(nil,born)):GetAbsOrigin()  --获得雇佣兵出生位置
  
       PlayerS[25]=PlayerS[25]+1
  
       PlayerS[26][PlayerS[25]]=CreateUnitByName(name, pla+ RandomVector(math.random(400)),true,nil,nil,DOTA_TEAM_NEUTRALS) 
       
       PlayerS[27]=RandomInt(1,4)
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



function gegeda_1( keys )
	local caster = keys.caster

	local effect1 = ParticleManager:CreateParticle(keys.effect1, PATTACH_WORLDORIGIN, caster)
	ParticleManager:SetParticleControl(effect1, 0, caster:GetOrigin())
end

function gegeda_2( keys )
	local caster = keys.caster

	GameRules:GetGameModeEntity():SetContextThink(DoUniqueString("gegeda"), 
		function( )
			local effect2 = ParticleManager:CreateParticle(keys.effect2, PATTACH_WORLDORIGIN, caster)
			ParticleManager:SetParticleControl(effect2, 0, caster:GetOrigin())
			ParticleManager:ReleaseParticleIndex(effect2)
				--增加木材
			

			
			local tt=caster:GetContext("name")
			local pid=tonumber(caster:GetContext("name")) 
			
			print("renkou test")
			print(tt)
			print(pid)
	
			PlayerS[pid][2]=PlayerS[pid][2]+10+PlayerS[pid][8]
			
			sendinfotoui()
			return keys.time
			
			
		
			
			
		end, 0)
end

function rc(mm)            --随机函数
  math.randomseed(os.time())
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
      wang_1:CreatureLevelUp(1)    
      lwang[1]=lwang[1]+1
      PlayerS[pid][2]=PlayerS[pid][2]-100              --扣木材                
      PlayerS[pid][12]=PlayerS[pid][12]+3              --加收入
      sendinfotoui()
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
      wang_1:SetBaseHealthRegen(50*lwang[2])
      lwang[2]=lwang[2]+1
      PlayerS[pid][2]=PlayerS[pid][2]-100              --扣木材 
      PlayerS[pid][12]=PlayerS[pid][12]+3
      sendinfotoui()
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
      wang_1:SetBaseDamageMax(100+lwang[3]*50)
      lwang[3]=lwang[3]+1
      PlayerS[pid][2]=PlayerS[pid][2]-100              --扣木材 
      PlayerS[pid][12]=PlayerS[pid][12]+3
      sendinfotoui()
    else
      Say(nil,"Already Max Level!",false)
    end
  else
    Say(nil,"need more lumber",false)
  end
end