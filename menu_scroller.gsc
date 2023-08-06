_scrollUpdate()
{
    if( self.Scroller < 0 )
    {
        self.Scroller = self.Menu.Text[self.Menu.CurrentMenu].size-1;
    }
    if(self.Scroller>self.Menu.Text[self.Menu.CurrentMenu].size-1)
    {
        self.Scroller = 0;
    }
    if(self.Menu.Slider[self.Menu.CurrentMenu][self.Scroller] > self.Menu.SliderMax[self.Menu.CurrentMenu][self.Scroller] )
    {
        self.Menu.Slider[self.Menu.CurrentMenu][self.Scroller] = 0;
    }
    if(self.Menu.Slider[self.Menu.CurrentMenu][self.Scroller] < 0)
    {
        self.Menu.Slider[self.Menu.CurrentMenu][self.Scroller] = self.Menu.SliderMax[self.Menu.CurrentMenu][self.Scroller];
    }

    self.scrolling_index = 0;
    self destroy_info();
    self optStruct();
    ary = 0;

    if(self.Menu.Text[self.Menu.CurrentMenu].size > 10)
    {
        if(self.scroller >= 10)
        ary   = self.Scroller - 10 - 1;
        final = "";
        for(e = 0; e < 10; e++ )
        {
            if(isDefined(self.Menu.Text[self.Menu.CurrentMenu][self.Scroller]))
            {
                final += self.Menu.Text[self.Menu.CurrentMenu][ary + e] + "^7\n";
                self option_info(ary+e, e);
            }
        }
    }
    else
    {
        final = "";
        for( e = 0 ;e < self.Menu.Text[self.Menu.CurrentMenu].size; e++)
        {
            if(isDefined(self.Menu.Text[self.Menu.CurrentMenu][e]))
            {
                final += self.Menu.Text[self.Menu.CurrentMenu][e] + "^7\n";
                self option_info(ary+e, e);
            }
        } 

    }

    self.Hud.Option _setText( final );
    self.Hud.OptionCounter _setText(  ( self.Scroller + 1 ) + "/" + self.Menu.Text[self.Menu.CurrentMenu].size );
    self.Hud.OptDesc _setText( self.Menu.Desc[self.Menu.CurrentMenu][self.Scroller] );

    //self.Hud.Scrollbar.y = 115 + ( 14.4 * (self.Scroller < 10 ? self.Scroller : 9 ) );
    
    if( self.Scroller > 9 )
    {
    	self.Hud.Scrollbar.y = 115 + ( 14.4 * 9 );
    }
    else 
    {
    	self.Hud.Scrollbar.y = 115 + ( 14.4 * self.Scroller );
    }
}




