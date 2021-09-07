-- op.lua
-- Implements the commands related to giving players the rank of Operator (op).

function HandleOpCommand(Split, Player)
	local Response
	local PlayerName = Split[2]
	local NewRank = "Operator"

	if not PlayerName then
		Response = SendMessage(Player, "Usage: " .. Split[1] .. " <player>")
	else
		-- Translate from username to unique identifier.
		local PlayerUUID = GetPlayerUUID(PlayerName)

		if not PlayerUUID or string.len(PlayerUUID) ~= 32 then
			Response = SendMessage(Player, "That player is not online.")
		else
			-- Give Operator to the player:
			if not cRankManager:RankExists(NewRank) then
				Response = SendMessage(Player, "That player could not be opped.")
			else
				cRankManager:SetPlayerRank(PlayerUUID, PlayerName, NewRank)
				cRoot:Get():ForEachPlayer(
            		function(a_CBPlayer)
	            		if (a_CBPlayer:GetName() == PlayerName) then
	        			a_CBPlayer:LoadRank()
	        		end
            	end
            	)

                local CurrentRank = cRankManager:GetPlayerRankName(PlayerUUID)
                Response = cRoot:Get():BroadcastChat(cChatColor.Gray .. cChatColor.Italic .. "[" .. PlayerName .. " has been opped!]")
			end
		end
	end
	return true, Response
end

function HandleConsoleOp(Split)
	local Response
	local PlayerName = Split[2]
	local NewRank = "Operator"

	if not PlayerName then
		Response = "Usage: " .. Split[1] .. " <player>"
	else
		-- Translate from username to unique identifier.
		local PlayerUUID = GetPlayerUUID(PlayerName)

		if not PlayerUUID or string.len(PlayerUUID) ~= 32 then
			Response = "That player is not online."
		else
			-- Give Operator to the player:
			if not cRankManager:RankExists(NewRank) then
				Response = SendMessage(Player, "That player could not be opped.")
			else
				cRankManager:SetPlayerRank(PlayerUUID, PlayerName, NewRank)
				cRoot:Get():ForEachPlayer(
            		function(a_CBPlayer)
	            		if (a_CBPlayer:GetName() == PlayerName) then
	        			a_CBPlayer:LoadRank()
	        		end
            	end
            	)

                local CurrentRank = cRankManager:GetPlayerRankName(PlayerUUID)
                Response = LOGINFO("You have opped " .. PlayerName .. "!")
                Response = cRoot:Get():BroadcastChat(cChatColor.Gray .. cChatColor.Italic .. "[" .. PlayerName .. " has been opped!]")
			end
		end
	end
	return true, Response
end
