-- kick.lua
-- Lets you kick players from the server!

function HandleKickCommand(Split, Player)
    if(#Split < 2) then
    	SendMessage(Player, "Usage: " .. Split[1] .. " <player> [reason]")
    	return true
    end

    local Reason = cChatColor.Red .. "You have been kicked from the server."
    if (#Split > 2) then
    	Reason = cChatColor.Red .. "You have been kicked from the server." .. cChatColor.Yellow .. "\n\n" .. table.concat(Split, " ", 3)
    end
    local IsPlayerKicked = false
    local Kick = function(OtherPlayer)
    	if (OtherPlayer:GetName() == Split[2]) then
    		IsPlayerKicked = true
    		KickPlayer(Split[2], Reason)
    	end
    end

    cRoot:Get():FindAndDoWithPlayer(Split[2], Kick)
    if (IsPlayerKicked) then
        cRoot:Get():BroadcastChat(cChatColor.Red .. "Kicking " .. Split[2] .. " from the server!")
    	return true
    end
    if (IsPlayerKicked == false) then
    	SendMessage(Player, "That player is not online.")       
    	return true
    end
end
