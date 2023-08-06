init_overFlowFix()
{
    level.overFlowFix_Started = true;
    level.strings             = [];
    
    level.overflowElem = createServerFontString("default",1.5);
    level.overflowElem setText("overflow");   
    level.overflowElem.alpha = 0;
    
    level thread overflowfix_monitor();
}


_setText(string)
{
    self.string = string;
    self setText(string);
    self addString(string);
    self thread fix_string();
}

addString(string)
{
    level.strings[level.strings.size] = string;
    level notify("string_added");
}

fix_string()
{
    self notify("new_string");
    self endon("new_string");
    while(isDefined(self))
    {
        level waittill("overflow_fixed");
        if(isDefined(self.string))
        {
            self _setText(self.string);
        }
    }
}

overflowfix_monitor()
{  
    level endon("game_ended");
    for(;;)
    {

        level waittill("string_added");
        if(level.strings.size >= 45)
        {
            level.overflowElem clearAllTextAfterHudElem();
            level.strings = [];
            level notify("overflow_fixed");
            
            foreach(player in level.players)
            {
                player fixHuds();
            }
        }
        wait 0.01; 
    }
}

inArray(ar,string)
{
    for(i=0;i<ar.size;i++)
    {
        if(ar[i]==string)
        {
            return true;
        }
    }
    return false;      
}

fixHuds()
{
    self.Hud.Submenu _setText(self.Menu.title[self.Menu.CurrentMenu]);
}




