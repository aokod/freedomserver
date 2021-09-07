-- wileemanage.lua
-- These are commands that will punish the shit out of players.

function HandleNopeCommand(Split, Player)
    local Reason = "NOPE! Fuck off, and get your shit together!"

	-- Check parameters...
	if (Split[2] == nil) then
		SendMessage(Player, "Usage: " .. Split[1] .. " <player>")
		return true
	end

    -- Start a huge nope fest over that player!
    cRoot:Get():BroadcastChat(cChatColor.Red .. "A huge nope fest was started over " .. Split[2] .. "!")
    -- nopefest tba --

	-- Add that player to the banlist.
    cRoot:Get():BroadcastChat(cChatColor.Red .. "Banning: " .. Split[2] .. "! Fuck off, and get your shit together!")
	AddPlayerToBanlist(Split[2], Reason, a_Player:GetName());

	return true

end
