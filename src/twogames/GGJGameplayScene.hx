package twogames;

import flash.geom.Point;
import com.haxepunk.*;
import com.haxepunk.utils.*;
import com.haxepunk.graphics.*;
import extendedhxpunk.ext.*;
import extendedhxpunk.ui.*;
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
		var endTurnButton:JVExampleMenuButton = new JVExampleMenuButton(new Point(30, -30), "end turn", endTurn, new Array());
		endTurnButton.offsetAlignmentInParent = EXTOffsetType.BOTTOM_LEFT;
		endTurnButton.offsetAlignmentForSelf = EXTOffsetType.BOTTOM_LEFT;
		_currentPlayerText = new Text("blue empire", 0, 0, { "size" : 20, "color" : 0x101010 });
		var currentPlayerLabel:UILabel = new UILabel(new Point(0, -10), _currentPlayerText);
		currentPlayerLabel.offsetAlignmentInParent = EXTOffsetType.TOP_CENTER;
		currentPlayerLabel.offsetAlignmentForSelf = EXTOffsetType.BOTTOM_CENTER;
		endTurnButton.addSubview(currentPlayerLabel);
		_hudView.addSubview(endTurnButton);
		_hudView.addSubview(_itemView);
		this.staticUiController.rootView.addSubview(_hudView);

		_currentTurn = new GGJImperialistTurn(1, _itemView);
		_currentPlayerId = 1;

		// Tiles
		this.grid = new GGJGrid();
		var building:GGJBuilding = new GGJBuilding(1);
		building.tile = this.grid.tilecolumns[2][2];

		building = new GGJBuilding(2);
		var secondBuildingColumn:Array<GGJHexTile> = this.grid.tilecolumns[GGJConstants.HEX_GRID_COLUMNS - 3];
		building.tile = secondBuildingColumn[secondBuildingColumn.length - 3];

		// Resources
		var resource:GGJResources = new GGJResources(0);
		resource.tile = this.grid.tilecolumns[0][0];

		var neighbors:Array<GGJHexTile> = resource.tile.neighbors();
		for (i in 0...neighbors.length - 1)
		{
			resource = new GGJResources(0);
			resource.tile = neighbors[i];
		}

		resource = new GGJResources(0);
		resource.tile = this.grid.tilecolumns[GGJConstants.MIDDLE_COLUMN_INDEX][0];

		var neighbors:Array<GGJHexTile> = resource.tile.neighbors();
		for (i in 1...neighbors.length)
		{
			resource = new GGJResources(0);
			resource.tile = neighbors[i];
		}

		resource = new GGJResources(0);
		resource.tile = this.grid.tilecolumns[0][this.grid.tilecolumns[0].length - 1];

		var neighbors:Array<GGJHexTile> = resource.tile.neighbors();
		for (i in 0...neighbors.length)
		{
			if (i == 1)
				continue;
			resource = new GGJResources(0);
			resource.tile = neighbors[i];
		}

		resource = new GGJResources(0);
		resource.tile = this.grid.tilecolumns[GGJConstants.MIDDLE_COLUMN_INDEX][GGJConstants.MIDDLE_COLUMN_INDEX * 2];

		var neighbors:Array<GGJHexTile> = resource.tile.neighbors();
		for (i in 1...neighbors.length)
		{
			resource = new GGJResources(0);
			resource.tile = neighbors[i];
		}

		resource = new GGJResources(0);
		resource.tile = this.grid.tilecolumns[GGJConstants.HEX_GRID_COLUMNS - 1][0];

		var neighbors:Array<GGJHexTile> = resource.tile.neighbors();
		for (i in 0...neighbors.length - 1)
		{
			resource = new GGJResources(0);
			resource.tile = neighbors[i];
		}

		resource = new GGJResources(0);
		resource.tile = this.grid.tilecolumns[GGJConstants.HEX_GRID_COLUMNS - 1][this.grid.tilecolumns[GGJConstants.HEX_GRID_COLUMNS - 1].length - 1];

		var neighbors:Array<GGJHexTile> = resource.tile.neighbors();
		for (i in 0...neighbors.length)
		{
			if (i == 1)
				continue;
			resource = new GGJResources(0);
			resource.tile = neighbors[i];
		}

		resource = new GGJResources(0);
		resource.tile = this.grid.tilecolumns[GGJConstants.MIDDLE_COLUMN_INDEX][GGJConstants.MIDDLE_COLUMN_INDEX];

		var neighbors:Array<GGJHexTile> = resource.tile.neighbors();
		for (i in 0...neighbors.length)
		{
			if (i == 0 || i == 1 || i == 2 || i == 5)
				continue;
			resource = new GGJResources(0);
			resource.tile = neighbors[i];
		}
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

	public function endTurn(args:Array<Dynamic>):Void
	{
		++_currentPlayerId;
		if (_currentPlayerId > 2)
			_currentPlayerId = 1;

		//TODO - fcole - 3
		if (_currentPlayerId == 1)
		{
			_currentTurn = new GGJImperialistTurn(_currentPlayerId, _itemView);
			_currentPlayerText.text = "blue empire";
		}
		else if (_currentPlayerId == 2)
		{
			_currentTurn = new GGJImperialistTurn(_currentPlayerId, _itemView);
			_currentPlayerText.text = "red empire";
		}
	}

	/**
	 * Private
	 */
	private var _hudView:JVHudView;
	private var _itemView:GGJGridSpaceItemsView;
	private var _currentTurn:GGJGameTurn;
	private var _currentPlayerId:Int;
	private var _currentPlayerText:Text;
}
