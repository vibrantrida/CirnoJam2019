class CJ_BaseEnemy : Actor {
	default {
		Monster;
		+FLOORCLIP
		+LOOKALLAROUND
		+DONTMORPH
		+NOTRIGGER
	}

	override void Die(Actor source, Actor inflictor, int dmgflags, Name MeansOfDeath) {
		if (source && source.player) {
			source.GiveInventory("CJ_ComboCounter", 20);
		}
		Super.Die(source, inflictor, dmgflags);
	}
}