-- info.lua
-- Implements the g_PluginInfo standard plugin description.

g_PluginInfo = 
{
    Name = "TotalFreedomMod",
    Version = "1",
    Date = "2021-09-07",
    SourceLocation = "https://github.com/grntbg/freedomserver",
    Description = [[Freedom plugin for Cuberite.]],

    Commands =
    {
    	["/kick"] = 
    	{
    		Permission = "tfm.punish.kick",
    		Handler = HandleKickCommand,
    		HelpString = "Kicks a player from the server.",
    	},
    	["/msg"] = 
    	{
    		Permission = "tfm.msg",
    		Handler = HandleMessageCommand,
    		HelpString = "Sends a message to another player.",
    	},
    	["/op"] = 
    	{
    		Permission = "tfm.op",
    		Handler = HandleOpCommand,
    		HelpString = "Makes a player operator.",
    	},
    	["/reply"] = 
    	{
    		Permission = "tfm.msg.reply",
            Alias = "/r",
    		Handler = HandleReplyCommand,
    		HelpString = "Lets you reply back to a message from a player.",
    	},
    	["/tfm"] = 
    	{
    		HelpString = "Lets admins save chunks and reload plugins on demand.",
    		Subcommands = 
    		{
    			reload = 
    			{
    				Permission = "tfm.tools.reload",
    				Handler = HandleReloadCommand,
    				HelpString = "Reloads all the plugins on the server.",
    			},
    			save = 
    			{
    				Permission = "tfm.tools.save",
    				Handler = HandleSaveCommand,
    				HelpString = "Saves all the worlds on the server.",
    			},
    	},
    	["/wileemanage"] = 
    	{
    		HelpString = "Lets you punish the really bad players in spectacular fashion.",
    		Subcommands = 
    		{
    			nope = 
    			{
    				Permission = "tfm.wm.nope",
    				Handler = HandleNopeCommand,
    				HelpString = "Unleashes a nope fest on a bad player. :)",
    			},
    	},
    }, -- Commands

    ConsoleCommands =
    {
	    ["op"] = 
	    {
	    	Handler = HandleConsoleOp,
	    	HelpString = "Makes a player operator.",
	    },
	    ["tfm"] = 
	    {
	    	HelpString = "Lets admins save chunks and reload plugins on demand.",
	    	Subcommands = 
	    	{
	    		reload = 
	    		{
	    			Handler = HandleConsoleReload,
	    			HelpString = "Reloads all the plugins on the server.",
	    		},
	    		save = 
	    		{
	    			Handler = HandleConsoleSave,
	    			HelpString = "Saves all the worlds on the server.",
	    		},
	    },
    }, -- ConsoleCommands
} -- g_PluginInfo
