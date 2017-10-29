package entities;

import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;

class Whip extends FlxSprite
{

	static public var pFacing:Int;
	
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset)
	{
		super(X, Y, SimpleGraphic);
		setFacingFlip(FlxObject.RIGHT, false, false);
		setFacingFlip(FlxObject.LEFT, true, false);
		loadGraphic(AssetPaths.whip__png, true, 32, 32);
		animation.add("whipAnim", [0, 1, 2, 3, 4, 5], 16, false);
		animation.play("whipAnim");
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		animation.play("whipAnim");
		facing = pFacing;
	}
}