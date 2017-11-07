package entities;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;

class Gorro extends FlxSprite 
{

	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		loadGraphic(AssetPaths.gorro, true, 32,32);
		animation.add("fly", [0, 1, 2, 3], 8, true);
		animation.play("fly");
		this.
	}
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		move();
	}
	
	function move() 
	{
		
	}
	
}