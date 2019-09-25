class CJ_StatusBar : BaseStatusBar {
	Font fntSmallFont;
	HUDFont mSmallFont;

	double facePriority;
	textureid faceTex;
	double faceTime;
	
	override void Init() {
		Super.Init();
		fullscreenOffsets = true;
		SetSize(0, 320, 240);
		
		fntSmallFont = "SmallFont";
		mSmallFont = HUDFont.create(fntSmallFont);
	} // Init
	
	override void Draw(int state, double TicFrac) {
		Super.Draw(state, TicFrac);
		
		BeginHUD(1, true);
		DrawStatusBar(TicFrac);
	} // Draw
	
	void DrawStatusBar(double TicFrac) {
		DrawImage("SBSTATS", (2, -44), DI_ITEM_LEFT_TOP);
		DrawTexture(GetMugshot(1, MugShot.XDEATHFACE | MugShot.ANIMATEDGODMODE), (4, -42), DI_ITEM_LEFT_TOP);
		DrawString(mSmallFont, FormatNumber(CPlayer.Health, 3), (115, -35), DI_TEXT_ALIGN_RIGHT);
		DrawBombs(GetBombCount());
		DrawBar("SBBONHP", "SBBOFHP", CPlayer.Health, 100, (47, -25), 0, SHADER_HORZ, DI_ITEM_LEFT_TOP);
		
		DrawImage("SBKEYS", (-85, -31), DI_ITEM_LEFT_TOP);
	} // DrawStatusBar
	
	void DrawBombs(int amount) {
		for (int i = 0; i < amount; i += 1) {
			if (i > 0) {
				DrawImage("SBBOM0", (80 + (9 * i), -11), DI_ITEM_LEFT_TOP);
			} else {
				DrawImage("SBBOM0", (80, -11), DI_ITEM_LEFT_TOP);
			}
		}
	}
	
	int GetBombCount() {
		let _bomb = CPlayer.mo.FindInventory("CJ_BombCirno");
		return _bomb ? _bomb.Amount : 0;
	}
}