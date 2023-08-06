menu_init()
{
    self.Hud        = spawnstruct();
    self.Menu       = spawnstruct();
    self.sMenu["Header"] = "emblem_bg_roxann_soldier";//emblem_bg_ghost
    self.isMenuOpen = false;
}

buttonMon()
{
    self endon("disconnect");
    for(;;)
    {
        if( self.isMenuOpen == false )
        {
            if( self adsbuttonpressed() && self meleebuttonpressed() )
            {
                self drawHuds();
                self _loadMenu("main");
                self.isMenuOpen = true;
                wait .3;
            }
        }
        else
        {
            if( self adsbuttonpressed() )
            {
                self.Scroller --;
                self _scrollUpdate();
                wait .2;
            }
            if( self attackbuttonpressed() )
            {
                self.Scroller ++;
                self _scrollUpdate();
                wait .2;
            }
            if( self meleebuttonpressed() )
            {
                if( self.Menu.parent[ self.Menu.CurrentMenu ] == "Exit")
                {
                    self.isMenuOpen = false; 
                    self thread undrawHuds();
                }
                else
                {
                    self _loadMenu(self.Menu.parent[self.Menu.CurrentMenu]);
                }
                wait .1;
            }
            if( self usebuttonpressed() )
            {
                a1 = self.Menu.a1[self.Menu.CurrentMenu][self.scroller];
                a2 = self.Menu.a2[self.Menu.CurrentMenu][self.scroller];
                a3 = self.Menu.a3[self.Menu.CurrentMenu][self.scroller];
                a4 = self.Menu.a4[self.Menu.CurrentMenu][self.scroller];
                self thread [[self.Menu.Func[self.Menu.CurrentMenu][self.Scroller]]](a1,a2,a3,a4);
                self _scrollUpdate();
                wait .3;
                self _scrollUpdate();
            }
            if( self fragbuttonpressed() )
            {
                self.Menu.Slider[self.Menu.CurrentMenu][self.Scroller] += self.Menu.SliderIncr[self.Menu.CurrentMenu][self.Scroller];
                self _scrollUpdate();
                wait .2;
            }
            if( self secondaryoffhandbuttonpressed() )
            {
                self.Menu.Slider[self.Menu.CurrentMenu][self.Scroller] -= self.Menu.SliderIncr[self.Menu.CurrentMenu][self.scroller];
                self _scrollUpdate();
                wait .2;
            }
        }
        wait .1;
    }
}







