package entities;

import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;

/**
 * ...
 * @author ...
 */
class PlataformaInestable extends FlxSprite 
{
	private var counter: Int = 0;

	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		loadGraphic(AssetPaths.PlataformaInest__png, false);
		immovable = true;
	}
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		counter++;
		desaparicion();
	}
	
	function desaparicion() 
	{
		if (this.alive) 
		{
			if (counter == 20) 
			{
				this.kill();
			}
		}
		else 
		{
			if (counter == 20) 
			{
				this.revive();
			}
		}
	}
}