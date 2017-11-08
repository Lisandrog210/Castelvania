package entities;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;


class Platform extends FlxSprite 
{
	private var counter: Float = 0;
	private var VelX: Int = 1;

	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		loadGraphic(AssetPaths.platform__png, false, 32, 32);
		immovable = true;
	}
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		counter = counter + elapsed;
		movement();
	}
	
	function movement() 
	{
		x += VelX;
		
		if (counter > 10.5)
		{
			VelX *= -1;
			counter = 0;
		}
	}
	
}