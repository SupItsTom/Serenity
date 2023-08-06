addMenu( menu, title, parent )
{
    self.Menu.title[menu] = title;
    self.Menu.parent[menu] = parent;
}

addSubmenu(menu, index, text, desc, func, define_name)
{
    self.Menu.Text[menu][index] = text;
    self.Menu.Func[menu][index] = func;
    self.Menu.a1[menu][index] = define_name;
    self.Menu.isBool[menu][index] = false;
    self.Menu.isSubMenu[menu][index] = true;
    self.Menu.isSlider[menu][index] = false;
    self.Menu.SubMenuBool[menu][index] = false;
    self.Menu.isInt[menu][index] = false;
    self.Menu.Desc[menu][index] = desc;
}

addOpt (menu, index, text, desc, func, input, input2, input3, input4 )
{
    self.Menu.Text[menu][index] = text;
    self.Menu.Func[menu][index] = func;
    self.Menu.Desc[menu][index] = desc;
    
    self.Menu.a1[menu][index] = input;
    self.Menu.a2[menu][index] = input2;
    self.Menu.a3[menu][index] = input3;
    self.Menu.a4[menu][index] = input4;
    
    self.Menu.Bool[menu][index] = undefined; 
    
    self.Menu.isBool[menu][index] = false; 
    self.Menu.isSlider[menu][index] = false; 
    self.Menu.isInt[menu][index] = false;
    self.Menu.SubMenuBool[menu][index] = false;
}

addBoolean( menu, index, text, desc, variable, func, input )
{
    self.Menu.Text[menu][index] = text;
    self.Menu.Func[menu][index] = func;
    self.Menu.Desc[menu][index] = desc;
    
    self.Menu.a1[menu][index] = input;
    
    if(!isDefined(variable)) variable  = false;
    self.Menu.Bool[menu][index] = variable; 
    
    self.Menu.isBool[menu][index] = true;
    self.Menu.isInt[menu][index] = false;
    self.Menu.isSubMenu[menu][index] = false;
    self.Menu.isSlider[menu][index] = false;
    self.Menu.SubMenuBool[menu][index] = false;
}

addStringSlider( menu, index, text, array, desc, func, input2, input3, input4 )
{
    if(!isDefined(self.Menu.Slider[menu][index]))
        self.Menu.Slider[menu][index] = 0;
    
    self.Menu.SliderMin[menu][index] = 0;
    self.Menu.SliderIncr[menu][index] = 1;
    self.Menu.SliderMax[menu][index] = array.size - 1;
    
    selectedIndex = self.Menu.Slider[menu][index];

    value = array[selectedIndex];
    self.Menu.SliderValue[menu][index] = value;
    
    self.Menu.isBool[menu][index] = false;
    self.Menu.isSlider[menu][index] = true;
    self.Menu.isInt[menu][index] = false;
    self.Menu.isSubMenu[menu][index] = false;
    self.Menu.SubMenuBool[menu][index] = false;
        
    self.Menu.Text[menu][index] = text;
    self.Menu.Func[menu][index] = func;
    self.Menu.Desc[menu][index] = desc;
    self.Menu.a1[menu][index] = value;
    self.Menu.a2[menu][index] = input2;
    self.Menu.a3[menu][index] = input3;
    self.Menu.a4[menu][index] = input4;
}

addIntSlider( menu, index, text, min, max, increment_value, desc, func, input2, input3, input4 )
{
    if(!isDefined(self.Menu.Slider[menu][index]))
    self.Menu.Slider[menu][index] = min;
    
    self.Menu.SliderMin[menu][index] = min;
    self.Menu.SliderIncr[menu][index] = increment_value;
    self.Menu.SliderMax[menu][index] = max;

    value = self.Menu.Slider[menu][index];
    self.Menu.SliderValue[menu][index] = value;
    
    self.Menu.isBool[menu][index] = false;
    self.Menu.isSlider[menu][index] = true;
    self.Menu.isInt[menu][index] = true;
    self.Menu.isSubMenu[menu][index] = false;
    self.Menu.SubMenuBool[menu][index] = false;
    
    self.Menu.Text[menu][index] = text;
    self.Menu.Func[menu][index] = func;
    self.Menu.a1[menu][index] = value;
    self.Menu.a2[menu][index] = input2;
    self.Menu.a3[menu][index] = input3;
    self.Menu.a4[menu][index] = input4;
    self.Menu.Desc[menu][index] = desc;
}

_loadMenu(menu)
{
    self destroyMenuText();
    self.Menu.CurrentMenu = menu;
    self.Scroller         = 0;
    self createMenuText();
    self _scrollUpdate();
    self.Hud.SubText _setText( self.Menu.title[ self.Menu.CurrentMenu ] ); 
    self thread resizeMenu();
}

GetMaxOptCount()
{
    return 10;
}

isSubMenu( menu, index )
{
    if(!isDefined(self.Menu.isSubMenu[menu][index]))
        return false;
    
    if(isDefined( self.Menu.isSubMenu[menu][index]) && self.Menu.isSubMenu[menu][index] == true )
        return true;
}
           
isBoolOption(menu, index)
{
    if(!isDefined(self.Menu.Bool[menu][index]))
        return false;
    if(isDefined(self.Menu.Bool[menu][index]) && self.Menu.isBool[menu][index] == true)
        return true; return false; return;
}
    
isSliderOption(menu,index)
{
    if(!isDefined(self.Menu.SliderMin[menu][index]))
        return false;
    if(isDefined(self.Menu.SliderMin[menu][index]) && self.Menu.isSlider[menu][index] == true)
        return true;
}
    
isIntSliderOption(menu,index)
{
    if(!isDefined(self.Menu.SliderMin[menu][index]) || self.Menu.isInt[menu][index] == false ){
        return false;
    }
    if(isDefined(self.Menu.SliderMin[menu][index]) && self.Menu.isInt[menu][index] == true){
        return;
    }
}




