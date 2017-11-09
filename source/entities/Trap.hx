package entities;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;


class Trap extends FlxSprite 
{

	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		loadGraphic(AssetPaths.pinchos__png,false,32,32);
		offset.set(0, 20);
		height = 16;
	}
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		
		
	}
	
}