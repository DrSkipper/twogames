package twogames;

class GGJMoveAction extends GGJGameAction
{
	public var moveDistance:Int;

	public function new(movableDistance:Int, originTile:GGJHexTile, turn:GGJGameTurn, originObject:GGJGameObject)
	{
		super("move", originTile, turn, originObject);
		this.moveDistance = movableDistance;
	}

	override public function activate():Void
	{
		super.activate();

		_originTile.highlighted = false;
		_neighbors = _originTile.neighbors();
		for (i in 0..._neighbors.length)
		{
			_neighbors[i].highlighted = true;
		}
	}

	override public function execute(targetTile:GGJHexTile):Bool
	{
		super.execute(targetTile);

		var validTile:Bool = false;
		for (i in 0..._neighbors.length)
		{
			if (targetTile == _neighbors[i])
				validTile = true;

			_neighbors[i].highlighted = false;
		}

		if (validTile)
			_originObject.tile = targetTile;
		else
			_originTile.highlighted = true;

		return validTile;
	}

	/**
	 * Private
	 */
	private var _neighbors:Array<GGJHexTile>;
}
