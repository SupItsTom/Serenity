SliderTests( value )
{
	self iprintln(value);
}

toggle_godmode_dev()
{
	if( !isDefined( self.invulnerable ) )
    {
        self.invulnerable = false;
    }
    if( !self.invulnerable )
    {
        self EnableInvulnerability();
        self.invulnerable = true;
        self iprintln("God Mode: ^2ON");
    }
    else 
    {
        self DisableInvulnerability();
        self.invulnerable = false;
        self iprintln("God Mode: ^1OFF");
    }
}

enable_cheats()
{
	setDvar("sv_cheats", 1);
}

toggle_noclip()
{
	self notify( "StopNoClip" );
	if( !(IsDefined( self.noclip )) )
	{
		self.noclip = 0;
	}
	self.noclip = !(self.noclip);
	if( self.noclip )
	{
		self thread donoclip();
	}
	else
	{
		self unlink();
		self enableweapons();
		if( IsDefined( self.noclipentity ) )
		{
			self.noclipentity delete();
			self.noclipentity = undefined;
		}
	}
	if( self.noclip )
	{
	}
	else
	{
	}
	//self iprintlnbold( "^2ON" + "^1OFF", "NoClip " );

}

donoclip()
{
	self notify( "StopNoClip" );
	if( IsDefined( self.noclipentity ) )
	{
		self.noclipentity delete();
		self.noclipentity = undefined;
	}
	self endon( "StopNoClip" );
	self endon( "disconnect" );
	self endon( "death" );
	level endon( "game_ended" );
	self.noclipentity = spawn( "script_origin", self.origin, 1 );
	self.noclipentity.angles = self.angles;
	self playerlinkto( self.originobj, undefined );
	noclipfly = 0;
	self iprintln( "Press [{+smoke}] To ^2Enable ^7NoClip." );
	self iprintln( "Press [{+gostand}] To Move Fast." );
	self iprintln( "Press [{+stance}] To ^1Disable ^7NoClip." );
	while( self.noclip && IsDefined( self.noclip ) )
	{
		if( !noclipfly )
		{
			self disableweapons();
			self playerlinkto( self.noclipentity );
			noclipfly = 1;
		}
		else
		{
			if( noclipfly && self secondaryoffhandbuttonpressed() )
			{
				self.noclipentity moveto( self.origin + vector_scale( anglestoforward( self getplayerangles() ), 30 ), 0.01 );
			}
			else
			{
				if( noclipfly && self jumpbuttonpressed() )
				{
					self.noclipentity moveto( self.origin + vector_scale( anglestoforward( self getplayerangles() ), 170 ), 0.01 );
				}
				else
				{
					if( noclipfly && self stancebuttonpressed() )
					{
						self unlink();
						self enableweapons();
						noclipfly = 0;
					}
				}
			}
		}
		wait 0.01;
	}

}

dump_viewpos()
{
	dbgprint("^5Origin: " + self.origin + " ^7- ^5Angle: " + self.angles + " ^7- ^5Map: " + getDvar("ls_mapname"));
	self iprintln("^1dump_viewpos: see console");
}

dump_weapon()
{
	current_weapon = self getCurrentWeapon();
	dbgprint("^5Weapon Name: " + getweapondisplayname(current_weapon) + " ^7- ^5Weapon ID: " + current_weapon);
	self iprintln("^1dump_weapon: see console");
}

dev_error_not_added_yet()
{
	self iprintln("^1Menu: ^7Feature not added yet");
}

error_read_only()
{
	self iprintln("^1Menu: ^7Feature is read-only (marked with ^1*^7)");
}



