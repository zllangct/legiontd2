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
         	    PlayerS[12]=PlayerS[12]+1;  --��Ҳٿص�λ����+1
         	    PlayerS[pid][1]=PlayerS[pid][1]-gc  --�۳���Ǯ
         	    sendinfotoui();                     --�������
              PlayerS[13][PlayerS[12]]=CreateUnitByName(name, point, false, nil, caster, keys.caster:GetTeam())
            
		          BuildingHelper:AddBuilding(PlayerS[13][PlayerS[12]])
		          PlayerS[13][PlayerS[12]]:UpdateHealth(BUILD_TIME,true,.85)
		          PlayerS[13][PlayerS[12]]:SetHullRadius(64)
		          PlayerS[13][PlayerS[12]]:SetControllableByPlayer( keys.caster:GetPlayerID(), true )
		          PlayerS[14][PlayerS[12]]=pid
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
  
  
  local axb = 1
  for i=1,PlayerS[12],1 do
    if caster == PlayerS[13][i] then
      local axb=i
      break
    end
  end                              --axb��pid
  
  axb=axb-1
  
  if PlayerS[axb][1]>=gc then
    if ((PlayerS[axb][4]-PlayerS[axb][3])>=rk) then
      PlayerS[axb][1]=PlayerS[axb][1]-gc  --�۳���Ǯ
      PlayerS[13][axb] = CreateUnitByName(newcaster, point, false, nil, nil, keys.caster:GetTeam())
      PlayerS[16][axb] = newcaster
      sendinfotoui();                     --�������
      caster:ForceKill(true)
      local pid=PlayerS[14][axb]
  
      PlayerS[13][axb]:SetControllableByPlayer(pid,true)
    else
      Say(nil,"you need more food!", false)
    end
  else
  
    Say(nil,"not enough gold", false)
  
  end

end


function purchase_worker(keys)  --ũ�񼤻�
  local caster=keys.caster
 
  local  particle_index = ParticleManager:CreateParticle("particles/drow/wave.vpcf", PATTACH_CUSTOMORIGIN_FOLLOW, caster)
                                        
  ParticleManager:SetParticleControl(particle_index, 0, caster:GetOrigin())
  
  ParticleManager:ReleaseParticleIndex(particle_index)
  
  caster:RemoveAbility("purchase_worker")   
  

end

function hire(keys)                --����Ӷ��

  math.randomseed(os.time())       --�������
  
  
  local name=keys.Hire_Unit
  
  local caster=keys.caster
  
  local tim=caster:GetTeam()
  
  local born=nil
  print(tim)
  
  if tim==2 then
     born="team1_hirer"
   else
     born="team2_hirer"
  end
  
  print("hirer:")
  print(born)
  local pla=(Entities:FindByName(nil,born)):GetAbsOrigin()  --��ù�Ӷ������λ��
  
  PlayerS[25]=PlayerS[25]+1
  
  print(name)
  print(pla)
  
  
  PlayerS[26][PlayerS[25]]=CreateUnitByName(name, pla+ RandomVector(math.random(400)),true,nil,nil,DOTA_TEAM_NEUTRALS) 
  
   
end