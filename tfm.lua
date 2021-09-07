-- tfm.lua
-- Adds commands that let admins save chunks and reload plugins on demand.

function HandleSaveCommand(Split, Player)
    cRoot:Get():SaveAllChunks()
	cRoot:Get():BroadcastChat("[" .. cChatColor.Yellow .. "TotalFreedomMod" .. cChatColor.Plain .. "]" .. cChatColor.Blue .. "All worlds on the server have been saved!")
	return true
end

function HandleConsoleSave(Split)
    cRoot:Get():SaveAllChunks()
    cRoot:Get():BroadcastChat("[" .. cChatColor.Yellow .. "TotalFreedomMod" .. cChatColor.Plain .. "]" .. cChatColor.Blue .. "All worlds on the server have been saved!")
    LOG("All worlds on the server have been saved!")
    return true
end

function HandleReloadCommand(Split, Player)
    cRoot:Get():BroadcastChat("[" .. cChatColor.Yellow .. "TotalFreedomMod" .. cChatColor.Plain .. "]" .. cChatColor.Blue .. "All plugins on the server have been reloaded!")
    cRoot:Get():GetPluginManager():ReloadPlugins()
	return true
end

function HandleConsoleReload(Split)
	cRoot:Get():BroadcastChat("[" .. cChatColor.Yellow .. "TotalFreedomMod" .. cChatColor.Plain .. "]" .. cChatColor.Blue .. "All plugins on the server have been reloaded!")
	LOG("All plugins on the server have been reloaded!")
	cRoot:Get():GetPluginManager():ReloadPlugins()
	return true
end
