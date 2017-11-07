package entities;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;

/**
 * ...
 * @author Lisandro
 */
class Isis extends FlxSprite 
{
	private var counter: Int;

	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		loadGraphic(AssetPaths.isis__png, true, 40,40);
		animation.add("walk", [0, 1], 8, true);
		animation.play("walk");
	}
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		movement();
		attack();
		
	}
	
	function attack() 
	{
		if (Reg.) 
		{
			
		}
	}
	
	function movement() 
	{
		velocity.set(50, 0);
		
		if (x < Reg.PlayerPosX) 
		{
			velocity.set(50, 0);
			jump();
		}
		else 
		{
			velocity.set(-50, 0);
			jump();
		}
	}
	
	function jump() 
	{
		if (x < Reg.PlayerPosX) 
		{
			velocity.y = -20;
			counter++;
			if (counter > 10) 
			{
				velocity.y = 20;
			}
		}
		else 
		{
			velocity.y = -20;
			counter++;
			if (counter > 10) 
			{
				velocity.y = 20;
			}
		}
	}
	
}