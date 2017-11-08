package entities;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;

class Enemyshot extends FlxSprite
{
	private var BulletTipe:Int;
	private var counter: Int;

	public function new(?X:Float=0, ?Y:Float=0, BulletTipe:Int)
	{
		super(X, Y);
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		movement();
		counter++;
	}
	
	function movement() 
	{
		switch (BulletTipe)
		{
			case 1:
				loadGraphic(AssetPaths.bulletGorro__png);
				this.velocity.set(0, 50);
			case 2:
				loadGraphic(AssetPaths.rockLinyera__png);
				velocity.set(5, 0);
				if (counter > 20) 
				{
					velocity.set(5, 10);
				}
				
		}
	}
}