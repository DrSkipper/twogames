package twogames;

import com.haxepunk.*;
import com.haxepunk.graphics.*;

class GGJWorker extends GGJGameObject
{
	public function new(playerId:Int)
	{
		super(playerId);
		var myImage:Image = playerId == 1 ? new Image("gfx/hex_worker_blue.png") : new Image("gfx/hex_worker_red.png");
		myImage.centerOrigin();
		this.graphic = myImage;
	}
	
	override public function gameActionsForImperialistTurn(turn:GGJImperialistTurn):Array<GGJGameAction>
	{
		var retVal:Array<GGJGameAction> = new Array();
		retVal.push(new GGJMoveAction(1, this.tile, turn, this));
		retVal.push(new GGJHarvestAction(1, this.tile, turn, this));
		return retVal;
	}
}
