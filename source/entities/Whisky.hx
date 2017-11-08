package entities;

import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;


class Whisky extends FlxSprite 
{

	public var wFacing:Int;
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		setFacingFlip(FlxObject.RIGHT, false, false);
		setFacingFlip(FlxObject.LEFT, true, false);
		loadGraphic(AssetPaths.whisky__png, false, 32, 32);
		
	}
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);		
		facing = wFacing;
		move();
		limit();
	}
	
	function move() 
	{
		if (facing == FlxObject.RIGHT) 
		{
			velocity.x += 15;
		} else 
		{
			velocity.x -= 15;
		}
	}
	function limit() 
	{
		if (x > camera.scroll.x + FlxG.width - width) 
		{
			this.kill();
		} else if (x < camera.scroll.x)
			{
				this.kill(); 
				
			}
	}	
	
}