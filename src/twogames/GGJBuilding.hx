package twogames;

class GGJBuilding extends GGJGameObject
{
	public function new()
	{
		super();
		this.image = new Image("gfx/hex_blue.png");
	}

	public function gameActionsForImperialistTurn(turn:GGJImperialistTurn):Array<GGJGameAction>
	{
		var retVal:Array<GGJGameAction> = new Array();
		return retVal;
	}
}
