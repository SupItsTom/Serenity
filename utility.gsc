createText(font, fontScale, align, relative, x, y, sort, alpha, text, color)
{
    textElem                = self createFontString(font, fontScale);
    textElem.hideWhenInMenu = true;
    textElem.sort           = sort;
    textElem.alpha          = alpha;
    textElem.color          = color;
    textElem.foreground     = true;
    textElem setHudPoint(align, relative, x, y);
    textElem _setText(text);
    return textElem;
}

createRectangle(align, relative, x, y, width, height, color, shader, sort, alpha, arch)
{
    boxElem = newClientHudElem(self);
    boxElem.elemType = "bar";
    boxElem.children = [];

    boxElem.hideWhenInMenu = true;
    boxElem.width          = width;
    boxElem.height         = height;
    boxElem.align          = align;
    boxElem.relative       = relative;
    boxElem.xOffset        = 0;
    boxElem.yOffset        = 0;
    boxElem.sort           = sort;
    boxElem.color          = color;
    boxElem.alpha          = alpha;
    boxElem.shader         = shader;
    boxElem.foreground     = true;
    boxElem.archived       = arch;
    
    boxElem setParent(level.uiParent);
    boxElem setShader(shader,width,height);
    boxElem.hidden = false;
    boxElem setHudPoint(align, relative, x, y);
    return boxElem;
}

setHudPoint(point,relativePoint,xOffset,yOffset,moveTime)
{
    if(!isDefined(moveTime))moveTime = 0;
    element = self getParent();
    if(moveTime)self moveOverTime(moveTime);
    if(!isDefined(xOffset))xOffset = 0;
    self.xOffset = xOffset;
    if(!isDefined(yOffset))yOffset = 0;
    self.yOffset = yOffset;
    self.point = point;
    self.alignX = "center";
    self.alignY = "middle";
    if(isSubStr(point,"TOP"))self.alignY = "top";
    if(isSubStr(point,"BOTTOM"))self.alignY = "bottom";
    if(isSubStr(point,"LEFT"))self.alignX = "left";
    if(isSubStr(point,"RIGHT"))self.alignX = "right";
    if(!isDefined(relativePoint))relativePoint = point;
    self.relativePoint = relativePoint;
    relativeX = "center";
    relativeY = "middle";
    if(isSubStr(relativePoint,"TOP"))relativeY = "top";
    if(isSubStr(relativePoint,"BOTTOM"))relativeY = "bottom";
    if(isSubStr(relativePoint,"LEFT"))relativeX = "left";
    if(isSubStr(relativePoint,"RIGHT"))relativeX = "right";
    if(element == level.uiParent)
    {
        self.horzAlign = relativeX;
        self.vertAlign = relativeY;
    }
    else
    {
        self.horzAlign = element.horzAlign;
        self.vertAlign = element.vertAlign;
    }
    if(relativeX == element.alignX)
    {
        offsetX = 0;
        xFactor = 0;
    }
    else if(relativeX == "center" || element.alignX == "center")
    {
        offsetX = int(element.width / 2);
        if(relativeX == "left" || element.alignX == "right")xFactor = -1;
        else xFactor = 1;
    }
    else
    {
        offsetX = element.width;
        if(relativeX == "left")xFactor = -1;
        else xFactor = 1;
    }
    self.x = element.x +(offsetX * xFactor);
    if(relativeY == element.alignY)
    {
        offsetY = 0;
        yFactor = 0;
    }
    else if(relativeY == "middle" || element.alignY == "middle")
    {
        offsetY = int(element.height / 2);
        if(relativeY == "top" || element.alignY == "bottom")yFactor = -1;
        else yFactor = 1;
    }
    else
    {
        offsetY = element.height;
        if(relativeY == "top")yFactor = -1;
        else yFactor = 1;
    }
    self.y = element.y +(offsetY * yFactor);
    self.x += self.xOffset;
    self.y += self.yOffset;
    switch(self.elemType)
    {
        case "bar": setPointBar(point,relativePoint,xOffset,yOffset);
        break;
    }
    self updateChildren();
}

isHost()
{
    return level.players[0];
}

rgbConverter( r, g, b )
{
    return ( r/255, b/255, g/255 );
}

hudFade(alpha, time)
{
    self fadeOverTime(time);
    self.alpha = alpha;
    wait time;
}

hudMoveX(x, time)
{
    self moveOverTime(time);
    self.x = x;
    wait time;
}

hudMoveY(y, time)
{
    self moveOverTime(time);
    self.y = y;
    wait time;
}

elemMoveY(time, input)
{
    self moveOverTime(time);
    self.y = input;
}

elemMoveX(time, input)
{
    self moveOverTime(time);
    self.x = input;
}

elemFade(time, alpha)
{
    self fadeOverTime(time);
    self.alpha = alpha;
}

vectorScale_( vec1, scale1 )
{
    vec1 = ( vec1[0] * scale1, vec1[1] * scale1, vec1[2] * scale1  );
    return vec1;
}

is_bot()
{
	return isplayer( self ) && isdefined( self.pers["isBot"] ) && self.pers["isBot"] != 0;
}

is_on_last()
{
	return (self.pers["pointstowin"] >= level.scorelimit - 1);
}

is_damage_weapon(weapon)
{
    if(!isDefined(weapon))
        return false;

    weapon_class = GetWeaponClass(weapon);
    if(weapon_class == "weapon_sniper" || isSubStr(weapon, "sa58_") || isSubStr(weapon, "saritch") || weapon == "hatchet_mp")
        return true;
    return false;
}

is_bot_weapon(weapon)
{
    if(!isDefined(weapon))
        return false;

    weapon_class = GetWeaponClass(weapon);
    if(weapon_class == "weapon_melee")
        return true;
    return false;
}

get_name()
{
	nT=getSubStr(self.name,0,self.name.size);
	for(i=0;i<nT.size;i++)
	{
		if(nT[i]=="]")
			break;
	}
	if(nT.size!=i)
		nT=getSubStr(nT,i+1,nT.size);
	return nT;
}

get_xuid()
{
	return toUpper("000" + self getxuid());
}

toUpper(text)
{
    alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    build = "";

    for(i = 0; i < text.size; i++)
        build += isSubStr(alphabet, text[i]) ? alphabet[i] : text[i];

    return build;
}

to_hex(dec) { // DoktorSAS and fed
	hex = "";
	digits = strTok("0,1,2,3,4,5,6,7,8,9,A,B,C,D,E,F", ",");
	while (dec > 0) {
		hex = digits[int(dec) % 16] + hex;
		dec = floor(dec / 16);
	}
	return hex;
}

vector_scale( vec, scale )
{
    vec = ( vec[ 0] * scale, vec[ 1] * scale, vec[ 2] * scale );
    return vec;
}

leader_dialog(vox)
{
   self maps/mp/gametypes/_globallogic_audio::leaderdialog(vox);
}

display_team_message_to_all( msg )
{	
	self maps/mp/_popups::displayteammessagetoall( msg, self );
}

MaterialSettings(align, relative, x, y, width, height, colour, shader, sort, alpha)//homefront
{
    hud = newClientHudElem(self);
    hud.elemtype = "icon";
    hud.color = colour;
    hud.alpha = alpha;
    hud.sort = sort;
    hud.children = [];
    hud setParent(level.uiParent);
    hud setShader(shader, width, height);
    hud setPoint(align, relative, x, y);
    return hud;
}

waitframe()
{
	wait 0.05;
}

array_rand(array) {
    for (i = 0; i < array.size; i++) {
        j = RandomInt(array.size);
        temp = array[i];
        array[i] = array[j];
        array[j] = temp;
    }
    return array;
}



