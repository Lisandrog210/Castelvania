package states;

import flixel.FlxState;
import flixel.FlxG;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxColor;

/**
 * ...
 * @author ...
 */
class Manu extends FlxState 
{
	private var PlayButton:FlxButton;
	private var Title: FlxText;
	private var Text: FlxText;
	private var Text2: FlxText;

	override public function create():Void 
	{
		super.create();
		
		Title = new FlxText(20, 5, FlxG.width, "Castlevania");
		Title.setFormat(null, 12, FlxColor.RED);
		add(Title);
		
		Text = new FlxText(15, 50, FlxG.width, "Press 'Space' to continue");
		add(Text);
		
		Text2 = new FlxText(5, 90, FlxG.width, "Created by: Agustin DiMartino, Lisandro Guevara, Garcia Agustin ");
		Text2.setFormat(null, 8);
		add(Text2);
	}
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		if (FlxG.keys.pressed.SPACE) 
		{
			ClickPlay();
		}
	}
	
	function ClickPlay():Void
	{
		FlxG.switchState(new PlayState());
	}
	
}