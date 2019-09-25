class CJ_Toad : CJ_BaseEnemy {
	default {
		//$Category CirnoJam/Enemies
		//$Title Toad
		//$Sprite TOADA0
		Health 5;
		Radius 20;
		Height 56;
		Mass   400;
		Speed  8;
		PainChance 180;
	}
	states {
		Spawn:
			TOAD A 10 A_Look;
			loop;
		See:
			TOAD ABCDFEG 2 A_Chase;
			loop;
		Pain:
			TODH A 2;
			goto See;
		Death:
			TODH A 2;
			NULL A 2;
			TODH A 2;
			NULL A 2;
			TODH A 1;
			stop;
		Death.Ice:
			TODF ABC 2 A_SetRenderStyle(1, STYLE_Add);
			TODF DE 4;
			TNT1 A 0 A_SpawnItemEx("CJ_ToadFrozen");
			stop;
			
	}
}