optStruct()
{
	self.HeaderArray = strTok("emblem_bg_ben;emblem_bg_ghost;emblem_bg_roxann_soldier;emblem_bg_seasonpass", ";");
	self.fov_array = strTok("65;80;90;100;110;120", ";");
	
	self.bool_true = 1;
	self.bool_false = 0;
	
	self addMenu("main", "Main Menu", "Exit");
	self addSubmenu( "main", 0, "Self Menu", "Customize ^3" + self.name + "^7", ::_loadMenu, "menu_self" );
	self addSubmenu( "main", 1, "Akimbo Menu", "Akimbo glitch guns", ::_loadMenu, "menu_akimbo" );
	self addSubmenu( "main", 2, "Afterhit Menu", "Afterhit settings", ::_loadMenu, "menu_afterhit" );
	if(self isHost())
	{
		self addSubmenu( "main", 3, "Game Menu", "Modify game settings", ::_loadMenu, "menu_lobby" );
	}
	else
	{
		self addSubmenu( "main", 3, "Game Menu", "^1You do not have access to this menu^7", ::_loadMenu, "menu_lobby" );
	}
	self addSubmenu( "main", 4, "Binds Menu", "Binds menu", ::_loadMenu, "menu_binds" );
	self addOpt("main", 5, "Credits", "See who helped with this project", ::credits);
	if(level.developer_script)
	{
		self addSubmenu( "main", 6, "^1Developer Menu^7", "Developer Options", ::_loadMenu, "menu_dev" );
	}
	
	// submenus
	
	self addMenu("menu_self", "Self Menu", "main");
	self addOpt("menu_self", 0, "Set Spawn^3*^7", "Set your spawnpoint to where you are", ::spawn_set);
	self addOpt("menu_self", 1, "Give Ammo", "Refill clip and stock ammo", ::give_ammo);
	self addOpt("menu_self", 2, "Give Single Bullet", "Set clip to have only one bullet", ::give_single_ammo);
	self addOpt("menu_self", 3, "Suicide", "Kill yourself (in the game ofcourse)", ::kill);
	self addOpt("menu_self", 4, "Drop Current Weapon", "Drop weapon for canswap", ::drop_weapon);
	self addOpt("menu_self", 5, "Drop Random Weapon", "Drop random weapon for canswap", ::drop_random_weapon);
	self addBoolean("menu_self", 6, "CanSwap Bind", "Toggle CanSwap bind", self.canswap_enabled, ::drop_weapon_bind);
	self addBoolean("menu_self", 7, "Smooth Animations", "Enable smooth animations", self.smooth_anims_enabled, ::smooth_anims);
	self addBoolean("menu_self", 8, "Silent Shot", "Makes your gun silent for last trickshot", self.bool_false, ::silent_shot);
	self addStringSlider( "menu_self", 9, "Change FOV", self.fov_array, "Adjust your Field of View", ::change_fov);
	self addOpt("menu_self", 10, "Load Spawn^3*^7", "Load you spawnpoint without dying", ::spawn_load);
	self addOpt("menu_self", 11, "Clear Spawn^3*^7", "Remove your spawnpoint", ::spawn_clear);
	
	self addMenu("menu_akimbo", "Akimbo Menu", "main");
	self addOpt("menu_akimbo", 0, "Give Five Seven", "Give glitched akimbo Five Seven", ::give_akimbo_weapon, "fiveseven_lh_mp", "Five Seven Dual Wield");
	self addOpt("menu_akimbo", 1, "Give Tac-45", "Give glitched akimbo Tac-45", ::give_akimbo_weapon, "fnp45_lh_mp", "Tac-45 Dual Wield");
	self addOpt("menu_akimbo", 2, "Give B23R", "Give glitched akimbo B23R", ::give_akimbo_weapon, "beretta93r_lh_mp", "B23R Dual Wield");
	self addOpt("menu_akimbo", 3, "Give Executioner", "Give glitched akimbo Executioner", ::give_akimbo_weapon, "judge_lh_mp", "Executioner Dual Wield");
	self addOpt("menu_akimbo", 4, "Give KAP-40", "Give glitched akimbo KAP-40", ::give_akimbo_weapon, "kard_lh_mp", "KAP-40 Dual Wield");
	
	self addMenu("menu_afterhit", "Afterhit Menu", "main");
	self addOpt("menu_afterhit", 0, "Coming Soon...", "This feature is being worked on...", ::dev_error_not_added_yet, "fiveseven_lh_mp", "Five Seven Dual Wield");
	
	self addMenu("menu_lobby", "Game Menu", "main");
	self addOpt("menu_lobby", 0, "Add Bots", "Fill game with Bots", ::addtestclients);
	self addOpt("menu_lobby", 1, "Remove Bot", "Kick a Bot from the game", ::removetestclient);
	self addBoolean( "menu_lobby", 2, "Battlechatter^1*",  "Ambient player dialogue", getgametypesetting( "allowBattleChatter" ), ::error_read_only);
	self addBoolean( "menu_lobby", 3, "Announcer^1*",  "Announce enemy team actions", getgametypesetting( "allowAnnouncer" ), ::error_read_only);
	self addBoolean( "menu_lobby", 4, "Everyone Hears Everyone^1*",  "All players can chat reguardless of team", getgametypesetting( "voipEveryoneHearsEveryone" ), ::error_read_only);
	self addBoolean( "menu_lobby", 5, "Hardcore^1*",  "No HUD, limited health, friendly fire enabled", getgametypesetting( "hardcoreMode" ), ::error_read_only);
	//self addBoolean( "menu_lobby", 4, "Allow Hitmarkers^1*",  "Display hitmarker when an opponent is damaged", getgametypesetting( "allowhitmarkers" ), ::error_read_only);
	self addBoolean( "menu_lobby", 6, "Headshots Only^1*",  "Headshots required to do damage with bullet weapons", getgametypesetting( "onlyHeadshots" ), ::error_read_only);
	self addBoolean( "menu_lobby", 7, "Force Respawn^1*",  "Players automatically respawn", getgametypesetting( "playerForceRespawn" ), ::error_read_only);
	self addBoolean( "menu_lobby", 8, "Allow Killcam^1*",  "Shows the player a replay of how they were killed", getgametypesetting( "allowKillcam" ), ::error_read_only);
	self addBoolean( "menu_lobby", 9, "Allow Final Killcam^1*",  "Shows the final kill of the game", getgametypesetting( "allowFinalKillcam" ), ::error_read_only);
	//self addBoolean( "menu_lobby", 9, "Constant Mini-Map^1*",  "Control if the Mini-Map is always on", getgametypesetting( "forceRadar" ), ::error_read_only);
	self addBoolean( "menu_lobby", 10, "Custom Classes Allowed^1*",  "Whether players can use their own classes or presets", getgametypesetting( "disableClassSelection" ), ::error_read_only);
	
	self addMenu("menu_binds", "Binds Menu", "main");
	self addOpt("menu_binds", 0, "Coming Soon...", "This feature is being worked on...", ::dev_error_not_added_yet, "fiveseven_lh_mp", "Five Seven Dual Wield");
	//self addBoolean("menu_binds", 0, "^3Crouch ^7+ ^3" + game["buttons"]["dpad_up"] + "^7: CanSwap Bind", "Toggle CanSwap bind", self.canswap_enabled, ::drop_weapon_bind);
	//self addBoolean("menu_binds", 1, "^3" + game["buttons"]["grenade"] + " ^7+ ^3" + game["buttons"]["dpad_left"] + "^7: Suicide Bind", "Toggle Suicide bind", self.suicide_bind_enabled, ::suicide_bind);
	
	self addMenu("menu_dev", "^1Developer Menu^7", "main");
	self addBoolean( "menu_dev", 0, "God Mode",  "Toggle Invulnerability", self.invulnerable, ::toggle_godmode_dev);
	self addBoolean( "menu_dev", 1, "Toggle No-Clip Mode",  "Toggle UFO Mode (fly around the map)", self.noclip, ::toggle_noclip);
	self addOpt( "menu_dev", 2, "Dump Location Info",  "Print your current position info to remote console", ::dump_viewpos);
	self addOpt( "menu_dev", 3, "Dump Weapon Info",  "Print your weapon info to remote console", ::dump_weapon);
	self addStringSlider( "menu_dev", 4, "Change Header", self.HeaderArray, "Cycle menu header shader", ::changeHeader);
}





