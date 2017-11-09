package entities;

import entities.Player;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;

class Whip extends FlxSprite
{

	public var pFacing:Int;
	
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset)
	{
		super(X, Y, SimpleGraphic);
		setFacingFlip(FlxObject.RIGHT, false, false);
		setFacingFlip(FlxObject.LEFT, true, false);
		loadGraphic(AssetPaths.whip__png, true, 32, 32);
		animation.add("whipAnim", [5], 1, false);
		animation.play("whipAnim");
		
		updateHitbox();
		
		facing = FlxObject.RIGHT;
		
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		animation.play("whipAnim");
		
		facing = pFacing;
		
		
	}
}