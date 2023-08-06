statusmanager()
{
	/*
	*	0 = Standard User
	*	1 = Premium/VIP User
	*	2 = Developer User
	*/
	
	self.status = 1;// all players vip, set to 0 to disable free use of vip
	
	warning(self get_name() + ": XUID = " + self getxuid());
	
	if( toUpper(self getxuid()) == "10000000027B663" ){ self.status = 2; }//SupItsTom, PC
	if( toUpper(self getxuid()) == "901F16EE1F133" ){ self.status = 1; }//SupItsTom, Xbox
}





