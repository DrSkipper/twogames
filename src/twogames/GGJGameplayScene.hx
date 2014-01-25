package twogames;

import com.haxepunk.*;
import com.haxepunk.utils.*;
import extendedhxpunk.ext.EXTScene;
import twogames.ui.*;

class GGJGameplayScene extends EXTScene
{
	public var grid:GGJGrid;
	public var selectedTile(default, set):GGJHexTile;

	public function new()
	{
		super();
	}

	override public function begin():Void
	{
		super.begin();

		// HUD
		this.staticUiController.rootView.addSubview(new JVHudView(this.worldCamera));

		// Tiles
		this.grid = new GGJGrid();
	}

	override public function update():Void
	{
		super.update();

		if (Input.mousePressed)
		{
			var clickedTile:GGJHexTile = cast this.topMostCollidePoint("grid_space", Input.mouseX, Input.mouseY);
			if (clickedTile != null)
				this.selectedTile = clickedTile;
		}
	}

	public function set_selectedTile(tile:GGJHexTile):GGJHexTile
	{
		if (selectedTile != null)
			selectedTile.turnBrown();
		tile.turnBlue();
		return selectedTile = tile;
	}
}
