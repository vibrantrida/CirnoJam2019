class CJ_Dummy : CJ_BaseEnemy {
	int missilecount;
	int bobstate;
	
	default {
		//$Category CirnoJam/Enemies
		//$Title Dummy
		//$Sprite DUMIA0
		Health 500;
		Radius 10;
		Height 44;
		Mass   400;
		Speed  10;
		PainChance 180;
		Monster;
		+TELESTOMP
		+DONTOVERLAP
		+NOTARGETSWITCH
		+NEVERRESPAWN
		+DONTRIP
		+NOICEDEATH
		+BOSS
	}
	states {
		Spawn:
			DUMI A 0;
			DUMI A 1 A_Look();
		Idle:
			DUMI A 12 A_Look();
			loop;
		See:
			DUMI A 3 A_Chase();
			DUMI A 1 DummyDecide();
			loop;
		Blur:
			DUMI D 2 DummyDoBlur();
			DUMI D 4 DummySpawnBlur();
			wait;
		Pain:
			DUMI BC 10;
			goto See;
		Missile:
			DUMI E 12 A_FaceTarget();
			DUMI F 12 A_FaceTarget();
			DUMI GH 2;
			DUMI I 10;
			goto See;
	}
	
	void DummyDecide()
	{
		if (random[DummyDecide]() >= 220)
		{
			SetStateLabel ("Blur");
		}
	}
	
	void DummySpawnBlur() {
		if (!--missilecount)
		{
			Vel.XY = (0,0);// = Vel.Y = 0;
			if (random[DummySpawnBlur]() > 64)
			{
				SetState (SeeState);
			}
			else
			{
				SetState (MissileState);
			}
		}
		Actor mo = Spawn ("CJ_DummyAfterimage", Pos, ALLOW_REPLACE);
		if (mo)
		{
			mo.angle = angle;
		}
	}
	
	void DummyDoBlur() {
		missilecount = random[DummyDoBlur](6, 12); // Random number of blurs
		if (random[DummyDoBlur]() < 120)
		{
			Thrust(6, Angle + 45);
		}
		else if (random[DummyDoBlur]() > 125)
		{
			Thrust(6, Angle - 45);
		}
		else
		{ // Thrust forward
			Thrust(6);
		}
	}
}

class CJ_DummyAfterimage : Actor {
	default {
		+NOBLOCKMAP
		+NOGRAVITY
		RenderStyle "AddStencil";
		StencilColor "79 3a 80";
	}
	states {
		Spawn:
			DUMI D 3 A_FadeOut(0.2, FTF_REMOVE);
	}
}