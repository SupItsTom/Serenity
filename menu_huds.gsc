drawHuds()
{
    //Shader Huds
    self.Hud.TitleBG    = self createRectangle( "TOPCENTER", "TOPCENTER", -100, 50, 200, 50, ( 200/255, 200/255, 200/255 ), self.sMenu["Header"], 0, 1 );
    self.Hud.SubTitleBG = self createRectangle( "TOPCENTER", "TOPCENTER", -100, 100, 200, 15, ( 30/255, 30/255, 30/255 ), "white", 0, 1 );
    self.Hud.OptionBG   = self createRectangle( "TOPCENTER", "TOPCENTER", -100, 114, 200, 1000, ( 50/255, 50/255, 50/255 ), "white", 0, 1 );
    self.Hud.Scrollbar  = self createRectangle( "TOPCENTER", "TOPCENTER", -100, 115, 200, 15, ( 75/255, 75/255, 75/255 ), "white", 1, 1 );
    self.Hud.Bottom     = self createRectangle( "TOPCENTER", "TOPCENTER", -100, 259, 200, 20, ( 30/255, 30/255, 30/255 ), "white", 1, 1 );
    self.Hud.DescBG     = self createRectangle( "TOPCENTER", "TOPCENTER", -100, 282, 200, 15, ( 30/255, 30/255, 30/255 ), "white", 1, 1 );
    
    //Text Huds
    self.Hud.MenuName      = self createText("default", 2, "TOPCENTER", "TOPCENTER", -100, 65, 1, 1, "Serenity Trickshotting", ( 1, 1, 1 ) );
    self.Hud.SubText       = self createText("default", 1, "TOPLEFT", "TOPCENTER", -195, 101, 99, 1, "", ( 1, 1, 1) );
    self.Hud.BottomThing   = self createText("default", 1.7, "TOPCENTER", "TOPCENTER", -100, 252, 99, 1, ". . .", ( 1, 1, 1));
    self.Hud.OptionCounter = self createText("default", 1, "TOPRIGHT", "TOPCENTER", -5, 262, 99, 1, "", ( 1, 1, 1));
    self.Hud.OptDesc       = self createText("default", 1, "TOPLEFT", "TOPCENTER", -195, 283, 99, 1, "", ( 1, 1, 1));
}

createMenuText()
{
    if(isDefined(self.Hud.Option))
        self.Hud.Option destroy();
        
        self.Hud.Option = self createText( "default", 1.2, "TOPLEFT", "TOPCENTER", -195, 114.5, 99, 1, "", ( 1, 1, 1) );
}

destroyMenuText()
{
    self.Hud.Option destroy();
}

undrawHuds()
{
    self.Hud.TitleBG destroy();
    self.Hud.SubTitleBG destroy();
    self.Hud.OptionBG destroy();
    self.Hud.Scrollbar destroy();
    self.Hud.Bottom destroy();
    self.Hud.DescBG destroy();

    //Text Huds
    self.Hud.MenuName destroy();
    self.Hud.SubText destroy();
    self.Hud.BottomThing destroy();
    self.Hud.OptionCounter destroy();
    self.Hud.OptDesc destroy();
    self destroyMenuText();
    self destroy_info();
}

resizeMenu()
{
    optCount = self.Menu.Text[self.Menu.CurrentMenu].size;
    
    if( OptCount == 1 )
    {
        self.Hud.OptionBG setShader("white", 200, 15 * 1 );
        self.Hud.Bottom.y        = 130;
        self.Hud.OptionCounter.y = 133;
        self.Hud.BottomThing.y   = 123;
        self.Hud.DescBG.y        = 153;
        self.Hud.OptDesc.y       = 154;
    }
    if( OptCount == 2 )
    {
        self.Hud.OptionBG setShader("white", 200, 15 * 2 );
        self.Hud.Bottom.y        = 144;
        self.Hud.OptionCounter.y = 147;
        self.Hud.BottomThing.y   = 137;
        self.Hud.DescBG.y        = 167;
        self.Hud.OptDesc.y       = 168;
    }
    if( OptCount == 3 )
    {
        self.Hud.OptionBG setShader("white", 200, 15 * 3 );
        self.Hud.Bottom.y        = 158;
        self.Hud.OptionCounter.y = 161;
        self.Hud.BottomThing.y   = 151;
        self.Hud.DescBG.y        = 181;
        self.Hud.OptDesc.y       = 182;
    }
    if( OptCount == 4 )
    {
        self.Hud.OptionBG setShader("white", 200, 15 * 4 );
        self.Hud.Bottom.y        = 172;
        self.Hud.OptionCounter.y = 175;
        self.Hud.BottomThing.y   = 164;
        self.Hud.DescBG.y        = 195;
        self.Hud.OptDesc.y       = 196;
    }
    if( OptCount == 5 )
    {
        self.Hud.OptionBG setShader("white", 200, 15 * 5 );
        self.Hud.Bottom.y        = 187;
        self.Hud.OptionCounter.y = 190;
        self.Hud.BottomThing.y   = 180;
        self.Hud.DescBG.y        = 209;
        self.Hud.OptDesc.y       = 210;
    }
    if( OptCount == 6 )
    {
        self.Hud.OptionBG setShader("white", 200, 15 * 6 );
        self.Hud.Bottom.y        = 201;
        self.Hud.OptionCounter.y = 204;
        self.Hud.BottomThing.y   = 194;
        self.Hud.DescBG.y        = 224;
        self.Hud.OptDesc.y       = 225;
    }
    if( OptCount == 7 )
    {
        self.Hud.OptionBG setShader("white", 200, 15 * 7 );
        self.Hud.Bottom.y        = 216;
        self.Hud.OptionCounter.y = 219;
        self.Hud.BottomThing.y   = 209;
        self.Hud.DescBG.y        = 238;
        self.Hud.OptDesc.y       = 239;
    }
    if( OptCount == 8 )
    {
        self.Hud.OptionBG setShader("white", 200, 15 * 8 );
        self.Hud.Bottom.y        = 230;
        self.Hud.OptionCounter.y = 233;
        self.Hud.BottomThing.y   = 223;
        self.Hud.DescBG.y        = 252;
        self.Hud.OptDesc.y       = 253;
    }
    if( OptCount == 9 )
    {
        self.Hud.OptionBG setShader("white", 200, 15 * 9 );
        self.Hud.Bottom.y        = 245;
        self.Hud.OptionCounter.y = 248;
        self.Hud.BottomThing.y   = 238;
        self.Hud.DescBG.y        = 267;
        self.Hud.OptDesc.y       = 268;
    }
    if( OptCount >= 10 )
    {
        self.Hud.OptionBG setShader("white", 200, 15 * 10 );
        self.Hud.Bottom.y        = 259;
        self.Hud.OptionCounter.y = 262;
        self.Hud.BottomThing.y   = 252;
        self.Hud.DescBG.y        = 281;
        self.Hud.OptDesc.y       = 282;
    }
}

destroy_info()
{
    for( i = 0; i < 24; i++ )
        self.Hud.Bools[i] destroy();
}

option_info(index, hud_index, override)
{
    menu = self.Menu.CurrentMenu;
    if( index < 0 || hud_index > 10 )
        return;
    if(!isDefined(index) || !isDefined(hud_index)){
        return;
    }
    if(!self.Menu.isBool[menu][index] && !self.Menu.isSlider[menu][index] && !self.Menu.isInt[menu][index] && !self.Menu.isSubMenu[menu][index] )
         return;
    
    if(self isBoolOption(menu,index) && !self isSubMenu(menu,index) && !self isSliderOption(menu,index) ) 
    {
        
        off_color    = ( 1, 0, 0 );
        toggle_color = ( 1, 1, 1 );
        self.scrolling_index++;
         
        if(self.Menu.Bool[menu][index] == true)
        {
            self.Hud.Bools[self.scrolling_index] = createRectangle("CETNER", "CENTER", -10, -81 + ( 14.4 * hud_index ), 10, 10, toggle_color, "thumbsup", 9, 1, true);
            self.scrolling_index ++;
        }
        if(self.Menu.Bool[menu][index] == false)
        {
            self.Hud.Bools[self.scrolling_index] = createRectangle("CETNER","CENTER", -10, -81 + ( 14.4 * hud_index ), 10, 10, toggle_color, "menu_mp_lobby_locked", 9, 1);
            self.scrolling_index ++;
        }

    }
    if( self isSubMenu( menu, index ) && !self isBoolOption(menu,index) && !self isSliderOption(menu,index) )
    {
        self.Hud.Bools[self.scrolling_index] = self createText("default", 1.4, "RIGHT", "CENTER", -5, -86 + ( 14.4 * hud_index ), 99, 1, ". . .", ( 1, 1, 1));
        self.scrolling_index++;
    }
    if( self isSliderOption(menu, index) && !self isBoolOption(menu,index) && !self isSubMenu(menu,index) )
    {
        width = 85* (self.Menu.Slider[self.Menu.CurrentMenu][index] - self.Menu.SliderMin[self.Menu.CurrentMenu][index]) / (self.Menu.SliderMax[self.Menu.CurrentMenu][index] - self.Menu.SliderMin[self.Menu.CurrentMenu][index]);
        width = int(width + 1);
        
        self.Hud.Bools[self.scrolling_index] = createText("default", 1.2, "RIGHT", "CENTER", -5, -82 + ( 14.4 * hud_index ), 14, 1, self.Menu.SliderValue[menu][index], ( 1, 1, 1 ));
        self.scrolling_index++;
    }
}






