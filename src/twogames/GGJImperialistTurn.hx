package twogames;

import twogames.ui.*;

class GGJImperialistTurn extends GGJGameTurn
{
	public function new(playerId_:Int, itemView:GGJGridSpaceItemsView)
	{
		super(playerId_, itemView);
	}

	override public function update():Void
	{

	}

	override public function actionsForTile(tile:GGJHexTile):Array<GGJGameAction>
	{
		var retVal:Array<GGJGameAction> = new Array(); //[new GGJMoveAction(1, tile, this)];

		for (i in 0...tile.gameObjects.length)
		{
			retVal = retVal.concat(tile.gameObjects[i].gameActionsForImperialistTurn(this));
		}

		return retVal;
	}
}
