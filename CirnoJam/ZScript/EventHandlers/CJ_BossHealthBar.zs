class CJ_BossHealthBar : EventHandler {
	Array<actor> bosses;
	
	override void WorldThingSpawned(WorldEvent e) {
		if (e.Thing.bBoss) {
			bosses.Push(e.Thing);
		}
	}
	
	override void RenderOverlay(RenderEvent e) {
		let font = Font.GetFont("SMALLFONT");
		
		if (bosses.Size()) {
			Screen.DrawText(font,
							Font.CR_RED,
							20, 20,
							String.format("Bosses: %u", bosses.Size()),
							DTA_CleanNoMove, true,
							DTA_KeepRatio, true);
		}
	}
}