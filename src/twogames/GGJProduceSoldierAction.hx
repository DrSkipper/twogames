package twogames;

class GGJProduceSoldierAction extends GGJGameAction
{
	public var spawnRange:Int;

	public function new(spawnableRange:Int, originTile:GGJHexTile, turn:GGJGameTurn, originObject:GGJGameObject)
	{
		super("train soldier", originTile, turn, originObject);
		this.spawnRange = spawnableRange;
	}

	override public function activate():Void
	{
		super.activate();

		_originTile.highlighted = false;
		_neighbors = _originTile.neighbors();
		for (i in 0..._neighbors.length)
		{
			if (_neighbors[i].gameObjects.length == 0)
				_neighbors[i].highlighted = true;
		}
	}

	override public function execute(targetTile:GGJHexTile):Bool
	{
		super.execute(targetTile);

		var validTile:Bool = false;
		for (i in 0..._neighbors.length)
		{
			if (targetTile == _neighbors[i] && targetTile.gameObjects.length == 0)
				validTile = true;

			_neighbors[i].highlighted = false;
		}

		if (validTile)
		{
			var soldier:GGJSoldier = new GGJSoldier();
			soldier.ownedPlayerId = _originObject.ownedPlayerId;
			soldier.tile = targetTile;

		}
		else
			_originTile.highlighted = true;

		return validTile;
	}

	/**
	 * Private
	 */
	private var _neighbors:Array<GGJHexTile>;
}
