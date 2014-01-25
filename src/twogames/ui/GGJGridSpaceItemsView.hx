package twogames.ui;

import flash.geom.Point;
import extendedhxpunk.ext.*;
import extendedhxpunk.ui.*;
import twogames.*;

class GGJGridSpaceItemsView extends JVExampleDialog
{
	public function new()
	{
		super(new Point(-20, -20), new Point(180, 240));
		this.offsetAlignmentForSelf = EXTOffsetType.BOTTOM_RIGHT;
		this.offsetAlignmentInParent = EXTOffsetType.BOTTOM_RIGHT;
	}
}
