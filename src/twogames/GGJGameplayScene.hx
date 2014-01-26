package twogames;

import com.haxepunk.*;
import com.haxepunk.utils.*;
import extendedhxpunk.ext.EXTScene;
import twogames.ui.*;

class GGJGameplayScene extends EXTScene
{
	public var grid:GGJGrid;

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
		_currentTurn = new GGJImperialistTurn(0, _itemView);

		_hudView.addSubview(_itemView);

		// Tiles
		this.grid = new GGJGrid();
		var soldier:GGJSoldier = new GGJSoldier();
		soldier.ownedPlayerId = 1;
		soldier.tile = this.grid.tilecolumns[0][0];
	}

	override public function update():Void
	{
		super.update();

		if (Input.mousePressed)
		{
			var clickedTile:GGJHexTile = cast this.topMostCollidePoint("grid_space", Input.mouseX, Input.mouseY);
			if (clickedTile != null)
			{
				_currentTurn.handleTileClick(clickedTile);
			}
		}
	}

	/**
	 * Private
	 */
	private var _hudView:JVHudView;
	private var _itemView:GGJGridSpaceItemsView;
	private var _currentTurn:GGJGameTurn;
}
