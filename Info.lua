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
		["/op"] = 
		{
			Permission = "tfm.op",
			Handler = HandleOpCommand,
			HelpString = "Makes a player operator.",
		},
	}, -- Commands

	ConsoleCommands =
	{
		["op"] = 
		{
			Handler = HandleConsoleOp,
			HelpString = "Makes a player operator.",
		},
	}, -- ConsoleCommands
} -- g_PluginInfo
