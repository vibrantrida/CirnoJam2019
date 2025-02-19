class CJ_IceBall2 : Actor {
	default {
		Speed 8;
		Radius 10;
		Height 8;
		Damage 5;
		DamageType "Ice";
		RenderStyle "Add";
		+NOBLOCKMAP
		+NOGRAVITY
		+DROPOFF
		+MISSILE
		+NOTELEPORT
	}
	states {
		Spawn:
			IBL2 A -1 Bright Light("LightIceBallA");
			loop;
		Death:
			PIBL A 4 Bright;
			PIBL B 2 Bright;
			PIBL C 4 Bright;
			PIBL D 3 Bright;
			PIBL EFG 2;
			stop;
	}
}