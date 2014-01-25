package twogames;

class GGJMoveAction extends GGJGameAction
{
	public var moveDistance:Int;

	public function new(movableDistance:Int)
	{
		super("Move");
		this.moveDistance = movableDistance;
	}

	override public function activate():Void
	{

	}

	override public function execute(targetTile:GGJHexTile):Void
	{

	}
}
