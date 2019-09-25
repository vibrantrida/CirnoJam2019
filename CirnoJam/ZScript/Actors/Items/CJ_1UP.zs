class CJ_1UP : Health {
	default {
		//$Category CirnoJam/Items
		//$Title 1UP
		//$Sprite DEI1UP
		Inventory.Amount 1;
		Inventory.MaxAmount 200;
		+COUNTITEM
		+INVENTORY.ALWAYSPICKUP
	}
	states {
		Spawn:
			I1UP A -1;
			stop;
	}
}