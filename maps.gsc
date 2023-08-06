maps_precache_models()
{
	// load models
	preCacheModel("mp_flag_allies_1");
	precachemodel("collision_physics_512x512x512");
	precachemodel("collision_clip_512x512x10");
	precachemodel("collision_clip_256x256x10");
	precachemodel("collision_clip_128x128x10");
	precachemodel("collision_physics_128x128x10");
	precachemodel("collision_physics_128x128x10");
	precachemodel("collision_physics_512x512x10");
	precachemodel("collision_physics_512x512x512");
}

CreateFlag(map, origin, end)
{
	if(level.script != map)
		return;
	trigger = spawn("trigger_radius_use", origin + (0, 0, 70), 0, 72, 64);
	trigger sethintstring("Press ^3[{+activate}] ^7to teleport");
	trigger setcursorhint("HINT_NOICON");
	//trigger usetriggerrequirelookat();
	trigger triggerignoreteam();
	trigger thread DestroyOnEndGame();
	teleport = spawn("script_model", origin);
	teleport setmodel("mp_flag_allies_1");
	teleport thread TeleportPlayer(trigger, end);
	teleport thread DestroyOnEndGame();
	// level.__vars["flags"]++;
}
DestroyOnEndGame()
{
	level waittill("game_ended");
	self delete ();
}

TeleportPlayer(trigger, end)
{
	level endon("game_ended");
	while (isDefined(self))
	{
		trigger waittill("trigger", player);
//		if (player IsPlayerOnLast())
//		{
//			player setOrigin(end);
//		}
		player setOrigin(end);
	}
}

spawn_flags()
{
	CreateFlag("mp_la", (115, -1068, -267), (-724, -1196, 115));
	CreateFlag("mp_la", (-2570, 2395, -196), (-2996, 2544, 116));
	CreateFlag("mp_la", (89.3533, 5266.31, -262.875), (-638.706, 7642.99, 90.1037));
	CreateFlag("mp_la", (-1611.1, -1011.22, -259.875), (-1751.25, -1514.88, -76.5663));
	
	/*CreateFlag("mp_slums", (592, 1455, 616), (1052, 1683, 1007));
	CreateFlag("mp_slums", (-943, 1358, 584), (-1702, 1512, 1099));
	CreateFlag("mp_slums", (-640, -1059, 552), (-1873, -1233, 1049));*/
	CreateFlag("mp_slums", (-805.27, -2596.34, 456.125), (-2865.69, -3182.58, 1175.8));
	CreateFlag("mp_slums", (-2839.7, -3450.88, 923.125), (-2821.34, -3201.16, 1177.62));
	CreateFlag("mp_slums", (916.676, -3376.11, 462.125), (719.575, -3675.91, 1111.55));
	CreateFlag("mp_slums", (-439.816, -4126, 942.611), (54.167, -6096.26, 1010.34));
	CreateFlag("mp_slums", (-1774.92, -6552.17, 668.125), (-1519.55, -6870.55, 858.002));
	CreateFlag("mp_slums", (-937, -714.645, 552.199), (-3371.59, -317.162, 1263.24));
	CreateFlag("mp_slums", (-4293.54, -2276.81, 1185.13), (-4652.56, -1040.84, 1310.41));
	CreateFlag("mp_slums", (-4293.54, -2276.81, 1185.13), (-4652.56, -1040.84, 1310.41));
	CreateFlag("mp_slums", (-181.476, 2178.16, 584.125), (-168.239, 3266.75, 1431.4));
	CreateFlag("mp_slums", (1238.67, -1525.03, 504.125), (3062.1, -1374.25, 1069.99));
	CreateFlag("mp_slums", (1214.01, -105.558, 584.125), (2872.77, 580.469, 1054.13));
	CreateFlag("mp_slums", (453.408, 2173.72, 584.125), (2970.53, 1203.75, 1141.52));
	
	CreateFlag("mp_dockside", (-921, 3692, -67), (-2948, 2970, -55));
	CreateFlag("mp_dockside", (1043, 536, -67), (2239, 481, -67));
	CreateFlag("mp_dockside", (-133, 4192, -67), (-744, 5121, 228));
	CreateFlag("mp_dockside", (1348.72, 1160.29, -67.875), (6680.57, 837.092, 327.098));
	CreateFlag("mp_dockside", (-227.141, 4835.31, -67.875), (831.962, 6097.86, 320.084));
	
	CreateFlag("mp_nuketown_2020", (-1912.92, 623.333, -63.875), (-1935.44, 867.489, 76.4663));
	CreateFlag("mp_nuketown_2020", (-1912.92, 623.333, -63.875), (-1935.44, 867.489, 76.4663));
	CreateFlag("mp_nuketown_2020", (-1640, 80, -63), (-1518, -1170, 66));
	CreateFlag("mp_nuketown_2020", (924.269, -869.839, -63.4909), (46.9927, -6059.45, 360.466));
	CreateFlag("mp_nuketown_2020", (1969.34, 444.293, -60.8312), (2528.86, -660.694, 397.717));
	CreateFlag("mp_nuketown_2020", (1547.97, 1112.66, -55.875), (2421.14, 1154.5, 147.693));
	CreateFlag("mp_nuketown_2020", (1526.37, -1088.99, -62.7715), (2210.21, -5568.56, 672.664));
	//CreateFlag("mp_nuketown_2020", (-257.514, -760.008, -60.2973), (53.4138, -1627.69, 610.889));//nt sign
	CreateFlag("mp_nuketown_2020", (-239.08, -589.35, -60.60), (53.4138, -1627.69, 610.889));//nt sign (flag in map)
	CreateFlag("mp_nuketown_2020", (1547.86, -88.1327, -63.7798), (1059.87, -494.301, 108.637));
	
	CreateFlag("mp_paintball", (-1457, 63, 0), (-1643, -340, 241));
	CreateFlag("mp_paintball", (798, 1607, 48), (472, 1783, 272));
	CreateFlag("mp_paintball", (917, -1114, 136), (1107, -615, 264));
	CreateFlag("mp_paintball", (711, -2459, 0), (2256, -2893, -5));
	CreateFlag("mp_paintball", (2378, -3538, 0), (2444, -3357, 200));
	CreateFlag("mp_paintball", (991, 194, 136), (1180, 994, 300));
	CreateFlag("mp_paintball", (1547.52, -2309.93, 0.125), (1530.01, -2325.91, 537.031));
	CreateFlag("mp_paintball", (-1482.97, 2141.68, 3.9069), (-1431.58, 2136.67, 505.538));
	CreateFlag("mp_paintball", (-541.152, -1856.63, -0.510965), (-768.159, -1843.12, 267.625));
	CreateFlag("mp_paintball", (-946.332, -1848.46, -5.875), (-797.35, -1852.18, 267.625));
	CreateFlag("mp_paintball", (-701.73, -314.426, 46.125), (-1148.14, -323.916, 152.125));
	
	CreateFlag("mp_pod", (1332, -1125, 260), (1210, -1592, 513));
	CreateFlag("mp_pod", (1183, 115, 245), (3683, 3006, 1994));
	CreateFlag("mp_pod", (-1902, 2154, 482), (-2134, 2755, 480));
	CreateFlag("mp_pod", (269, 851, 334), (1484, 3486, 1778));
	CreateFlag("mp_pod", (486.3, -80.5827, 241.037), (1470.01, 3489.26, 1778.13));
	
	CreateFlag("mp_drone", (-2007, -1973, 80), (-2084, -2585, 80));
	CreateFlag("mp_drone", (1025, 3557, 302), (974, 4152, 305));
	
	CreateFlag("mp_carrier", (-6471, 704, -75), (-6359, 300, -175));
	CreateFlag("mp_carrier", (-3066, 804, 44), (-2964, 901, -67));
	CreateFlag("mp_carrier", (-2353, -312, 44), (-548, -988, -267));
	CreateFlag("mp_carrier", (-6003.11, -899.634, -83.875), (-6396.31, -649.565, -207.963));
	
	CreateFlag("mp_concert", (2172, 1881, 24), (2501, 2061, 0));
	CreateFlag("mp_concert", (842, 2868, 24), (1206, 2820, 448));
	CreateFlag("mp_concert", (556, 2186, 24), (1677, 3378, 32));
	CreateFlag("mp_concert", (1224, 326, 24), (599, 725, 148));
	CreateFlag("mp_concert", (-2303, 428, -69), (-2827, -404, -119));
	CreateFlag("mp_concert", (-2763.82, 1161.65, -8.0255), (-4407.76, 732.532, 314.339));
	
	CreateFlag("mp_downhill", (689, -2693, 1088), (513, -7092, 1732));
	CreateFlag("mp_downhill", (1655, 2411, 1114), (1193, 4117, 1467));
	
	CreateFlag("mp_socotra", (-1372, -517, 206), (-2152, -278, 620));
	CreateFlag("mp_socotra", (-666, -855, 288), (-693, -978, 424));
	CreateFlag("mp_socotra", (985, 2233, 315), (877, 2798, 1165));
	CreateFlag("mp_socotra", (614, 2636, 293), (877, 2798, 1165));
	CreateFlag("mp_socotra", (2223.3, 912.379, 208.611), (4706.59, 2190.51, 1104.84));
	CreateFlag("mp_socotra", (-1188.92, 1557.22, -119.875), (-1637.41, 3275.45, 1239.12));
	CreateFlag("mp_socotra", (1917.84, 1234.03, 208.125), (2628.16, 1391.61, 782.252));
	CreateFlag("mp_socotra", (-1561.96, -1952.32, -34.4075), (-1594.57, -2176.06, 187.158));
	
	CreateFlag("mp_express", (1068, 2804, -54), (605, 2759, 180));
	CreateFlag("mp_express", (1078, -2734, -54), (675, -2821, 180));
	CreateFlag("mp_express", (2321, 0, -120), (2477, 8, -279));
	
	CreateFlag("mp_turbine", (-646, 1540, 425), (-941, 1412, 832));
	CreateFlag("mp_turbine", (-396, -2313, 159), (-514, -2557, 180));
	CreateFlag("mp_turbine", (1884, 465, 266), (2555.56, 14.1324, 700.698));
	CreateFlag("mp_turbine", (-1201.76, -4313.19, 639.125), (-1617.8, -4690.41, 3185.33));
	CreateFlag("mp_turbine", (-1129.54, 2777.95, 353.485), (-3640.64, 4472.18, 1939.26));
	CreateFlag("mp_turbine", (882.052, 3687.68, -171.727), (956.22, 3953.26, 208.134));
	
	CreateFlag("mp_bridge", (-2982, -365, -72), (-3329, -693, 229));
	CreateFlag("mp_bridge", (2716.96, 415.982, 0.125), (2929.2, 245.052, 1.16263));
	
	CreateFlag("mp_dig", (-171, 1485, 97), (362, 1559, 743));
	CreateFlag("mp_dig", (1080, -142, 120), (1184, -18, 390));
	CreateFlag("mp_dig", (-1749.97, -1698.21, 74.125), (-429.599, -4031.26, 523.627));
	CreateFlag("mp_dig", (1550.04, 48.0021, 238.839), (5457.32, -370.833, 990.765));
	
	CreateFlag("mp_raid", (-191, 3270, 112), (-162, 3442, 265));
	CreateFlag("mp_raid", (4650, 3598, 32), (6629, 5441, -76));
	CreateFlag("mp_raid", (1604.9, 2256.07, 141.572), (1524.82, 2645.68, 424.125));
	CreateFlag("mp_raid", (2907.51, 1565.07, 110.125), (3204.42, 1584.12, 130.893));
	CreateFlag("mp_raid", (-386.637, 2999.91, 113.228), (-2366.6, 4881.03, 555.123));
	CreateFlag("mp_raid", (6253.02, 4851.81, -137.949), (7294.43, 3997.46, 687.034));
	CreateFlag("mp_raid", (1550.04, 48.0021, 238.839), (5457.32, -370.833, 990.765));
	
	CreateFlag("mp_studio", (189, -821, -127), (785, -1183, 225));
	CreateFlag("mp_studio", (2642.86, 1689.37, -43.875), (2491.35, 1801.68, 138.238));
	CreateFlag("mp_studio", (744.291, -1334.91, -45.2996), (544.275, -1545.91, 221.958));
	CreateFlag("mp_studio", (3401.36, 2740.14, -35.875), (3438.9, 1795.5, 633.296));
	CreateFlag("mp_studio", (-712.923, -670.171, -127.875), (-2954.22, -1705.46, 904.84));
	CreateFlag("mp_studio", (-980.763, 1921.69, -55.875), (-2178.39, 3776.28, 907.31));
	CreateFlag("mp_studio", (1359.82, -1681.07, -34.9436), (78.4931, -4233.04, 868.581));
	CreateFlag("mp_studio", (982.117, 2629.51, -47.875), (1187.88, 3816.15, 496.424));
	
	CreateFlag("mp_vertigo", (1008, 2076, -71), (4204, 3218, -325));
	CreateFlag("mp_vertigo", (389, -1481, 0), (4199, -2314, -319));
	CreateFlag("mp_vertigo", (1277.61, 370.892, 104.125), (4192.91, 386.275, 1856.13));
	CreateFlag("mp_vertigo", (184.334, -4330.35, 8.125), (-48.9362, -4394.21, 461.22));
	
	CreateFlag("mp_hydro", (762, -1624, 249), (1802, -2538, 1984));
	CreateFlag("mp_hydro", (-2404, -1463, 216), (-3093, -2409, 1984));
	CreateFlag("mp_hydro", (-2738, -481, 222), (-2562, -66, 216));
	CreateFlag("mp_hydro", (2641, -325, 220), (2357, -23, 216));
	CreateFlag("mp_hydro", (-3702.86, 5381.95, 216.125), (-3462.69, 5116.04, 459.641));
	CreateFlag("mp_hydro", (-5473.91, 9386.03, 128.125), (-1930.36, 24074.2, 3971.95));
	
	CreateFlag("mp_uplink", (2943, 2025, 288), (2601, 3145, 185));
	CreateFlag("mp_uplink", (2096, -888, 320), (2135, -889, 456));
	CreateFlag("mp_uplink", (2851.49, -3474.89, 352.125), (3274.93, -4208.17, 1087.79));
	CreateFlag("mp_uplink", (4511.45, -4261.84, 289.905), (3974.54, -6806, 2605.94));
	CreateFlag("mp_uplink", (3575.7, -3361.01, 352.125), (3797.08, -3515.56, 352.125));
	CreateFlag("mp_uplink", (2387.3, -346.838, 314.984), (1963.4, -283.113, 663.781));
	CreateFlag("mp_uplink", (3666.94, -3134.7, 373.802), (3781.6, -2824.88, 588.893));
	
	CreateFlag("mp_takeoff", (-23, 4348, 32), (-373, 5186, 115));
	CreateFlag("mp_takeoff", (-1070, 2561, -55), (-1484, 2467, -47));
	CreateFlag("mp_takeoff", (513, 3742, 32), (693, 3742, 32));
	CreateFlag("mp_takeoff", (975, 3072, 32), (1107, 3072, 32));
	CreateFlag("mp_takeoff", (184, -896, 0), (-139, -297, -135));
	CreateFlag("mp_takeoff", (-1464.53, 2894.4, -47.875), (-4040.22, 3152.34, 2341.28));
	CreateFlag("mp_takeoff", (38.2055, 5231.39, 115.426), (485.644, 5429.75, 309.199));
	CreateFlag("mp_takeoff", (-553.142, 3615.77, 32.125), (-1414.11, 3905.94, 40.9409));
	
	CreateFlag("mp_village", (-1189, 1092, 8), (-830, 3955, 400));
	CreateFlag("mp_village", (515.728, 261.256, 8.125), (79.1192, 166.205, 233.48));
	CreateFlag("mp_village", (1623.87, -329.869, 0.349442), (2194.62, 11.3069, 273.117));
	CreateFlag("mp_village", (149.292, -4356.86, 8.125), (-54.8377, -4420.12, 376.373));
	CreateFlag("mp_village", (-567.834, 3961.5, 13.4209), (-1124.24, 3929.2, 400.125));
	CreateFlag("mp_village", (-4568.72, 2592.47, -34.3099), (-4775.1, 2884.25, 378.288));
	CreateFlag("mp_village", (1166.14, -1016.36, 8.125), (1488.07, -912.874, 118.208));
	
	CreateFlag("mp_meltdown", (1398.78, 4558.17, -135.875), (2538.92, 4998.62, -61.2619));
	CreateFlag("mp_meltdown", (686.077, 5863.7, -135.875), (2732.48, 9089.79, 35.0579));
	CreateFlag("mp_meltdown", (330.468, 4539.45, -135.625), (298.385, 4791.47, -135.625));
	CreateFlag("mp_meltdown", (350.648, 5493.28, -135.671), (-95.8347, 5436.33, -63.875));
	CreateFlag("mp_meltdown", (1406.93, -1224.25, -135.875), (2329.23, -1995.81, -117.809));
	CreateFlag("mp_meltdown", (88.471, -968.044, -127.875), (-136.575, -4651.88, -38.0352));
	
	CreateFlag("mp_overflow", (-1804.08, -1327.7, -131.38), (-1885.41, -1765.89, -31.875));
	CreateFlag("mp_overflow", (-464.452, -1650.7, -39.875), (-381.163, -1954.7, 112.125));
	CreateFlag("mp_overflow", (-1871.48, 599.954, 2.59018), (-2033.04, 926.264, -19.63));
	CreateFlag("mp_overflow", (-2101.31, -932.132, -131.557), (-2860.54, -1700.08, 82.814));
	
	CreateFlag("mp_nightclub", (-14855.2, 3085.4, -191.875), (-14644.2, 3090.24, -192.875));
	CreateFlag("mp_nightclub", (-19276.6, -48.4949, -191.875), (-19429.1, -3220, -179.318));
	
	CreateFlag("mp_skate", (2377.88, -910.404, 181.036), (2223.44, -1157.19, 248.125));
	CreateFlag("mp_skate", (2865.83, -206.396, 164.339), (3059.83, -221.093, 253.651));
	CreateFlag("mp_skate", (2065.93, 378.573, 180.544), (5861.21, 2164.2, 1357.23));
	CreateFlag("mp_skate", (-2078.48, -1911.04, 256.125), (-721.985, -2255.01, 583.62));
	CreateFlag("mp_skate", (5825.74, 2163.61, 121.301), (5770.41, 2142.65, 1345.27));
	CreateFlag("mp_skate", (-1659.25, -1641.98, 256.125), (-2147.63, -2497.74, 592.84));
	CreateFlag("mp_skate", (2390.56, 1417.96, 128.125), (1970.06, 2144.96, 446.49));
	CreateFlag("mp_skate", (3385.86, 1559.14, 128.125), (3125.95, 2145.54, 416.645));
}

lower_barriers()
{
	lowerBarrier("mp_bridge", 1000);
	lowerBarrier("mp_concert", 200);
	//mp_express
	//mp_dig
	lowerBarrier("mp_nightclub", 250);
	lowerBarrier("mp_slums", 350);
	//mp_uplink
	//mp_magma
	//mp_hijacked
	//mp_takeoff
	//mp_carrier
	lowerBarrier("mp_meltdown", 100);
	lowerBarrier("mp_raid", 120);
	lowerBarrier("mp_studio", 20);
	//mp_socotra
	lowerBarrier("mp_downhill", 620);
	lowerBarrier("mp_vertigo", 1000);
	lowerBarrier("mp_hydro", 1000);
	// level thread customHydroBarrier();
	lowerBarrier("mp_nuketown_2020", 200);
	
	removeHighBarrier();
}
customHydroBarrier()
{
	level endon("game_ended");
	for (;;)
	{
		wait 0.05;
		foreach (player in level.players)
		{
			if (player.origin[2] < 1100 && player.origin[2] > 900)
			{
				player suicide();
			}
		}
	}
}
lowerBarrier(map, value)
{
	if(level.script != map)
		return;
	hurt_triggers = getentarray("trigger_hurt", "classname");
	foreach (barrier in hurt_triggers)
		if (barrier.origin[2] <= 0)
			barrier.origin -= (0, 0, value);
	// else barrier.origin += (0, 0, 99999);
}
removeHighBarrier()
{
	hurt_triggers = getentarray("trigger_hurt", "classname");
	foreach (barrier in hurt_triggers)
		if (isDefined(barrier.origin[2]) && barrier.origin[2] >= 70)
			barrier.origin += (0, 0, 99999);
}

CreateCollision(map, origin, angles, model)
{
	if(level.script != map)
		return;
	collision = spawn("script_model", origin);
	collision setmodel(model);
	collision.angles = (angles[0], 90, angles[2]);
	collision setContents(1);
	collision thread DestroyOnEndGame();
}
register_collisions()
{
	current_map = level.script;
	
	CreateCollision("mp_la", (-618.025, 7691.3, 57.154), (0, 0, 0), "collision_clip_256x256x10");
	CreateCollision("mp_la", (46.0661, -25637.7, 9177.88), (0, 0, 0), "collision_clip_256x256x10");
	CreateCollision("mp_la", (-1767.73, -1522.99, -86.719), (0, -0.0788803, 0), "collision_clip_256x256x10");
	
	// slums has none
	
	CreateCollision("mp_dockside", (6759.29, 941.297, 310.294), (0, -90.95, 0), "collision_clip_512x512x10");
	CreateCollision("mp_dockside", (9027.83, -549.684, -88.4081), (0, 0, 0), "collision_clip_256x256x10");
	CreateCollision("mp_dockside", (4518.35, -568.258, -52.3286), (0, 0, 0), "collision_clip_512x512x10");
	CreateCollision("mp_dockside", (-5966.07, 2046.52, -91.6618), (0, 0, 0), "collision_clip_256x256x10");
	CreateCollision("mp_dockside", (-4483.09, 5048.7, 607.798), (0, 0, 0), "collision_clip_256x256x10");
	CreateCollision("mp_dockside", (-4469.04, 5318.17, 604.674), (0, 0, 0), "collision_clip_256x256x10");
	CreateCollision("mp_dockside", (842.969, 6109.96, 321.965), (0, 0, 0), "collision_clip_256x256x10");
	
	CreateCollision("mp_nuketown_2020", (2506.28, -657.372, 392.592), (0, 0, 0), "collision_clip_256x256x10");
	CreateCollision("mp_nuketown_2020", (258.522, 4187.87, 1538.5), (0, 0, 0), "collision_clip_256x256x10");
	CreateCollision("mp_nuketown_2020", (-4695.27, -9382.28, 3353.7), (0, 0, 0), "collision_clip_512x512x10");
	CreateCollision("mp_nuketown_2020", (54.4572, -6120.24, 355.341), (0, 0, 0), "collision_clip_512x512x10");
	CreateCollision("mp_nuketown_2020", (2413.58, 1130.5, 141.616), (0, 89.8663, 0), "collision_clip_256x256x10");
	CreateCollision("mp_nuketown_2020", (2413.7, 1280.5, 142.568), (0, 89.9762, 0), "collision_clip_256x256x10");
	CreateCollision("mp_nuketown_2020", (2413.79, 1520.49, 144.191), (0, 89.9762, 0), "collision_clip_256x256x10");
	CreateCollision("mp_nuketown_2020", (2413.89, 1760.49, 145.816), (0, 89.9762, 0), "collision_clip_256x256x10");
	CreateCollision("mp_nuketown_2020", (2168.77, -5991.59, 578.863), (0, 88.5711, 0), "collision_clip_512x512x10");
	CreateCollision("mp_nuketown_2020", (2168.55, -5662.71, 552.063), (0, 89.8894, 0), "collision_clip_512x512x10");
	CreateCollision("mp_nuketown_2020", (2169.82, -5362.72, 550.913), (0, 89.6697, 0), "collision_clip_512x512x10");
	CreateCollision("mp_nuketown_2020", (2170.57, -5032.75, 554.178), (0, 89.5598, 0), "collision_clip_512x512x10");
	CreateCollision("mp_nuketown_2020", (2173.45, -4762.77, 556.017), (0, 89.3895, 0), "collision_clip_512x512x10");

	CreateCollision("mp_nuketown_2020", (138.431, -1635.25, 542.93), (0, -179.367, 0), "collision_clip_128x128x10");
	CreateCollision("mp_nuketown_2020", (-11.3046, -1636.9, 534.189), (0, -179.367, 0), "collision_clip_128x128x10");
	CreateCollision("mp_nuketown_2020", (-190.988, -1638.88, 523.698), (0, -179.367, 0), "collision_clip_128x128x10");

	CreateCollision("mp_nuketown_2020", (853.702, -499.518, 44.6336), (0, 3.39499, 0), "collision_clip_256x256x10");
	CreateCollision("mp_nuketown_2020", (1003.26, -492.716, 53.7718), (0, 2.18649, 0), "collision_clip_256x256x10");
	CreateCollision("mp_nuketown_2020", (1242.7, -483.574, 67.4744), (0, 2.18649, 0), "collision_clip_256x256x10");
		
	CreateCollision("mp_paintball", (1547.52, -2309.93, 350.618), (0, 0, 0), "collision_clip_128x128x10");
	CreateCollision("mp_paintball", (-1462.43, 2124.52, 350.419), (0, 0, 0), "collision_clip_128x128x10");
		
	// mp_pod
		
	// mp_drone
		
	CreateCollision("mp_carrier", (-6401.51, -634.062, -240.879), (0, -90.2981, 0), "collision_clip_256x256x10");
		
	spot = 26;
	while (spot > 0)
	{
		if (spot <= 20 && spot > 0)
		{
			//CreateCollision("mp_carrier", (-8489.36 - (256 * spot), -13541, -450.449), (0, -1, 0), "collision_clip_256x256x10");
		}
		else
		{
			//CreateCollision("mp_carrier", (-8489.36 - (256 * spot), -13541, -370.449), (0, -1, 0), "collision_clip_256x256x10");
		}
		spot--;
	}
	spot = 20;
	while (spot > 0)
	{
		//CreateCollision("mp_carrier", (-8419.36 + (512 * spot), -18553.6, -237.449), (0, -1, 0), "collision_clip_512x512x10");
		//CreateCollision("mp_carrier", (-10268.1 - (512 * spot), 16358.7, -200.735), (0, -179.206, 0), "collision_clip_512x512x10");
		//CreateCollision("mp_carrier", (2707.83 + (512 * spot), 13541.4, -562.716), (0, -2.89877, 0), "collision_clip_512x512x10");
		spot--;
	}
		
	CreateCollision("mp_concert", (-12831.6, -5188.17, 388.078), (0, 0, 0), "collision_clip_256x256x10");
	CreateCollision("mp_concert", (-8276.39, 6986.13, 440.563), (0, 0, 0), "collision_clip_512x512x10");
	CreateCollision("mp_concert", (920.474, -8785.83, 650), (0, 0, 0), "collision_clip_256x256x10");
	CreateCollision("mp_concert", (1325.17, -8673.56, 650), (0, 0, 0), "collision_clip_256x256x10");
	CreateCollision("mp_concert", (-1272.73, -9606.52, 645), (0, 0, 0), "collision_clip_256x256x10");
	CreateCollision("mp_concert", (-1692.03, -9604.53, 645), (0, 0, 0), "collision_clip_256x256x10");
	CreateCollision("mp_concert", (-4447.75, 880.187, 249), (0, 0, 0), "collision_clip_256x256x10");
	CreateCollision("mp_concert", (-4454.15, 611.219, 249), (0, 0, 0), "collision_clip_256x256x10");
		
	// mp_downhill
		
	CreateCollision("mp_socotra", (9192.28, 2845.78, 735.991), (0, 0, 0), "collision_clip_512x512x10");
	CreateCollision("mp_socotra", (4600.09, 2308.6, 1040.88), (0, 0, 0), "collision_clip_512x512x10");
	CreateCollision("mp_socotra", (-1732.23, 3091.58, 1233), (0, 0, 0), "collision_clip_256x256x10");
	CreateCollision("mp_socotra", (-1625.66, 3272.27, 1233), (0, 0, 0), "collision_clip_256x256x10");
	CreateCollision("mp_socotra", (2625.02, 1370.75, 799.834), (0, 0, 0), "collision_clip_256x256x10");
	CreateCollision("mp_socotra", (1870.08, 3547.63, 1954.78), (0, 0, 0), "collision_clip_512x512x10");
	CreateCollision("mp_socotra", (2170.03, 3551.21, 1954.78), (0, 0, 0), "collision_clip_512x512x10");
	CreateCollision("mp_socotra", (2508.05, 4293.83, 2430.22), (0, 0, 0), "collision_clip_512x512x10");
	CreateCollision("mp_socotra", (2687.35, 4282.94, 2430.22), (0, 0, 0), "collision_clip_512x512x10");
	CreateCollision("mp_socotra", (1328.32, 4950.77, 2298.27), (0, 0, 0), "collision_clip_256x256x10");
	CreateCollision("mp_socotra", (983.918, 4632.57, 2018.97), (0, 0, 0), "collision_clip_256x256x10");
	CreateCollision("mp_socotra", (1015.21, 4627.58, 2017.88), (0, 0, 0), "collision_clip_256x256x10");
	CreateCollision("mp_socotra", (-1590.84, -2182.91, 147.48), (0, -86.7768, 0), "collision_clip_256x256x10");
	
	// mp_express
		
	CreateCollision("mp_turbine", (-1619.85, -4703.71, 3038.63), (0, 121.789, 0), "collision_clip_256x256x10");
	CreateCollision("mp_turbine", (-3709.58, 4496.43, 1934.13), (0, 164.694, 0), "collision_clip_256x256x10");
	CreateCollision("mp_turbine", (-1669.57, -673.674, 2018.86), (0, -77.2141, 0), "collision_clip_256x256x10");
	CreateCollision("mp_turbine", (-6349.16, -1931.31, 811.81), (0, -157.804, 0), "collision_clip_256x256x10");
	CreateCollision("mp_turbine", (-7372.7, 1765.9, 454.932), (0, 9.6929, 0), "collision_clip_256x256x10");
	CreateCollision("mp_turbine", (-1664.26, -638.372, 2025.61), (0, -127.62, 0), "collision_clip_256x256x10");
	CreateCollision("mp_turbine", (962.79, 3960.21, 187.805), (0, 39.6219, 0), "collision_clip_256x256x10");
	
	CreateCollision("mp_bridge", (-22298.2, -2337.09, 3476.34), (0, 146.595, 0), "collision_clip_256x256x10");
	CreateCollision("mp_bridge", (-8465.05, 19674.9, 2915.76), (0, 103.795, 0), "collision_clip_512x512x10");
	CreateCollision("mp_bridge", (-8569.05, 20081.6, 2928.03), (0, 104.894, 0), "collision_clip_512x512x10");
	CreateCollision("mp_bridge", (-8692.4, 20545.4, 2937.92), (0, 104.894, 0), "collision_clip_512x512x10");
	CreateCollision("mp_bridge", (-8815.74, 21009.2, 2947.8), (0, 104.894, 0), "collision_clip_512x512x10");
	CreateCollision("mp_bridge", (-8923.67, 21415, 2956.45), (0, 104.894, 0), "collision_clip_512x512x10");
	CreateCollision("mp_bridge", (17835.1, 29303.4, 2873.16), (0, -75.6181, 0), "collision_clip_512x512x10");
	CreateCollision("mp_bridge", (17939.4, 28896.8, 2884.95), (0, -75.6181, 0), "collision_clip_512x512x10");
	CreateCollision("mp_bridge", (18025.7, 28578.2, 2884.09), (0, -74.8491, 0), "collision_clip_512x512x10");
	CreateCollision("mp_bridge", (18143.3, 28143.9, 2882.92), (0, -74.8491, 0), "collision_clip_512x512x10");
	CreateCollision("mp_bridge", (18260.9, 27709.5, 2881.74), (0, -74.8491, 0), "collision_clip_512x512x10");
	
	CreateCollision("mp_dig", (5468.43, -263.333, 985.64), (0, 0, 0), "collision_clip_512x512x10");
	spot = 6;
	while (spot > 0)
	{
		CreateCollision("mp_dig", (7.019 - (100 * spot), -4447.94 + (100 * spot), 503.034), (0, -88.9545, 0), "collision_clip_256x256x10");
		spot--;
	}
	
	CreateCollision("mp_raid", (-2497.82, 4713.01, 546.074), (0, 46.4464, 0), "collision_clip_256x256x10");
	CreateCollision("mp_raid", (-2374.24, 4843, 530.833), (0, 46.4464, 0), "collision_clip_256x256x10");
	CreateCollision("mp_raid", (-2230.06, 4994.65, 513.052), (0, 46.4464, 0), "collision_clip_256x256x10");
	CreateCollision("mp_raid", (-2649.82, 4231.44, 178.696), (0, -84.0655, 0), "collision_clip_256x256x10");
	CreateCollision("mp_raid", (-2631.21, 4052.4, 177.95), (0, -84.0655, 0), "collision_clip_256x256x10");
	CreateCollision("mp_raid", (-2612.6, 3873.37, 177.204), (0, -84.0655, 0), "collision_clip_256x256x10");
	CreateCollision("mp_raid", (7270, 3992.06, 660.867), (0, 73.0769, 0), "collision_clip_256x256x10");
	
	spot = 16;
	while (spot > 0)
	{
		CreateCollision("mp_studio", (-4318.59 + 128 * spot, -1730.55, 870), (0, -1, 0), "collision_clip_128x128x10");
		CreateCollision("mp_studio", (-1779.59 - 128 * spot, 3785.75, 842.804), (0, -179.445, 0), "collision_clip_128x128x10");
		CreateCollision("mp_studio", (64.6322, -3574.79 - 128 * spot, 863.456), (0, -88.9545, 0), "collision_clip_128x128x10");
		spot--;
	}
	spot = 6;
	while (spot > 0)
	{
		CreateCollision("mp_studio", (3439.24, 2000.03 - 128 * spot, 576.107), (0, -88.9545, 0), "collision_clip_128x128x10");
		spot--;
	}
	spot = 6;
	while (spot > 0)
	{
		CreateCollision("mp_studio", (2072.34 - 256 * spot, 3838.58, 491.299), (0, 179.837, 0), "collision_clip_256x256x10");
		spot--;
	}
	
	//mp_vertigo
	
	CreateCollision("mp_hydro", (-3513.23, 5306.62, 420.157), (0, -88.8978, 0), "collision_clip_256x256x10");
	CreateCollision("mp_hydro", (-3508.61, 5066.67, 418.961), (0, -89.0076, 0), "collision_clip_256x256x10");
	bridge = 40;
	while (bridge > 0)
	{
		CreateCollision("mp_hydro", (4924.59 - 512 * bridge, 23965.3, 3850.07), (0, 179.311, 0), "collision_clip_512x512x10");
		bridge--;
	}
	
	CreateCollision("mp_uplink", (-7319.86, -3621.84, 3043.18), (0, 0, 0), "collision_clip_512x512x10");
	CreateCollision("mp_uplink", (4022.04, -6885.26, 2600.81), (0, 0, 0), "collision_clip_512x512x10");
	CreateCollision("mp_uplink", (3273.81, -4110.3, 1082.66), (0, 0, 0), "collision_clip_256x256x10");
	CreateCollision("mp_uplink", (-9027.12, 6211.98, 5793.55), (0, 0, 0), "collision_clip_512x512x10");
	CreateCollision("mp_uplink", (1907.82, -326.103, 620.281), (0, 87.9456, 0), "collision_clip_256x256x10");
	CreateCollision("mp_uplink", (3775.29, -2839.05, 604.693), (0, 28.6981, 0), "collision_clip_256x256x10");
	
	CreateCollision("mp_takeoff", (-4112.39, 3174.31, 2280.11), (0, 0, 0), "collision_clip_512x512x10");
	CreateCollision("mp_takeoff", (462.558, 5416.14, 324.593), (0, 0, 0), "collision_clip_256x256x10");
	spot = 8;
	while (spot > 0)
	{
		CreateCollision("mp_takeoff", (-1471.85, 3498.8 + (256 * spot), 35.8159), (0, 89.4038, 0), "collision_clip_256x256x10");
		spot--;
	}
	spot = 4;
	while (spot > 0)
	{
		CreateCollision("mp_takeoff", (-1739.8, 3437.75 + (512 * spot), 35.247), (0, 89.4038, 0), "collision_clip_512x512x10");
		spot--;
	}
	
	train = 38;
	while (train > 0)
	{
		CreateCollision("mp_village", (2204.24, 3281.25 - (128 * train), 235.248), (0, -90.1347, 0), "collision_clip_128x128x10");
		train--;
	}
	spot = 8;
	while (spot > 0)
	{
		CreateCollision("mp_village", (-53.24, -4189 - (128 * spot), 371.248), (0, -90.1347, 0), "collision_clip_128x128x10");
		spot--;
	}
	spot = 6;
	while (spot > 0)
	{
		CreateCollision("mp_village", (-5291.12 + (128 * spot), 2878.54, 373.163), (0, 0.415077, 0), "collision_clip_128x128x10");
		spot--;
	}
	
	CreateCollision("mp_meltdown", (2526.81, 5035.37, -112.311), (0, -113.031, 0), "collision_clip_256x256x10");
	CreateCollision("mp_meltdown", (-358.426, -4602.73, -38.0352), (0, -14.1439, 0), "collision_clip_512x512x10");
	CreateCollision("mp_meltdown", (2346.06, -2044.08, -139.72), (0, 33.9047, 0), "collision_clip_256x256x10");
	spot = 6;
	while (spot > 0)
	{
		CreateCollision("mp_meltdown", (2701.34 + (11 * spot), 8794.39 + (128 * spot), -23.0524), (0, 83.1504, 0), "collision_clip_256x256x10");
		spot--;
	}
	
	CreateCollision("mp_overflow", (-2879.63, -1710.67, 89.1654), (0, 0, 0), "collision_clip_512x512x10");
	
	spot = 2;
	while (spot > 0)
	{
		CreateCollision("mp_nightclub", (-19640.7 - (256 * spot), -3114.211 + (100 * spot), -200.193), (0, 150.962, 0), "collision_clip_256x256x10");
		spot--;
	}
	spot = 6;
	while (spot > 0)
	{
		CreateCollision("mp_nightclub", (-19682.6 + (256 * spot), -3096.211 - (140 * spot), -200.193), (0, 150.962, 0), "collision_clip_256x256x10");
		spot--;
	}
	
	CreateCollision("mp_skate", (5862.81, 2199.41, 1340.14), (0, 0, 0), "collision_clip_512x512x10");
	CreateCollision("mp_skate", (-711.616, -2229.88, 567.228), (0, 0, 0), "collision_clip_256x256x10");
	CreateCollision("mp_skate", (-2084.55, -2512.74, 490.885), (0, -179.254, 0), "collision_clip_256x256x10");
	CreateCollision("mp_skate", (1974.3, 2181.3, 441.365), (0, -88.568, 0), "collision_clip_512x512x10");
	CreateCollision("mp_skate", (3111.63, 2171.4, 377.346), (0, -1.71007, 0), "collision_clip_512x512x10");
	
	CreateCollision("mp_castaway", (2342.93, -17371.8, 381.451), (0, 0, 0), "collision_clip_512x512x10");
	CreateCollision("mp_castaway", (-6308.61, 3669.26, 476.904), (0, 0, 0), "collision_clip_512x512x10");
	CreateCollision("mp_castaway", (1639.73, 18502.1, 177.842), (0, 0, 0), "collision_clip_512x512x10");
	CreateCollision("mp_castaway", (-4463.22, 22907.8, 165.298), (0, 0, 0), "collision_clip_512x512x10");
}

// CONSOLE ONLY
sv_maprotation()
{
	// IF: there is no winner, skip wait
	if (!isDefined(level.finalkillcam_winner))
	{
		return 0;
	}
	
	// wait for killcam to be over
	level waittill("final_killcam_done");
	
	// if was last round and we are allowing map rotating:
	if (waslastround() && level.map_rotate_enabled)
	{
		map_rotate();
	}

	return 1;
}

map_rotate()
{
	level waittill("final_killcam_done");
	
	// if was last round and we are allowing map rotating:
	if (waslastround() && level.map_rotate_enabled)
	{
		currentmap = getDvar("mapname");
		nextmapname = level.maps[ randomint( level.maps.size )];
		
		self iprintlnbold("Next Map: ^5"+ nextmapname + "^7");
		warning("map_rotate: changing map from " + currentmap + " to " + nextmapname);
		
		wait 0.5;
		setDvar("ls_mapname", nextmapname);
		setDvar("mapname", nextmapname);
		setDvar("party_mapname", nextmapname);
		setDvar("ui_mapname", nextmapname);
		setDvar("ui_currentMap", nextmapname);
		setDvar("ui_mapname", nextmapname);
		setDvar("ui_preview_map", nextmapname);
		setDvar("ui_showmap", nextmapname);
		map( nextmapname );
	}
}




