package twogames;

import com.haxepunk.*;
import com.haxepunk.graphics.*;

class GGJBuilding extends GGJGameObject
{
	public function new()
	{
		super();
		var myImage:Image = new Image("gfx/hex_blue.png");
		myImage.centerOrigin();
		this.graphic = myImage;
	}

	override public function gameActionsForImperialistTurn(turn:GGJImperialistTurn):Array<GGJGameAction>
	{
		var retVal:Array<GGJGameAction> = new Array();
		retVal.push(new GGJProduceSoldierAction(1, this.tile, turn, this));
		return retVal;
	}
}
