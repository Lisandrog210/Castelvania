package entities;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;


class Lifebar extends FlxSprite 
{

	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
<<<<<<< Updated upstream
		loadGraphic(AssetPaths., true, 32, 32);
=======
<<<<<<< HEAD
	//	loadGraphic(AssetPaths., true, 32, 32);
>>>>>>> Stashed changes
		animation.add("whipAnim", [5], 1, false);
		animation.play("whipAnim");
=======
		loadGraphic(AssetPaths.lifebar__png, true, 31, 6);
		animation.add("lifebar", [0,1,2,3,4,5,6,7,8,9], 1, false);
		
>>>>>>> master
	}
	
}