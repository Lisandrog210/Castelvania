package entities;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;

class Slave extends FlxSprite 
{

	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		loadGraphic(AssetPaths.slave__png, true, 40,40);
		animation.add("walk", [0, 1], 8, true);
		animation.play("walk");
	}
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		movement();
	}
	
	function movement() 
	{
		if (x < Reg.PlayerPosX) 
		{
			velocity.set(100, 0);
		}
		else 
		{
			velocity.set(-100, 0);
		}
	}
}

