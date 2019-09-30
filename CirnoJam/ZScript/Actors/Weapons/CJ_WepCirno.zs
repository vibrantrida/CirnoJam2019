class CJ_WepCirno : CJ_BaseWeapon {
	default {
		Weapon.SelectionOrder 1900;
	}
	states {
		Ready:
			TNT1 A 0 A_TakeInventory("CJ_ComboCounter", 9999);
			WIC1 C 1 A_WeaponReady;
			Loop;
		Deselect:
			WIC1 CJK 2;
			WIC1 KKKKKKKKKKKKK 0 A_Lower;
			Loop;
		Select:
			WIC1 AAAAAAAAAAAAA 0 A_Raise;
			WIC1 ABC 2;
			Loop;
		Fire:
			WIC1 E 4;
		FireFirst:
			TNT1 A 0 A_JumpIfInventory("CJ_ComboCounter", 20, "DryFireSecond");
			WIC1 F 1 A_FireProjectile("CJ_IceBall");
			WIC1 G 2;
			WIC1 H 2;
			WIC1 I 2;
			WIC1 C 4 A_ReFire("FireFirst");
			Goto Ready;
		DryFireSecond:
			WIC2 A 4;
		FireSecond:
			WIC2 B 1;
			WIC2 C 1 A_FireProjectile("CJ_IceBall2");
			WIC2 DE 3;
			WIC2 F 2;
			WIC2 G 1 A_FireProjectile("CJ_IceBall2");
			WIC2 H 1;
			WIC2 IJ 3;
			WIC2 K 2 A_ReFire("FireSecond");
			WIC2 A 4;
			Goto Ready;
	}
}