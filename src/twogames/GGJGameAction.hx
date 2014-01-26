package twogames;

class GGJGameAction
{
	public var name:String;
	
	public function new(actionName:String, originTile:GGJHexTile)
	{
		this.name = actionName;
		_originTile = originTile;
	}

	public function activate():Void
	{

	}

	public function execute(targetTile:GGJHexTile):Void
	{
		
	}

	/**
	 * Private
	 */
	private var _originTile:GGJHexTile;
}
