package entities;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;

/**
 * ...
 * @author Lisandro
 */
class Isis extends FlxSprite 
{
	private var counter: Int = 0;

	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		loadGraphic(AssetPaths.EnemiesMusulman__png, true, 14, 32);
		animation.add("walk", [0, 1], 8, true);
		animation.play("walk");
		acceleration.y = 700;
		
	}
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		movement();		
		explosion();
	}
	
	function explosion() 
	{
		if (x - Reg.PlayerPosX < 10 && x- Reg.PlayerPosX > -10)
		{
			loadGraphic(AssetPaths.explosion__png);
		}
	}
	
	function movement()
	{
		velocity.set(50, 0);
		
		if (x < Reg.PlayerPosX)
		{
			velocity.set(50, 0);
		}
		else 
		{
			velocity.set(-50, 0);
		}
	}
	
}