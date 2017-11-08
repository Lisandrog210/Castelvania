package entities;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;

class Linyera extends FlxSprite 
{
	private var shot: Enemyshot;
	private var counter: Float = 0;

	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		loadGraphic(AssetPaths.Lingera__png, true, 18,27);
		animation.add("atack", [0, 2], 5, true);
		animation.play("atack");
	}
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		counter = counter + elapsed;
		if (counter > 5) 
		{
			shoot();
			counter = 0;
		}
		
	}
	
	function shoot() 
	{
		shot = new Enemyshot(x, y, 2);
	}
	
	
	
	
}