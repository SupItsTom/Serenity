//-----------------------------------------------------------------------------
// Purpose: Setup callbacks for damage and kill events
// Caller: none
// Return: 
//-----------------------------------------------------------------------------
init_callbacks()
{
    level.callbackplayerdamage_stub = level.callbackplayerdamage;
	level.callbackplayerdamage = ::onplayerdamaged;
	
	level.onplayerkilled_original = level.onplayerkilled;
	level.onplayerkilled = ::onplayerkilled;
	
	//replaceFunc(maps\mp\gametypes\_killcam::finalkillcamwaiter, ::sv_maprotation);
	
	dbgprint("init_callbacks: done!");
}

//-----------------------------------------------------------------------------
// Purpose: PreCache shaders/models for use ingame
// Caller: none
// Return: 
//-----------------------------------------------------------------------------
init_precache()
{
	// shaders
    precacheshader("emblem_bg_roxann_soldier");
    precacheshader("emblem_bg_ghost");
    precacheshader("thumbsup");
    precacheshader("menu_mp_lobby_locked");
    precacheshader("compass_lodestar");
    precacheshader("dof_near_coc");
    precacheshader("dof_downsample");
    precacheshader("postfx_dof_color");
    //test
    precacheshader("rank_prestige11");
    precacheshader("rank_prestige15");
    precacheshader("rank_prestige02");
    
    // strings
    precachestring( &"^1SERENITY DEVELOPER JOINED THE GAME" );
	precachestring( &"^5SERENITY TESTER JOINED THE GAME" );
	precachestring( &"^3SERENITY VIP JOINED THE GAME" );
	
	// items
	precacheitem("remote_mortar_missile_mp");
	
	// maps
	maps_precache_models();
	
	dbgprint("init_precache: done!");
}

//-----------------------------------------------------------------------------
// Purpose: Setup dvars for game
// Caller: none
// Return: 
//-----------------------------------------------------------------------------
init_dvars()
{
	makedvarserverinfo("perk_bulletPenetrationMultiplier", 999999);
    makedvarserverinfo("perk_armorPiercing", 999999);
    makedvarserverinfo("perk_weapSpreadMultiplier", 0.50);
    makedvarserverinfo("player_breath_gasp_lerp", 0);
    setdvar("perk_weapSpreadMultiplier", 0.50);
    setdvar("bg_ladder_yawcap", 360);
    setdvar("bg_prone_yawcap", 360);
    setdvar("player_breath_gasp_lerp", 0);
    setdvar("perk_bulletPenetrationMultiplier", 999999);
    setdvar("perk_armorPiercing", 999999);
    //setdvar("jump_ladderPushVel", 998);// default 128: ladder knockback
    setdvar("jump_slowdownEnable", 0);
    makedvarserverinfo("jump_slowdownEnable", 0);
    setdvar("scr_killcam_time", 4.5);
    makedvarserverinfo("scr_killcam_time", 4.5);
    setdvar("sv_cheats", 1);
    setdvar("g_allowVote", 0);
    makedvarserverinfo("g_allowVote", 0);
    makedvarserverinfo("sv_cheats", 1);
    setdvar("allClientDvarsEnabled", 1);
    setdvar("fx_marks_draw", 0); // HELPS WITH FRAMES
    makedvarserverinfo("fx_marks_draw", 0); // HELPS WITH FRAMES
    setdvar("r_dof_enable", 0);
    makedvarserverinfo("r_dof_enable", 0);
    setdvar("r_drawWater", 0);
    makedvarserverinfo("r_drawWater", 0);
    setdvar("scr_game_prematchperiod", 0);
    
	setdvar("jump_height", 64);
    setdvar("jump_slowdownEnable", 0);
    setdvar("bg_fallDamageMinHeight", 256);
    setdvar("bg_fallDamageMaxHeight", 512);
    setdvar("player_clipSizeMultiplier", 1);
    
    setdvar( "ui_errorTitle", "^6SERENITY" );
	setdvar( "ui_errorMessage", "^5THANKS FOR PLAYING!\n^5CREATED BY SUPITSTOM <3");
	setdvar( "ui_errorMessageDebug", "^1VERSION: ^7" + level.mod_version);
	
	dbgprint("init_dvars: done!");
}

//-----------------------------------------------------------------------------
// Purpose: Override strings and prepare MOTD from tool
// Caller: none
// Return: 
//-----------------------------------------------------------------------------
init_strings()
{
	game["strings"]["pregameover"] = "^6SERENITY TRICKSHOTTING";
	game["strings"]["waiting_for_teams"] = "^6SERENITY RESUMING IN:";
	game["strings"]["intermission"] = "^6SERENITY TRICKSHOTTING";
	game["strings"]["draw"] = "^6SERENITY TRICKSHOTTING";
	game["strings"]["round_draw"] = "^6SERENITY TRICKSHOTTING";
	game["strings"]["round_win"] = "^6SERENITY TRICKSHOTTING";
	game["strings"]["round_loss"] = "^6SERENITY TRICKSHOTTING";
	game["strings"]["victory"] = "^6SERENITY TRICKSHOTTING";
	game["strings"]["defeat"] = "^6SERENITY TRICKSHOTTING";
	game["strings"]["game_over"] = "^6SERENITY TRICKSHOTTING";
	game["strings"]["halftime"] = "^6SERENITY TRICKSHOTTING";
	game["strings"]["overtime"] = "^6SERENITY TRICKSHOTTING";
	game["strings"]["roundend"] = "^6SERENITY TRICKSHOTTING";
	game["strings"]["intermission"] = "^6SERENITY TRICKSHOTTING";
	game["strings"]["side_switch"] = "^6SERENITY";
	game["strings"]["score_limit_reached"] = "^1GAME OVER";
	game["strings"]["match_begins_in"] = "^6SERENITY BEGINS IN:";
    game["strings"]["match_starting_in"] = "^6SERENITY BEGINS IN:";
    
    foreach ( team in level.teams )
    {
        setobjectivetext( team, "^6ELIMINATE ENEMY SNIPERS" );
        setobjectivehinttext( team, "^6ELIMINATE ENEMY SNIPERS" );
    }
    
    game["strings"]["change_class"] = undefined;
    
    game["buttons"]["dpad_up"] = "[{+actionslot 1}]";
    game["buttons"]["dpad_down"] = "[{+actionslot 2}]";
    game["buttons"]["dpad_left"] = "[{+actionslot 3}]";
    game["buttons"]["dpad_right"] = "[{+actionslot 4}]";
    
    game["buttons"]["jump"] = "[{+gostand}]";
    game["buttons"]["crouch"] = "[{+crouch}]";
    game["buttons"]["reload"] = "[{+usereload}]";
    game["buttons"]["changeweapon"] = "[{weapnext}]";
    
    game["buttons"]["sprint"] = "[{+breath_sprint}]";
    game["buttons"]["knife"] = "[{+melee}]";
    
    game["buttons"]["grenade"] = "[{+frag}]";
    game["buttons"]["equipment"] = "[{+smoke}]";
    
    game["buttons"]["shoot"] = "[{+attack}]";
    game["buttons"]["ads"] = "[{+toggleads}]";
	
	// Load MOTD from tool, if it isnt set then use default:
	scr_motd = getdvar( "scr_motd" );

    if ( level.motd != scr_motd )
    {
        level.motd = scr_motd;
        setdvar( "ui_motd", level.motd );
    }
    
	if ( level.motd == "" )
        level.motd = "Welcome To Serenity!";

    setdvar( "scr_motd", level.motd );
    
	level.status_dev = &"^1SERENITY DEVELOPER JOINED THE GAME";
	level.status_vip = &"^3SERENITY VIP JOINED THE GAME";
	
	dbgprint("init_strings: done!");
}

//-----------------------------------------------------------------------------
// Purpose: Setup level variables for use in game
// Caller: none
// Return: 
//-----------------------------------------------------------------------------
init_levelvars()
{
	//dev
	level.developer_script = getDvarInt("developer_script");
	level.game_version = getDvar("version");
	level.mod_version = "23.08.06.0";
	level.anti_tamper = 0;//TODO: flip to 1 on release builds
	level.map_rotate_enabled = 1;
	
	// game
	level.allow_ground_shots_on_last = 0;
	level.last_kill_min_distance = 20;
	level.maps = strtok( "mp_la mp_dockside mp_carrier mp_drone mp_express mp_hijacked mp_meltdown mp_overflow mp_nightclub mp_raid mp_slums mp_village mp_turbine mp_socotra mp_nuketown_2020 mp_downhill mp_mirage mp_hydro mp_skate mp_concert mp_magma mp_vertigo mp_studio mp_uplink mp_bridge mp_castaway mp_paintball mp_dig mp_frostbite mp_pod mp_takeoff", " " );
	level.carePackageStallsSpawned = 0;
	
	dbgprint("init_levelvars: done!");
}

//-----------------------------------------------------------------------------
// Purpose: Setup client variables for use in game
// Caller: none
// Return: 
//-----------------------------------------------------------------------------
init_clientvars()
{
	self.status = 0;
	self.smooth_anims_enabled = 0;
	self.canswap_enabled = 0;
	self.suicide_bind_enabled = 0;
	self.premium_features_enabled = 1;
	
	dbgprint("init_clientvars: done!");
}

//-----------------------------------------------------------------------------
// Purpose: Replace in-game dialog
// Caller: none
// Return: 
//-----------------------------------------------------------------------------
init_sounds()
{
	game["dialog"]["gametype"] = "hack_start";
    game["dialog"]["gametype_hardcore"] = "hchack_start";
    game["dialog"]["offense_obj"] = "player_kicked";
    game["dialog"]["defense_obj"] = "player_kicked";
    
    dbgprint("init_sounds: done!");
}












