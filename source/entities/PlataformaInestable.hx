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
	private var counter: Int = 120;

	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		immovable = true;
		this.alpha = 1;
	}
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		desaparicion();
	}
	
	function desaparicion() 
	{
		if (touching == 1) 
		{
			counter--;
		}
		if (counter <= 0) 
		{
			FlxTween.tween(this, { alpha: 0 }, 1.5, { ease: FlxEase.expoOut } );
		}
	}
}