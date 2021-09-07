-- msg.lua
-- Handles messaging between players.

function HandleMessageCommand(Split, Player)
	if (Split[2] == nil) or (Split[3] == nil) then
		SendMessage(Player, "Usage: "..Split[1].." <player> <message>")
		return true
	end
	local FoundPlayer = false
	local SendMessage = function(OtherPlayer)
		if (OtherPlayer:GetName() == Split[2]) then
			local newSplit = table.concat(Split, " ", 3)
			-- Notify them that the message was sent successfully.
			SendMessage(Player, "Your message was sent to " .. Split[2] .. "!")
			OtherPlayer:SendMessagePrivateMsg(newSplit, Player:GetName())
			lastsender[OtherPlayer:GetName()] = Player:GetName()
			FoundPlayer = true
		end
	end
	cRoot:Get():ForEachPlayer(SendMessage)
	-- If that player couldn't be found, display an error.
	if not FoundPlayer then
		SendMessage(Player, "That player is not online.")
	end
	return true
end

function HandleReplyCommand(Split, Player)
    if Split[2] == nil then
        Player:SendMessage("Usage: "..Split[1].." <message>")
    else
        local SendMessage = function(OtherPlayer)
            if (OtherPlayer:GetName() == lastsender[Player:GetName()]) then
                local newSplit = table.concat(Split, " ", 2)
                Player:SendMessage("Your message was sent to " .. lastsender[Player:GetName()] .. "!")
                OtherPlayer:SendMessagePrivateMsg(newSplit, Player:GetName())
                lastsender[OtherPlayer:GetName()] = Player:GetName()
                return true
            end
        end
	    -- If there isn't anybody to which they may reply, display an error.
        if lastsender[Player:GetName()] == nil then
            Player:SendMessage("Sorry, nobody has sent you a message.")
        else
	        -- If that player couldn't be found, display an error.
            if (not(cRoot:Get():FindAndDoWithPlayer(lastsender[Player:GetName()], SendMessage))) then
                Player:SendMessage("That player is not online.")
            end
        end
    end
    return true
end
