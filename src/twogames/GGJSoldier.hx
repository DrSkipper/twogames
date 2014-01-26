package twogames;

import com.haxepunk.*;
import com.haxepunk.graphics.*;

class GGJSoldier extends GGJGameObject
{
	public function new()
	{
		super();
		var myImage:Image = new Image("gfx/hex_green.png");
		myImage.centerOrigin();
		this.graphic = myImage;
	}
	
	override public function gameActionsForImperialistTurn(turn:GGJImperialistTurn):Array<GGJGameAction>
	{
		var retVal:Array<GGJGameAction> = new Array();
		retVal.push(new GGJMoveAction(1, this.tile, turn, this));
		return retVal;
	}
}
