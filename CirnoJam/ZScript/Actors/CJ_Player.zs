class CJ_Player : PlayerPawn {
	default {
		Player.DisplayName "Cirno";
		Player.StartItem "CJ_WepCirno";
		Player.StartItem "CJ_BombCirno", 3;
		Player.WeaponSlot 1, "CJ_WepCirno";
		Player.SoundClass "CJ_Player";
	}
	states {
		Pain:
			PLAY G 4;
			PLAY G 4 A_Pain;
			Goto Spawn;
	}
}