package twogames;

import twogames.ui.*;

class GGJImperialistTurn extends GGJGameTurn
{
	public function new(playerId:Int, itemView:GGJGridSpaceItemsView)
	{
		super(itemView);
		_playerId = playerId;
	}

	override public function update():Void
	{

	}

	override public function actionsForTile(tile:GGJHexTile):Array<GGJGameAction>
	{
		var retVal:Array<GGJGameAction> = [new GGJMoveAction(1, tile)];
		return retVal;
	}

	/*
	 * Private
	 */
	private var _playerId:Int;
}
