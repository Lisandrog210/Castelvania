package entities;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;


class GouhlFly extends FlxSprite 
{
	private var counter: Int = 0;
	private var velMaxY: Int = 80;

	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		loadGraphic(AssetPaths.gouhl2__png, true, 64,64);
		animation.add("fly", [0, 1, 2], 8, true);
		animation.play("fly");
	}
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		movement();
	}
	
	function movement() 
	{
		counter++;
		velocity.x = -20;
		if (counter == 30)
		{
			velMaxY *= -1;
			velocity.y = velMaxY;
			counter = 0;
		}
	}
	
}