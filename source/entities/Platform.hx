package entities;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;


class Platform extends FlxSprite 
{

	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		loadGraphic(AssetPaths.platform__png, false, 32,32);
		
	}
	
}