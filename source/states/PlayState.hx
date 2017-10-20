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
		
		FlxG.camera.bgColor = 0xFFCC4466;
		
		platform1 = new FlxSprite(100, 350);
		platform1.makeGraphic(440, 32,FlxColor.WHITE);
		platform1.immovable = true;
		
		player = new Player(300, 200);
		
		add(platform1);
		add(player);
		
		
		
		
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		FlxG.collide(platform1, player);

	}
}