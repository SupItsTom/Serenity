changeHeader( shader )
{
    self.Hud.TitleBG destroy();

    self.Hud.TitleBG = self createRectangle( "TOPCENTER", "TOPCENTER", -100, 50, 200, 50, ( 200/255, 200/255, 200/255 ), shader, 0, 1 );

    self.sMenu["Header"] = shader;
}



