package states;

import flixel.FlxState;
import entities.Player;
import flixel.FlxSprite;
import flixel.FlxG;
import flixel.util.FlxColor;

class PlayState extends FlxState
{
	private var player:Player;
	private var platform1:FlxSprite;
	
	override public function create():Void
	{
		super.create();
		
		FlxG.camera.bgColor = FlxColor.ORANGE;
		
		platform1 = new FlxSprite(80, 120);
		platform1.makeGraphic(100, 20);
		platform1.immovable = true;
		
		player = new Player(100, 10);
		
		add(platform1);
		add(player);		
		
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		FlxG.collide(platform1, player);
		

	}
}