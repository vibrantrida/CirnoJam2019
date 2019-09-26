// thanks to Nash Muhandes :)
class ListMenuItemButtonItem : ListMenuItemPatchItem
{
	TextureID mSelTex;
	bool mCentered;

	void Init(ListMenuDescriptor desc, TextureID patch, TextureID selTex, bool centered, String hotkey, Name child, int param = 0)
	{
		Super.Init(desc, patch, hotkey, child, param);

		mSelTex = selTex;
		mCentered = centered;
	}

	override void Drawer(bool selected)
	{
		// if the "selected" texture is invalid, just use the Super method
		if (!mSelTex)
		{
			Super.Drawer(selected);
			return;
		}

		// quick hack to disable the default skull selector thing :^)
		let mnu = Menu.GetCurrentMenu();
		if (mnu && mnu is "ListMenu")
		{
			ListMenu(mnu).mDesc.mSelector = TexMan.CheckForTexture("TNT1A0", TexMan.Type_Any);
		}

		TextureID tex = selected ? mSelTex : mTexture;

		double x = mXpos;
		Vector2 vec = TexMan.GetScaledSize(tex);
		if (mCentered) x -= vec.X / 2;
		Screen.DrawTexture(tex, true, x, mYpos, DTA_Clean, true);
	}
}

class ListMenuItemButtonItemCentered : ListMenuItemButtonItem
{
	void Init(ListMenuDescriptor desc, TextureID patch, TextureID selTex, String hotkey, Name child, int param = 0)
	{
		Super.Init(desc, patch, selTex, true, hotkey, child, param);
	}
}
