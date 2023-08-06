button_monitor()
{
	self endon("disconnect");
    self endon("game_ended");

    for(;;) {
    	if(self getStance() == "stand") {
    		if(self fragButtonPressed()) {
    			if(self actionSlotThreeButtonPressed()){
    				self suicide();
    			}
    		}
    		if(self actionSlotOneButtonPressed()) {
                //self drop_random_weapon();
            }
    	}
        if(self getStance() == "crouch") {
            if(self actionSlotOneButtonPressed()) {
                self drop_random_weapon();
            }
            else if(self actionSlotTwoButtonPressed()) {
                //self thread ride_rpg();
            }
            else if(self actionSlotThreeButtonPressed()) {
                self thread spawn_set();
            }
        }

        wait .01;
    }
}

give_ammo()
{
	current_weapon = self getCurrentWeapon();
	if(current_weapon == "none")
	{
		self iprintln("Cannot give ammo for this weapon");
	}
	else
	{
		self setWeaponAmmoClip(current_weapon, weaponClipSize(current_weapon));
	    self giveMaxAmmo(current_weapon);
	    
	    self iprintln(getweapondisplayname(current_weapon) + " Ammo: ^2Set to max");
	}
}

give_single_ammo()
{
	current_weapon = self getCurrentWeapon();
	if(current_weapon == "none")
	{
		self iprintln("Cannot give ammo for this weapon");
	}
	else
	{
		self setWeaponAmmoClip(current_weapon, 1);
	    
	    self iprintln(getweapondisplayname(current_weapon) + " Ammo: ^2Drained to one bullet");
	}
}

kill()
{
	self suicide();
}

give_akimbo_weapon(weaponName, localString)
{
	current_weapon = self getCurrentWeapon();
	self takeweapon(current_weapon);
	self giveweapon(weaponName, 0, true);
	self switchtoweapon( weaponName );
	
	if(isDefined(localString))
		self iPrintln(localString + ": ^2Given");
}

drop_weapon()
{
	current_weapon = self getCurrentWeapon();
	self dropItem(current_weapon);
}

drop_weapon_bind()
{
	if( self.canswap_enabled == 0 )
	{
		self iprintln( "CanSwap Bind: ^2Enabled" );
		self iprintln( "This has been set to: ^2Crouch ^7+ ^3" + game["buttons"]["dpad_up"] + "" );
		self.canswap_enabled = 1;
	}
	else
	{
		self iprintln( "CanSwap Bind: ^1Disabled" );
		self.canswap_enabled = 0;
	}
}

suicide_bind()
{
	if( self.suicide_bind_enabled == 0 )
	{
		self iprintln( "Suicide Bind: ^2Enabled" );
		self iprintln( "This has been set to: ^3" + game["buttons"]["grenade"] + " ^7+ " + game["buttons"]["dpad_left"] + "" );
		self.suicide_bind_enabled = 1;
	}
	else
	{
		self iprintln( "CanSwap Bind: ^1Disabled" );
		self.suicide_bind_enabled = 0;
	}
}

drop_random_weapon()
{
	weapon = _random_gun();
    self giveWeapon(weapon, 0, true);
    self dropItem(weapon);
}

_random_gun() {
    self.gun = "";
    while (self.gun == "") {
        id = random(level.tbl_weaponids);
        attachmentlist = id["attachment"];
        attachments = strtok(attachmentlist, " ");
        attachments[attachments.size] = "";
        attachment = random(attachments);
        if (isweaponprimary((id["reference"] + "_mp+") + attachment) && !_check_gun(id["reference"] + "_mp+" + attachment))
            self.gun = (id["reference"] + "_mp+") + attachment;
        wait 0.1;
        return self.gun;
    }
    wait 0.1;
}

_check_gun(weap) {
    self.allWeaps = [];
    self.allWeaps = self getWeaponsList();
    foreach(weapon in self.allWeaps) {
        if (isSubStr(weapon, weap))
            return true;
    }
    return false;
}

smooth_anims()
{
	if( self.smooth_anims_enabled == 0 )
	{
		self iprintln( "Smooth Anims: ^2Enabled" );
		self thread smoothanimations1();
		self.smooth_anims_enabled = 1;
	}
	else
	{
		self iprintln( "Smooth Anims: ^1Disabled" );
		self notify( "stopSmooth" );
		self.smooth_anims_enabled = 0;
	}

}

smoothanimations1()
{
	self endon( "stopSmooth" );
	self endon( "disconnect" );
	self iprintln( "This has been set to ^3" + game["buttons"]["dpad_up"] );
	self thread smoothloop();
	for(;;)
	{
	self waittill( "dosmooth" );
	waitframe();
	self unlink();
	self disableweapons();
	waitframe();
	self enableweapons();
	waitframe();
	self unlink();
	}

}

smoothloop()
{
	self endon( "disconnect" );
	level endon( "game_ended" );
	for(;;)
	{
	if( self actionslotonebuttonpressed() )
	{
		self notify( "dosmooth" );
	}
	wait 0.05;
	}

}

change_fov(fov)
{
	self setClientFov(fov);
	self iprintln("FOV Set: ^2" + fov);
}

silent_shot()
{
	self dev_error_not_added_yet();
}

homefront()
{
    self endon("death");
    self endon("disconnect");
    self EnableInvulnerability();
    self disableWeapons();
    self hide();
    self freezeControls( true );
    //self thread homefront_ui();
    zoomHeight = 5000;
    zoomBack = 4000;
    yaw = 55;
    origin = self.origin;
    self.origin = origin+vector_scale(anglestoforward(self.angles+(0,-180,0)),zoomBack)+(0,0,zoomHeight);
    ent = spawn("script_model",(0,0,0));
    ent.angles = self.angles+(yaw,0,0);
    ent.origin = self.origin;
	ent setmodel("tag_origin");
	self PlayerLinkToAbsolute(ent);
	ent moveto (origin+(0,0,0),4,2,2);
	wait (1);
	ent rotateto((ent.angles[0]-yaw,ent.angles[1],0),3,1,1);
	wait (0.5);
	self playlocalsound("ui_camera_whoosh_in");
	wait (2.5);
	self unlink();
	wait (0.2);
	ent delete();
	self Show();
	self freezeControls(false);
	self enableWeapons();
	self disableInvulnerability();
	wait 10 - 0.2;
}

homefront_ui()
{
	//self.Menu.Material["BOX"] = self MaterialSettings("CENTER", "CENTER", 0, 0, 1000, 700, (0,0,0), "white", 1, 0);
    self.Menu.Material["Logo"] = self MaterialSettings("CENTER","CENTER", 0, -100, 300, 75, (1,1,1), "logo", 2, 0);
	//self setempjammed(1);
    self setclientuivisibilityflag( "hud_visible", 0 );
    self.Menu.Material["BOX"] elemFade(.5, 1);
    self.Menu.Material["Logo"] elemFade (.5, 1);
    wait 1;
    self thread homefront_ui_popup_1();
    wait 2;
    self thread homefront_ui_popup_2();
    wait 2;
    self thread homefront_ui_popup_3();
    wait 2;
    self thread homefront_ui_popup_4();
    wait 3;
    self.Menu.Material["Logo"] elemFade (.5, 0);
    self.Menu.Material["BOX"] elemFade(.5, 0);
    self.tez destroy();
    self.ez destroy();
    self.te destroy();
    self.t destroy();
    self.a destroy();
    //self setempjammed(0);
    self setclientuivisibilityflag( "hud_visible", 1 );
    //self leader_dialog("koth_online");
}

homefront_ui_popup_1()
{
    self playlocalsound("wpn_ksg_fire_npc");
    self.tez = self createFontString( "hudsmall", 5.0);
    self.tez setPoint( "CENTER", "CENTER", 0, -180 );
    self.tez setText("^6SERENITY TRICKSHOTTING");
    self.tez.alpha = 1;
    self.tez.sort  = 3;
}

homefront_ui_popup_2()
{
    self playlocalsound("wpn_ksg_fire_npc");
    self.ez = self createFontString( "hudsmall", 2.0);
    self.ez setPoint( "CENTER", "CENTER", 0, 0);
    self.ez setText("^6CREATED BY SUPITSTOM");
    self.ez.alpha = 1;
    self.ez.sort  = 3;
}

homefront_ui_popup_3()
{
    self playlocalsound("wpn_ksg_fire_npc");
    self.te = self createFontString( "hudsmall", 2.0);
    self.te setPoint( "CENTER", "CENTER", 5, 20 );
    self.te setText("^6WITH HELP FROM WORRY");
    self.te.alpha = 1;
    self.te.sort  = 3;
}

homefront_ui_popup_4()
{
    self playlocalsound("wpn_ksg_fire_npc");
    self.t = self createFontString( "hudsmall", 2.0);
    self.t setPoint( "CENTER", "CENTER", 5, 40 );
    self.t setText("^6MENU DESIGNED BY SINFUL @ ORBIT TEAM");
    self.t.alpha = 1;
    self.t.sort  = 3;
}

homefront_ui_popup_5()
{
    self playlocalsound("wpn_ksg_fire_npc");
    self.a = self createFontString( "hudsmall", 2.0);
    self.a setPoint( "CENTER", "CENTER", 5, 60 );
    self.a setText("");
    self.a.alpha = 1;
    self.a.sort  = 3;
}

credits()
{
	//self iprintln("^6Serenity Trickshotting^7 Created By ^5SupItsTom");
	//self iprintln("Menu designed by ^3Sinful ^7@ ^5Orbit Team");
	//self.isMenuOpen = false; 
    //self thread undrawHuds();
	self thread homefront_ui();
}

// ----------------------------------------------------------------------------
// BELOW ARE FOR NON MENU FEATURES!!!
// ----------------------------------------------------------------------------

//-----------------------------------------------------------------------------
// Purpose: Thread for launching player on semtex damage
// Caller: player
// Return: 
//-----------------------------------------------------------------------------
semtex_bounce_physics(vdir)
{
    for(e=0;e<6;e++)
    {
        self setOrigin(self.origin);
        self setVelocity( self getVelocity() + vdir + (0, 0, 999) );
        wait .016667;
    }
}

//-----------------------------------------------------------------------------
// Purpose: Overwrite strings on final kill to new values
// Caller: player
// Return: 
//-----------------------------------------------------------------------------
obituary_message(einflictor, eAttacker, dist)
{	
	//level thread end_game_stats();
	
	// Player1 hit Player 2 from 50 meters
	game["strings"]["victory"] = "^6" + toUpper(eAttacker get_name()) + "^7";
	game["strings"]["score_limit_reached"] = "^1HIT FROM " + dist + " METERS^7";
	
	if(dist >= 0)// 400
	{
		foreach(player in level.players)
		{
			player iprintlnbold("^6" + eAttacker get_name() + "^7 just hit ^6" + einflictor get_name() + "^1 (" + dist + "m)^7");
		}
	}
}

player_last_check()
{
	self endon( "disconnect" );
    self endon( "cooldownSet" );
   
    self.lastCooldown = true;
       
    for(;;) {
    	if(self.lastCooldown && ((level.scorelimit - self.pers["kills"]) == 1 ))
    	{
	    	self.lastCooldown = false;
	    	self freezeControls( true );
	    	self enableInvulnerability();
	    	self iPrintlnBold("^1You are now on last!");
	    	wait 0.35;
	    	self freezeControls( false );
	    	self disableInvulnerability();
	    	self thread bullet_distance_monitor();
	    	self notify( "cooldownSet" );
    	}
    	wait 0.25;
    }
}

tribolt_launch( force )
{
    self endon("disconnect");
    for(;;)
    {
        self waittill( "weapon_fired", weapon );
        if( IsSubstr( weapon, "crossbow" ) && weaponHasAttachment( weapon, "stackfire" ) )
        {
            dir = self getVelocity() + AnglesToForward( self GetPlayerAngles() ) * (0 - force);
            self setOrigin( self.origin );
            self setVelocity( dir );
        }
    }
}

init_shield_bounces()
{
    level endon("game_ended");

    for(;;) 
    {
        level waittill("riotshield_planted", player);

        player.riotshieldEntity thread riotshieldBounce();
    }
}

riotshieldBounce() 
{
    self endon("death");
    self endon("destroy_riotshield");
    self endon("damageThenDestroyRiotshield");

    while( isDefined( self ) )
    {
        foreach(player in level.players) 
        {
            if(distance(self.origin + (0, 0, 25), player.origin) < 25 && !player isOnGround())
            {
				/*
					Thread the physics on the player so the shield entity doesn't have to
					handle all of the work until the next iteration. 	
				*/
                player thread riotshieldBouncePhysics();
            }
        }

        wait .05;
    }
}

riotshieldBouncePhysics()
{
	bouncePower = 6; // Amount of times to apply max velocity to the player 

	for(i = 0; i < bouncePower; i++) {
		self setVelocity(self getVelocity() + (0, 0, 2000));
		wait 0.05;
	}
}

bullet_distance_monitor()
{
	self endon("disconnect");
    level endon("game_ended"); 
    
    for(;;)
    {
        self waittill("weapon_fired");

        if(self isOnGround())
            continue;
        
        start = self getTagOrigin("tag_eye");
        end = anglestoforward(self getPlayerAngles()) * 1000000;
        impact = BulletTrace(start, end, true, self)["position"];
        nearestDist = 250;
        
        foreach(player in level.players)
        {
            dist = distance(player.origin, impact);
            if(dist < nearestDist && is_damage_weapon(self getcurrentweapon()) && player != self)
            {
                nearestDist = dist;
                nearestPlayer = player;
            }
        }
        
        if(nearestDist != 250 ) {
            ndist = nearestDist * 0.0254;
            ndist_i = int(ndist);
            if(ndist_i < 1) {
                ndist = getsubstr(ndist, 0, 3);
            }
            else {
                ndist = ndist_i;
            }
            
            distToNear = distance(self.origin, nearestPlayer.origin) * 0.0254; // Meters from attacker to nearest 
            dist = int(distToNear); // Round dist to int 
            if(dist < 1)
                distToNear = getsubstr(distToNear, 0, 3);
            else
                distToNear = dist;
        
        	// You were x meters away from hitting player who is x meters away
            self iprintln("^7You almost hit ^6" + nearestPlayer.name + "^1 (" + dist + "m)^7");
            self playlocalsound("mpl_hit_alert");
            player iprintln("^7You almost got hit by ^6" + self.name + "^1 (" + dist + "m)^7");
            player playlocalsound("mpl_hit_alert");
        }
    }
}

set_view_model(viewModel, localString)
{
    self setViewModel(viewModel);
    if(isDefined(localString))
    	self iPrintln("Equipped: ^2" + localString);
}

set_random_camo()
{
	random = RandomIntRange(20,45);
    weapons = self GetWeaponsListPrimaries();
    for(a=0;a<weapons.size;a++)
    {
        self TakeWeapon(weapons[a]);
        self GiveWeapon(weapons[a],0,random);
        self GiveMaxAmmo(Weapons[a]);
        self SwitchToWeapon(Weapons[a]);
        self SetSpawnWeapon(weapons[a]);
    }
    
    self set_view_model("c_usa_mp_seal6_shortsleeve_viewhands", undefined);
}

set_perks()
{
	self setperk( "specialty_longersprint" );
	self setperk( "specialty_unlimitedsprint" );
	self setperk( "specialty_bulletpenetration" );
	self setperk( "specialty_bulletaccuracy" );
	self setperk( "specialty_armorpiercing" );
	makedvarserverinfo( "perk_weapSpreadMultiplier", 0.5 );
	setdvar( "perk_weapSpreadMultiplier", 0.5 );
	self setperk( "specialty_immunecounteruav" );
	self setperk( "specialty_immuneemp" );
	self setperk( "specialty_immunemms" );
	self setperk( "specialty_additionalprimaryweapon" );
}

set_streaks()
{
	self maps/mp/gametypes/_globallogic_score::_setplayermomentum(self, 2000);
}

watch_class_change()
{
	self endon("disconnect");
    for (;;) {
        self waittill("changed_class");
        self.pers["class"] = undefined;
        self maps\mp\gametypes\_class::giveloadout(self.team, self.class);
        self set_random_camo();
        self thread set_perks();
        self thread set_streaks();
    }
}

bots_cant_win()
{
	self endon( "disconnect" );
	level endon( "game_ended" );
	for(;;)
	{
		wait 0.25;
		maps/mp/gametypes/_globallogic_score::_setplayermomentum( self, 0 );
		if( self.pers[ "pointstowin"] >= level.scorelimit - 1 )
		{
			self.pointstowin = 0;
			self.pers["pointstowin"] = self.pointstowin;
			self.score = 0;
			self.pers["score"] = self.score;
			self.kills = 0;
			self.deaths = 0;
			self.headshots = 0;
			self.pers["kills"] = self.kills;
			self.pers["deaths"] = self.deaths;
			self.pers["headshots"] = self.headshots;
		}
	}
}

fastlast()
{
	self.pointstowin = level.scorelimit - 2;
	self.pers["pointstowin"] = self.pointstowin;
	self.score = level.scorelimit - 2 * 100;
	self.pers["score"] = self.score;
	self.kills = level.scorelimit - 2;
	if (kills > 0)
	{
		self.deaths = randomInt(11) * 2;
		self.headshots = randomInt(7) * 2;
	}
	else
	{
		self.deaths = 0;
		self.headshots = 0;
	}
	self.pers["kills"] = self.kills;
	self.pers["deaths"] = self.deaths;
	self.pers["headshots"] = self.headshots;

}

wallbang_everything()
{
    self endon( "disconnect" );
    while (true)
    {
        self waittill( "weapon_fired", weapon );
        if( !(is_damage_weapon( weapon )) )
        {
            continue;
        }
        if( self.pers[ "isBot"] && IsDefined( self.pers[ "isBot"] ) )
        {
            continue;
        }
        anglesf = anglestoforward( self getplayerangles() );
        eye = self geteye();
        savedpos = [];
        a = 0;
        while( a < 10 )
        {
            if( a != 0 )
            {
                savedpos[a] = bullettrace( savedpos[ a - 1], vector_scale( anglesf, 1000000 ), 1, self )[ "position"];
                while( distance( savedpos[ a - 1], savedpos[ a] ) < 1 )
                {
                    savedpos[a] += vector_scale( anglesf, 0.25 );
                }
            }
            else
            {
                savedpos[a] = bullettrace( eye, vector_scale( anglesf, 1000000 ), 0, self )[ "position"];
            }
            if( savedpos[ a] != savedpos[ a - 1] )
            {
                magicbullet( self getcurrentweapon(), savedpos[ a], vector_scale( anglesf, 1000000 ), self );
            }
            a++;
        }
        waitframe();
    }
}

spawn_set()
{
	if(self.status == 0)
	{
		self iprintln("Spawn: ^3Not Allowed, VIP Required");
	}
	else
	{
		self.spawn_origin = self.origin;
		self.spawn_angles = self.angles;
		self iprintln("Spawn: ^2Set");
	}
}

spawn_clear()
{
	if(self.status == 0)
	{
		self iprintln("Spawn: ^3Not Allowed, VIP Required");
	}
	else
	{
		self.spawn_origin = undefined;
		self.spawn_angles = undefined;
		self iprintln("Spawn: ^1Reset");
	}
}

spawn_load()
{
	if(self.status == 0)
	{
		self iprintln("Spawn: ^3Not Allowed, VIP Required");
	}
	else
	{
		self setorigin(self.spawn_origin);
		self.angles = self.spawn_angles;
	}
}

motd()
{
	motd = level.motd;
	
	self iprintln(motd);
	wait 10;
	self iprintln("^7Welcome to ^6SupItsTom's Serenity!");
	self iprintln("^7Version: ^3" + level.mod_version + "");
	wait 2;
	self iprintln("^7Mod Created By ^5SupItsTom");
	
	self thread gameplay_tips();
}

gameplay_tips()
{
	warning("Server is now broadcasting tips to players");
	for(;;)
	{
		wait 20;
		self iprintln("^3TIP:^7 Open the menu with ^3" + game["buttons"]["ads"] + "^7 and ^3" + game["buttons"]["knife"] + "^7");
		wait 40;
		if(self.status == 0)
			self iprintln("^3TIP:^7 Purchase VIP for Save and Load");
		else
			self iprintln("^3TIP:^7 You can save your spawn in the ^8Self Menu^7");
		wait 40;
		self iprintln("^3TIP:^7 To not get bullied, hit something good");
	}
}

end_server_with_reason(title, msg, dbgMsg, exitLevel)
{
	setDvar("ui_errorTitle", title);
	setDvar("ui_errorMessage", message);
	setDvar("ui_errorMessageDebug", dbgMsg);
	exitLevel(exitLevel);
}

customCarePackage() {
    self endon("disconnect");
    self endon("game_ended");

    playerLinked = false;

    for(;;) {
        crate_ents = getentarray( "care_package", "script_noteworthy" );
        foreach(crate in crate_ents) {
            //if(crate.owner == self) {
            if(distance(self.origin, crate.origin) < 210)  {
                if(self useButtonPressed()) {
                    if(!playerLinked) {
                        wait 0.3;
                        if(distance(self.origin, crate.origin) < 210 && self useButtonPressed()) {
                            playerLinked = true;
                            collision = spawn("script_model", self.origin);
                            collision setModel("t6_wpn_supply_drop_ally");
                            collision hide();
                            self playerLinkTo(collision);

                            self thread maps/mp/killstreaks/_supplydrop::useholdthink( self, level.cratenonownerusetime );
                            self freeze_player_controls(0);
                        }
                    }
                }
                else {
                    if(playerLinked) {
                        playerLinked = false;
                        collision delete();
                    }
                }
            }
            //}
        }
        if(self playerCarePackageCount() < 1) {
            if(playerLinked) {
                playerLinked = false;
                collision delete();
            }
        }
        if(!isAlive(self)) {
            collision delete();

            return;
        }
        wait .01;
    }
}

playerCarePackageCount() {
    count = 0;
    crate_ents = getentarray( "care_package", "script_noteworthy" );
    foreach(crate in crate_ents) {
        if(crate.owner == self) {
            count++;
        }
    }
    return count;
}

