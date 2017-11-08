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
		loadGraphic(AssetPaths.isis__png, true, 40,40);
		animation.add("walk", [0, 1], 8, true);
		animation.play("walk");
		animation.add("explode", [2], 8, true);
	}
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		movement();
		//attack();
		
	}
	
	/*function attack() 
	{
		if ((x - Reg.PlayerPosX) < 20 && > -20) 
		{
			animation.play("explode");
		}
	}*/
	
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