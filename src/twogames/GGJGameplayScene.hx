package twogames;

import extendedhxpunk.ext.EXTScene;
import twogames.ui.*;

class GGJGameplayScene extends EXTScene
{
	public function new()
	{
		super();
	}

	override public function begin():Void
	{
		this.staticUiController.rootView.addSubview(new JVHudView(this.worldCamera));
	}
}
