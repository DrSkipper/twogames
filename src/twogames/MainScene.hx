package twogames;

import flash.geom.Point;
import com.haxepunk.HXP;
import com.haxepunk.graphics.*;
import extendedhxpunk.ext.*;
import extendedhxpunk.ui.*;
import twogames.ui.*;

class MainScene extends EXTScene
{
	 public function new()
	 {
		super();
	 }

	override public function begin():Void
	{
		/** Standard
		// UI
		var titleDialog:JVExampleDialog = new JVExampleDialog(new Point(0, -200), new Point(250, 60));
		var titleText:Text = new Text("Solidarity", 0, 0, { "size" : 22, "color" : 0xEEEEEE });
		var titleLabel:UILabel = new UILabel(EXTUtility.ZERO_POINT, titleText);
		titleDialog.addSubview(titleLabel);
		
		// Play button
		_playButton = new JVExampleMenuButton(new Point(0, 80), "play", playButtonCallback);

		this.staticUiController.rootView.addSubview(titleDialog);
		this.staticUiController.rootView.addSubview(_playButton);
		*/

		/** Business card **/
		
		var parentView = new UIView(EXTUtility.ZERO_POINT, new Point(540, 396));
		parentView.backgroundColor.webColor = 0x440202;
		this.staticUiController.rootView.addSubview(parentView);
		
		var nameDialog:JVExampleDialog = new JVExampleDialog(new Point(0, -105), new Point(250, 60));
		var nameText:Text = new Text("fletcher cole", 0, 0, { "size" : 24, "color" : 0xEEEEEE });
		var nameLabel:UILabel = new UILabel(EXTUtility.ZERO_POINT, nameText);
		nameDialog.addSubview(nameLabel);
		parentView.addSubview(nameDialog);
		
		var titleText:Text = new Text("programmer + game creator", 0, 0, { "size" : 22, "color" : 0x101010, "align" : flash.text.TextFormatAlign.CENTER, "leading" : 5 });
		var twitterText:Text = new Text("@DrSkipper_", 0, 0, { "size" : 22, "color" : 0x101010 });
		var websiteText:Text = new Text("drskipper.github.io", 0, 0, { "size" : 22, "color" : 0x101010 });
		var emailText:Text = new Text("fletcherc89@gmail.com", 0, 0, { "size" : 22, "color" : 0x101010 });
		var phoneText:Text = new Text("408-966-0449", 0, 0, { "size" : 22, "color" : 0x101010 } );
		
		var titleLabel:UILabel = new UILabel(new Point(0, 0), titleText);
		var twitterLabel:UILabel = new UILabel(new Point(15, -45), twitterText);
		var websiteLabel:UILabel = new UILabel(new Point(15, -15), websiteText);
		var emailLabel:UILabel = new UILabel(new Point(-15, -45), emailText);
		var phoneLabel:UILabel = new UILabel(new Point(-15, -15), phoneText);
		
		twitterLabel.offsetAlignmentInParent = EXTOffsetType.BOTTOM_LEFT;
		twitterLabel.offsetAlignmentForSelf = EXTOffsetType.BOTTOM_LEFT;
		websiteLabel.offsetAlignmentInParent = EXTOffsetType.BOTTOM_LEFT;
		websiteLabel.offsetAlignmentForSelf = EXTOffsetType.BOTTOM_LEFT;
		emailLabel.offsetAlignmentInParent = EXTOffsetType.BOTTOM_RIGHT;
		emailLabel.offsetAlignmentForSelf = EXTOffsetType.BOTTOM_RIGHT;
		phoneLabel.offsetAlignmentInParent = EXTOffsetType.BOTTOM_RIGHT;
		phoneLabel.offsetAlignmentForSelf = EXTOffsetType.BOTTOM_RIGHT;
		
		parentView.addSubview(titleLabel);
		parentView.addSubview(twitterLabel);
		parentView.addSubview(websiteLabel);
		parentView.addSubview(emailLabel);
		parentView.addSubview(phoneLabel);
	}
	
	public function playButtonCallback(args:Array<Dynamic>):Void
	{
		HXP.scene = new GGJGameplayScene();
	}
	
	/**
	 * Private
	 */
	private var _toggleButton:JVExampleMenuButton;
	private var _playButton:JVExampleMenuButton;
}
