package entities;

import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;


class Kunai extends FlxSprite 
{
	public var kFacing:Int;
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		super(X, Y, SimpleGraphic);
		setFacingFlip(FlxObject.RIGHT, false, false);
		setFacingFlip(FlxObject.LEFT, true, false);
		loadGraphic(AssetPaths.kunai__png, false, 32, 32);
		
	}
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		
		facing = kFacing; 
	}
}