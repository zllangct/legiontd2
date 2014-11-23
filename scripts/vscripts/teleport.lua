require("playerstats")

function OnStartTouch1(trigger)

	print("coming~")
 
    local ent = Entities:FindByName(nil,	"mudi_"..tostring(1)) --西方军团的王前传送点
 
    local point=ent:GetAbsOrigin()                                  

    local nt=trigger.activator:GetTeam()

    if not(nt==DOTA_TEAM_NEUTRALS) then                            --不对刷出来的怪有效

        if not(trigger.activator:IsHero()) then                    --不对英雄生效

            FindClearSpaceForUnit(trigger.activator, point, false)  --完成传送

            trigger.activator:Stop()

        end
     end


end


function OnStartTouch2(trigger)
 
    local ent = Entities:FindByName(nil,	"mudi_"..tostring(2))

    local point=ent:GetAbsOrigin()


        local nt=trigger.activator:GetTeam()

        if not(nt==DOTA_TEAM_NEUTRALS) then

          if not(trigger.activator:IsHero()) then

            FindClearSpaceForUnit(trigger.activator, point, false)

            trigger.activator:Stop()

          end

        end



end