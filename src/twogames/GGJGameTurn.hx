package twogames;

import twogames.ui.*;

class GGJGameTurn
{
	public var selectedTile(default, set):GGJHexTile;
	public var currentAction:GGJGameAction;

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
			if (this.currentAction != null)
			{
				var actionResult:Bool = this.currentAction.execute(tile);

				_itemView.enableButtons();
				if (actionResult)
					this.selectedTile = null;
			}
			else
			{
				this.selectedTile = null;
			}
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
			_itemView.enableButtons();
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
	private var _itemView:GGJGridSpaceItemsView;
}
