package entities;

import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;

class Slave extends FlxSprite 
{

	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		loadGraphic(AssetPaths.EnemigoNegro__png, true, 20, 27);
		animation.add("walk", [0, 1], 8, true);
		animation.play("walk");
		scale.set(1.1, 1.1);
		updateHitbox();
		acceleration.y = 700;
		setFacingFlip(FlxObject.RIGHT, true, false);
		setFacingFlip(FlxObject.LEFT, false, false);
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
			x += 80 * FlxG.elapsed;
			facing = FlxObject.RIGHT;
		}
		else 
		{
			x -= 80 * FlxG.elapsed;
			facing = FlxObject.LEFT;
		}
	}
}

