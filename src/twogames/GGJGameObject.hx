package twogames;

import com.haxepunk.*;

class GGJGameObject extends Entity
{
	public var ownedPlayerId:Int;
	public var tile:GGJHexTile;
	public var hasPerformedAction:Bool;

	public function new()
	{
		super();
	}

	public function gameActionsForImperialistTurn(turn:GGJImperialistTurn):Array<GGJGameAction>
	{
		var retVal:Array<GGJGameAction> = new Array();
		return retVal;
	}
}
