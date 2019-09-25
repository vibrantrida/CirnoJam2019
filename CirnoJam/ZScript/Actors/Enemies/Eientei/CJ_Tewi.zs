class CJ_Tewi : CJ_BaseEnemy {
	default {
		//$Category CirnoJam/Enemies/Eientei
		//$Title Tewi
		//$Sprite TEWIA0
		Health 600;
		Radius 10;
		Height 44;
		Mass   400;
		Speed  8;
		PainChance 180;
		+BOSS
	}
	states {
		Spawn:
			TEWI AB 4;
			Goto Idle;
		Idle:
			TEWI AB 4 A_Jump(127, "PatternA", "PatternB");
			Goto PatternA;
		PatternA:
			TEWI B 4 ThrustThing(0, 8, 0);
			TEWI A 4;
			Goto Idle;
		PatternB:
			TEWI B 4 ThrustThing(8, 0, 0);
			TEWI A 4;
			Goto Idle;
	}
}