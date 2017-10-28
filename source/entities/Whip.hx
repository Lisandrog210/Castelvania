package entities;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;

class Whip extends FlxSprite
{
	private var currentframe(get, null) = 0;

	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset)
	{
		super(X, Y, SimpleGraphic);
		loadGraphic(AssetPaths.whip__png, true, 32, 32);
		animation.add("whipAnim", [0, 1, 2, 3, 4, 5], 12, false);

	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		animation.play("whipAnim");
		currentframe = animation.curAnim.curFrame;

	}
	
	function get_currentframe()
	{
		return currentframe;
	}

}