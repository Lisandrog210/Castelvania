package entities;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;

class Linyera extends FlxSprite 
{
	private var shot: Enemyshot;
	private var counter: Int = 0;

	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		loadGraphic(AssetPaths.linyera__png, true, 40,40);
		animation.add("atack", [0, 2], 8, true);
		animation.play("atack");
	}
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		counter++;
		shoot();
	}
	
	function shoot() 
	{
		if (counter >= 15) 
		{
			shot = new Enemyshot(x, y, 2);
		}
	}
	
	
	
	
}