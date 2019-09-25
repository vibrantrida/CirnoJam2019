class CJ_BombCirno : Ammo {
	default {
		//$Category CirnoJam/Items
		//$Title Bomb (Cirno)
		//$Sprite DEIBMB
		+INVENTORY.IGNORESKILL;
		Inventory.Amount 1;
		Inventory.MaxAmount 4;
		Ammo.BackpackAmount 0;
		Ammo.BackpackMaxAmount 0;
		Ammo.DropAmount 0;
	}
	states {
		Spawn:
			IBMB A -1;
			Stop;
	}
}