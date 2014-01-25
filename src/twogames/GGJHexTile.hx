package twogames;

import flash.geom.Point;
import com.haxepunk.*;
import com.haxepunk.graphics.*;
import com.haxepunk.masks.*;
import twogames.*;

class GGJHexTile extends Entity
{
	public var gridLocation:Point;

	public function new(gridX:Int, gridY:Int)
	{
		var screenCenterX:Int = cast (HXP.screen.width / 2);
		var screenCenterY:Int = cast (HXP.screen.height / 2);

		var distanceFromCenterX:Int = cast (gridX - GGJConstants.MIDDLE_COLUMN_INDEX);
		var distanceFromCenterY:Int = cast (gridY - GGJConstants.MIDDLE_COLUMN_INDEX);
		var yOffset:Int = cast (Math.abs(distanceFromCenterX) * (GGJConstants.GRID_SPACE_HEIGHT * 0.5));

		_brownImage = new Image("gfx/hex_brown.png");
		_greenImage = new Image("gfx/hex_green.png");
		_blueImage = new Image("gfx/hex_blue.png");
		_brownImage.centerOrigin();
		_greenImage.centerOrigin();
		_blueImage.centerOrigin();
		gridLocation = new Point(gridX, gridY);
		var pixelmask:Pixelmask = new Pixelmask("gfx/hex_brown.png", Std.int(-_brownImage.width / 2), Std.int(-_brownImage.height / 2));

		super(screenCenterX + (distanceFromCenterX * GGJConstants.GRID_SPACE_WIDTH), 
			  screenCenterY + (distanceFromCenterY * GGJConstants.GRID_SPACE_HEIGHT) + yOffset, 
			  _brownImage);

		this.type = "grid_space";
		this.mask = pixelmask;
	}

	public function turnBrown():Void
	{
		this.graphic = _brownImage;
	}

	public function turnGreen():Void
	{
		this.graphic = _greenImage;
	}

	public function turnBlue():Void
	{
		this.graphic = _blueImage;
	}

	/**
	 * Private
	 */
	private var _brownImage:Image;
	private var _greenImage:Image;
	private var _blueImage:Image;
}
