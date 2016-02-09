PLUGIN = nil;

function Initialize(Plugin)
	PLUGIN = Plugin;
	PLUGIN:SetName("Townvalds");
	PLUGIN:SetVersion(1);

	LOG("Initialized " .. PLUGIN:GetName() .. " v." .. PLUGIN:GetVersion());
	-- Load the Info shared library:
	dofile(cPluginManager:GetPluginsPath() .. "/InfoReg.lua");

	--Bind all the commands:
	RegisterPluginInfoCommands();
	RegisterPluginInfoConsoleCommands();

	cPluginManager.AddHook(cPluginManager.HOOK_PLAYER_JOINED, OnPlayerJoined);
	cPluginManager.AddHook(cPluginManager.HOOK_PLAYER_MOVING, OnPlayerMoving);
	cPluginManager.AddHook(cPluginManager.HOOK_PLAYER_DESTROYED, OnPlayerDestroyed);
	cPluginManager.AddHook(cPluginManager.HOOK_PLAYER_SPAWNED, OnPlayerSpawned);
	cPluginManager.AddHook(cPluginManager.HOOK_PLAYER_BREAKING_BLOCK, OnPlayerBreakingBlock);
	cPluginManager.AddHook(cPluginManager.HOOK_PLAYER_PLACING_BLOCK, OnPlayerPlacingBlock);

	if not (cFile:IsFile(PLUGIN:GetLocalFolder() .. "/database.sqlite3")) then -- If true, means database is deleted, or the plugin runs for the first time
		LOG("[" .. PLUGIN:GetName() .. "] It looks like this is the first time running this plugin. Creating database...");
		CreateDatabase();
	end

	return true;
end

function OnDisable() -- Gets called when the plugin is unloaded, mostly when shutting down the server
	LOG("Disabled " .. PLUGIN:GetName() .. "!");
end
