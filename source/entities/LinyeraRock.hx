package entities;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;

class LinyeraRock extends FlxSprite
{
	private var BulletTipe:Int;
	private var counter: Int;

	public function new(?X:Float=0, ?Y:Float=0)
	{
		super(X, Y);
		loadGraphic(AssetPaths.rockLinyera__png);
		velocity.set(50, 0);
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		movement();
		counter++;
	}
	
	function movement() 
	{
		
	}
}