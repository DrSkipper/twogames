package twogames;

class GGJGrid
{
	// Should be an odd number of columns
	public var tilecolumns:Array<Array<GGJHexTile>>;

	public function new()
	{
		super();

		tilecolumns = new Array();
		for (i...GGJConstants.HEX_GRID_COLUMNS)
		{
			var tilerow:Array<GGJHexTile> = new Array();
			for (j...this.tilesInColumn(i))
			{
				tilerow.add(new GGJHexTile());
			}
		}
	}

	public function tilesInColumn(columnIndex:Int):Int
	{
		var middleColumnIndex:Int = GGJConstants.HEX_GRID_COLUMNS / 2;
		var distanceFromCenter:Int = Math.abs(middleColumnIndex - columnIndex);
		return GGJConstants.HEX_GRID_COLUMNS - distanceFromCenter;
	}
}
