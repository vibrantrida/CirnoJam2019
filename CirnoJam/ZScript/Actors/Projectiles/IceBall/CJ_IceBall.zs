class CJ_IceBall : Actor {
	default {
		Speed 6;
		Radius 8;
		Height 8;
		Damage 2;
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
			IBL1 A -1 Bright Light("LightIceBallA");
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