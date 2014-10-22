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
            
              
            
            
		          BuildingHelper:AddBuilding(PlayerS[13][PlayerS[12]])
		          PlayerS[13][PlayerS[12]]:UpdateHealth(BUILD_TIME,true,.85)
		          PlayerS[13][PlayerS[12]]:SetHullRadius(64)
		          PlayerS[13][PlayerS[12]]:SetControllableByPlayer( keys.caster:GetPlayerID(), true )
		          
		          PlayerS[13][PlayerS[12]]:SetOwner(PlayerResource:GetPlayer(pid))
		          
		          PlayerS[13][PlayerS[12]]:SetContext("name",tostring(PlayerS[12]),0)
		          
		          PlayerS[14][PlayerS[12]]=pid    --pid
		          PlayerS[15][PlayerS[12]]=point
		          PlayerS[16][PlayerS[12]]=name
		          
		          
		          
		        else
		          Say(nil,"you need more food!", false)
		        
		        end
        	else
		        Say(nil,"you can't build on a existing unit", false)
		  
	        end
	      else
	        Say(nil,"you can't build here", false)
	        
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
  
  
 --axb是pid
  
  
  axb=caster:GetPlayerOwnerID()
  
  print(caster:GetUnitName())
  

  print(axb)
  
  local xuhao=0
      
      for i=1,PlayerS[12],1 do
        
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
      caster:ForceKill(true)
      
      local pid=PlayerS[14][xuhao]
  
      PlayerS[13][xuhao]:SetControllableByPlayer(axb,true)
      
      PlayerS[13][xuhao]:SetOwner(PlayerResource:GetPlayer(axb))
      
      
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
  
  if PlayerS[pid][2]>=lc then
  
    PlayerS[pid][2]=PlayerS[pid][2]-lc
    sendinfotoui()
  
    if tim==2 then
       born="team1_hirer"
     else
       born="team2_hirer"
    end
  
    print("hirer:")
    print(born)
    local pla=(Entities:FindByName(nil,born)):GetAbsOrigin()  --获得雇佣兵出生位置
  
    PlayerS[25]=PlayerS[25]+1
  
    PlayerS[26][PlayerS[25]]=CreateUnitByName(name, pla+ RandomVector(math.random(400)),true,nil,nil,DOTA_TEAM_NEUTRALS) 
  else
       Say(nil,"not enough lumber", false)
  end
   
end

function renkou(keys)
  


  local gc=keys.GoldCost
  local lc=keys.LumberCost
  
  pid=caster:GetPlayerOwnerID()  
  
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