package twogames;

import twogames.ui.*;

class GGJGameTurn
{
	public var selectedTile(default, set):GGJHexTile;

	public function new(itemView:GGJGridSpaceItemsView)
	{
		_itemView = itemView;
	}

	public function update():Void
	{

	}

	public function handleTileClick(tile:GGJHexTile):Void
	{
		if (this.selectedTile == null)
			this.selectedTile = tile;
		else
		{
		}
	}

	public function actionsForTile(tile:GGJHexTile):Array<GGJGameAction>
	{
		return new Array();
	}

	public function set_selectedTile(tile:GGJHexTile):GGJHexTile
	{
		if (selectedTile != null)
			selectedTile.highlighted = false;
		if (tile != null)
		{
			tile.highlighted = true;
			_itemView.updateForGameActions(this.actionsForTile(tile));
		}
		else
		{
			_itemView.updateForGameActions(null);
		}
		return selectedTile = tile;
	}

	/**
	 * Private
	 */
	private var _currentAction:GGJGameAction;
	private var _itemView:GGJGridSpaceItemsView;
}
