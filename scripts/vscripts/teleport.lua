require("playerstats")

function OnStartTouch(trigger)
 
    local ent = Entities:FindByName(nil,	"mudi_"..tostring(1))

    local point=ent:GetAbsOrigin()

      
 --   for i=1,PlayerS[12],1 do

 --     local nt1=trigger.activator:GetName()
      
 --     local nt2=PlayerS[13][i]:GetName()

        local nt=trigger.activator:GetTeam()

        if not(nt==DOTA_TEAM_NEUTRALS) then

          if not(trigger.activator:IsHero()) then

            FindClearSpaceForUnit(trigger.activator, point, false)

            trigger.activator:Stop()

          end

        end

 --   end

end