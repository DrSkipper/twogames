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
		_hudView = new JVHudView(this.worldCamera);
		_itemView = new GGJGridSpaceItemsView();
		this.staticUiController.rootView.addSubview(_hudView);

		_hudView.addSubview(_itemView);

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
			{
				this.selectedTile = clickedTile;
				var neighbors:Array<GGJHexTile> = grid.neighborsForHexTilePosition(cast clickedTile.gridLocation.x, cast clickedTile.gridLocation.y);
				for (i in 0...neighbors.length)
					neighbors[i].turnGreen();
			}
		}
	}

	public function set_selectedTile(tile:GGJHexTile):GGJHexTile
	{
		if (selectedTile != null)
			selectedTile.highlighted = false;
		tile.highlighted = true;
		return selectedTile = tile;
	}

	/**
	 * Private
	 */
	private var _hudView:JVHudView;
	private var _itemView:GGJGridSpaceItemsView;
}
