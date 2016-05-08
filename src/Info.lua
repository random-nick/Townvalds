g_PluginInfo =
{
	Name = "Townvalds",
	Date = "2015-11-18",
	Description = "An opensource town plugin, based on Towny (for Bukkit).",

	AdditionalInfo =
	{
		{
			Title = "What is Townvalds?",
			Contents = "Townvalds is an opensource town plugin. It's aiming to be a fully FOSS town system comparable to Towny for Bukkit. Townvalds (will) feature towns and nations.",
		},
	},
	Commands =
	{
		["/townvalds"] =
		{
			Subcommands =
			{
				version =
				{
					Handler = DisplayVersion,
					HelpString = "Displays the current plugin version to the player",
					Permission = "townvalds.version",
				},
				reloadconfig =
				{
					Handler = LoadConfig,
					HelpString = "Reloads the Townvalds configuration file",
					Permission = "townvalds.reload-config",
				}
			}
		},
		["/town"] =
		{
			Subcommands =
			{
				new =
				{
					Handler = TownCreate,
					HelpString = "Creates a new town on the current location",
					Permission = "townvalds.town.new",
				},
				claim =
				{
					Handler = TownClaim,
					HelpString = "Claims a chunk for the current town",
					Permission = "townvalds.town.claim",
				},
				unclaim =
				{
					Handler = TownUnclaim,
					HelpString = "Unclaims a chunk for the current town",
					Permission = "townvalds.town.unclaim",
				},
				add =
				{
					Handler = TownAddPlayer,
					HelpString = "Invites a player to a town",
					Permission = "townvalds.town.add",
				},
				join =
				{
					Handler = TownJoin,
					HelpString = "If the player has an invitation of the specified town, this joins that town",
					Permission = "townvalds.town.join",
				},
				leave =
				{
					Handler = TownLeave,
					HelpString = "Leave the current town",
					Permission = "townvalds.town.leave",
				},
				["toggle"] =
				{
					Subcommands =
					{
						explosions =
						{
							Handler = TownToggleExplosions,
							HelpString = "Toggles explosions in the current town",
							Permission = "townvalds.town.toggle"
						},
                        pvp =
                        {
                            Handler = TownTogglePVP,
                            HelpString = "Toggles PVP in the current town",
                            Permission = "townvalds.town.toggle"
                        }
					}
				},
				list =
				{
					Handler = TownList,
					HelpString = "Lists towns",
					Permission = "townvalds.town.list",
				},
				rank =
				{
					Handler = TownRank,
					HelpString = "Lists available ranks, or grant and remove a rank to a resident of the town",
					Permission = "townvalds.town.rank",
				},
			}
		},
		["/resident"] =
		{
			Handler = DisplayResident,
			HelpString = "Displays information about resident",
			Permission = "townvalds.resident.info",
		},
		["/switchchat"] =
		{
			Alias = {"/sc", "/gc", "/tc", "/lc"},
			Handler = SwitchChat,
			HelpString = "Switches the active chat channel for the user",
			Permission = "townvalds.chat.switch",
		}
	},
	ConsoleCommands =
	{
		["townvalds"] =
		{
			HelpString = "The main Townvalds command",
			Subcommands =
			{
				version =
				{
					Handler = DisplayVersion,
					HelpString = "Displays the current plugin version to the player",
				},
				database =
				{
					Handler = CreateTable,
					HelpString = "townvalds.database",
				},
				reloadconfig =
				{
					Handler = LoadConfig,
					HelpString = "Reloads the Townvalds configuration file",
				}
			},
		},
	},
	Permissions =
	{
		["townvalds.version"] =
		{
			Description = "Allows the player to view the version of the plugin",
			RecommendedGroups = "admins, mods",
		},
		["townvalds.database"] =
		{
			Description = "Database test",
			RecommendedGroups = "admins",
		},
		["townvalds.resident.info"] =
		{
			Description = "Allows the player to view information about a resident",
			RecommendedGroups = "default",
		},
		["townvalds.reload-config"] =
		{
			Description = "Allows the player to view information about a resident",
			RecommendedGroups = "admins",
		},
		["townvalds.town.new"] =
		{
			Description = "Allows the player to create a new town",
			RecommendedGroups = "default",
		},
		["townvalds.town.claim"] =
		{
			Description = "Allows the player to claim a new chunk for the town",
			RecommendedGroups = "default",
		},
		["townvalds.town.unclaim"] =
		{
			Description = "Allows the player to unclaim a chunk for the town",
			RecommendedGroups = "default",
		},
		["townvalds.town.rank"] =
		{
			Description = "Lists available ranks, or grant and remove a rank to a resident of the town",
			RecommendedGroups = "default",
		},
		["townvalds.chat.switch"] =
		{
			Description = "Allows the player to switch between chat channels",
			RecommendedGroups = "default",
		},
	},
}
