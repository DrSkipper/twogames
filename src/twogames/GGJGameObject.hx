package twogames;

import com.haxepunk.*;

class GGJGameObject extends Entity
{
	public var ownedPlayerId:Int;
	public var tile(default, set):GGJHexTile;
	public var hasPerformedAction:Bool;

	public function new(playerId:Int)
	{
		super();
		this.ownedPlayerId = playerId;
		// HXP.scene.add(this);
	}

	public function gameActionsForImperialistTurn(turn:GGJImperialistTurn):Array<GGJGameAction>
	{
		var retVal:Array<GGJGameAction> = new Array();
		return retVal;
	}

	public function set_tile(v:GGJHexTile):GGJHexTile
	{
		if (v != null)
		{
			this.x = v.x;
			this.y = v.y;
			if (tile != null)
			{
				tile.removeObjectGraphic(this.graphic);
				tile.gameObjects.remove(this);
			}
			v.addObjectGraphic(this.graphic);
			v.gameObjects.push(this);
		}
		return tile = v;
	}
}
