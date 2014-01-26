package twogames;

class GGJMoveAction extends GGJGameAction
{
	public var moveDistance:Int;

	public function new(movableDistance:Int, originTile:GGJHexTile)
	{
		super("Move", originTile);
		this.moveDistance = movableDistance;
	}

	override public function activate():Void
	{
		_originTile.highlighted = false;
		var neighbors:Array<GGJHexTile> = _originTile.neighbors();
		for (i in 0...neighbors.length)
		{
			neighbors[i].highlighted = true;
		}
	}

	override public function execute(targetTile:GGJHexTile):Void
	{

	}
}
