

if playerstats == nil then
	playerstats = class({})
end
PlayerS = {}

function playerstats:init()

  for i=0,8 do
    PlayerS[i]= {}
    PlayerS[i]={3000,100,0,12,0,{},1,0,0,nil,nil,0}    
    --1 Gold, 2 Lumber, 3 CurFood, 4 FullFood, 5 Point, 6 units, 7 farmerNum, 8 tech, 9 unitpoint, 12 income, 
    --15 基地， 16 农民， 17 雇佣兵， 18 人口
  end
  PlayerS[4]=nil
  print("done playerstat init")
  
  PlayerS[0][10]="trigger_castarea_1"          --每个玩家的建造区域       
  PlayerS[0][11]="trigger_castarea_12"
  PlayerS[1][10]="trigger_castarea_2"
  PlayerS[1][11]="trigger_castarea_12"
  PlayerS[2][10]="trigger_castarea_3"
  PlayerS[2][11]="trigger_castarea_34"
  PlayerS[3][10]="trigger_castarea_4"
  PlayerS[3][11]="trigger_castarea_34"
  
  
  PlayerS[5][10]="trigger_castarea_5"
  PlayerS[5][11]="trigger_castarea_56"
  PlayerS[6][10]="trigger_castarea_6"
  PlayerS[6][11]="trigger_castarea_56"
  PlayerS[7][10]="trigger_castarea_7"
  PlayerS[7][11]="trigger_castarea_78"
  PlayerS[8][10]="trigger_castarea_8"
  PlayerS[8][11]="trigger_castarea_78"
  
  PlayerS[12]=0  --所有玩家兵的计数
  PlayerS[13]={} --所有玩家兵
  PlayerS[14]={} --所有玩家兵的所属玩家id
  PlayerS[15]={} --所有玩家兵的位置
  PlayerS[16]={} --所有玩家兵的名字
  
  
  PlayerS[25]=0;               --雇佣兵计数
  PlayerS[26]={};              --雇佣兵单位
  
  
  
  
  print("done init player's stat")
  sendinfotoui();
  
  for i=0,0,1 do               --15 base, 16 workers
    if not(i==4) then
    
      --创建基地

      local temp=Entities:FindByName(nil,"player"..tostring(i+1).."_base")
      
      PlayerS[i][15]=CreateUnitByName("npc_player_base",temp:GetAbsOrigin(),false,nil,nil,2)
      
      PlayerS[i][16]={}
      
      PlayerS[i][15]:SetControllableByPlayer(0,true)
      
      
      
      --PlayerS[i][15]:SetPlayerID(i)
      
      --创建人口
      
      local temp=Entities:FindByName(nil,"player"..tostring(i+1).."_renkou")
      
      PlayerS[i][18]=CreateUnitByName("npc_renkou",temp:GetAbsOrigin(),false,nil,nil,2)
      
      
      PlayerS[i][18]:SetControllableByPlayer(0,true)
      
      --PlayerS[i][18]:SetPlayerID(i)
      
      
      for j=1,7,1 do           --7个农民
        temp=Entities:FindByName(nil,"player"..tostring(i+1).."_worker"..tostring(j))
        PlayerS[i][16][j]=CreateUnitByName("base_worker",temp:GetAbsOrigin(),false,nil,nil,2)

        PlayerS[i][16][j]:SetControllableByPlayer(0,true)
        
        --PlayerS[i][16][j]:SetPlayerID(i)
      end
      
      temp=Entities:FindByName(nil,"player"..tostring(i+1).."_hirer1")
      PlayerS[i][17]=CreateUnitByName("hirer_1",temp:GetAbsOrigin(),false,nil,nil,2)  --雇佣兵营1号
      PlayerS[i][17]:SetControllableByPlayer(0,true)
      
      
      
      --[[初始化英雄
      local j=0
      print(i)
      
      local hero = PlayerResource:GetPlayer(i):GetAssignedHero()
      
      hero:SetAbilityPoints(0)
      
      
      for j = 1,6,1 do
        local temp1=hero:GetAbilityByIndex(j)
        temp1:SetLevel(1)
      end
      ]]
      
      
    end
  end
  
  
  
  
  
  
end



function sendinfotoui() 
  local p={}
  local i=0
  p[0]="lol"
  for i=0,8,1 do
    if not(i==4) then
      p[i]=tostring(PlayerS[i][1]).."          "..tostring(PlayerS[i][2]).."          "..tostring(PlayerS[i][7]).."/"..tostring(PlayerS[i][8]).."          "..tostring(PlayerS[i][9]).."          "..tostring(PlayerS[i][5]).."          "..tostring(PlayerS[i][12])
      print(i,"'s player: ",p[i])
    end
  end



  FireGameEvent('ui_update', { player1=p[0],player2=p[1],player3=p[2],player4=p[3],player5=p[5],player6=p[6],player7=p[7],player8=p[8],jaja="cao"})
  print("done update ui")
end