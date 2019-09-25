class CJ_ToadFrozen : Actor {
	default {
		//$Category "CirnoJam/Props"
		//$Title "Frozen Toad"
		//$Sprite TODFF0
		Health 1;
		Radius 20;
		Height 56;
		Mass 1000;
		+SHOOTABLE
	}
	states {
		Spawn:
			TODF F 200;
			TNT1 A 0 A_SpawnItemEx("CJ_Toad");
			stop;
		Death:
			TODH A 2;
			NULL A 2;
			TODH A 2;
			NULL A 2;
			TODH A 1;
			stop;
	}
}