package entities;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;


class GouhlFly extends FlxSprite 
{

	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		loadGraphic(AssetPaths.gouhl2__png, true, 64,64);
		animation.add("fly", [0, 1, 2], 8, true);
		animation.play("fly");
	}
	
}