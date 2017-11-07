package entities;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.FlxG;
import flixel.FlxObject;
import entities.Whip;
import flixel.FlxState;
import entities.Kunai;

import flixel.util.FlxColor;

enum States
{
	IDLE;
	RUN;
	JUMP;
	WHIP;
	//CROUCH;
	THROW;
	//IMMORTAL;
}

class Player extends FlxSprite
{
	public var currentState(get, null):States;
	public var whip:Whip;
	public var kunai:Kunai;

	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset)
	{
		super(X, Y, SimpleGraphic);
		loadGraphic(AssetPaths.player__png, true, 40, 40);
		setFacingFlip(FlxObject.RIGHT, false, false);
		setFacingFlip(FlxObject.LEFT, true, false);

		animation.add("idle", [0], 8, true);
		animation.add("run", [0,1,2], 8, true);
		animation.add("jump", [3,4], 8, false);
		animation.add("whip", [5, 6, 9, 9, 9, 9, 9, 9], 16, false);
		animation.add("throw", [7,8,9], 16, false);
		acceleration.y = 1000;
		currentState = States.IDLE;
		scale.set(1.5,1.5);
		updateHitbox();
		whip = new Whip();
		FlxG.state.add(whip);
		whip.kill();
		kunai = new Kunai();
		FlxG.state.add(kunai);
		kunai.kill();

	}

	override public function update(elapsed:Float):Void
	{
		stateMachine();
		super.update(elapsed);
		
		Whip.pFacing = facing;
					if (facing==FlxObject.RIGHT)
					{						
						whip.setPosition(x + width - 6, y + height - 35);
					}
					else
					{						
						whip.setPosition(x - width + 6, y + height - 35);					
					}
	}

	private function stateMachine() : Void
	{
		switch (currentState)
		{
			case States.IDLE:

				whip.kill();
				animation.play("idle");
				move();
				jump();
				if (FlxG.keys.justPressed.Z) 
				{
					currentState = States.THROW;
				}

				if (velocity.y != 0)
					currentState = States.JUMP;
				else if (velocity.x != 0)
					currentState = States.RUN;
				if (FlxG.keys.justPressed.SPACE)
				{
					currentState = States.WHIP;
				}
				
			case States.RUN:
				animation.play("run");
				move();
				jump();
				if (FlxG.keys.justPressed.Z) 
				{
					currentState = States.THROW;
				}
				if (FlxG.keys.justPressed.SPACE)
				{
					currentState = States.WHIP;
				}
				if (velocity.y != 0)
					currentState = States.JUMP;
				else if (velocity.x == 0)
					currentState = States.IDLE;
										
			case States.JUMP:
				animation.play("jump");
				if (animation.curAnim.curFrame == 1)
				{
					animation.curAnim.stop;
				}
				move();
				if (FlxG.keys.justPressed.SPACE)
				{
					currentState = States.WHIP;
				}

				if (velocity.y == 0)
				{
					if (velocity.x == 0)
						currentState = States.IDLE;
					else
						currentState = States.RUN;
				}
				if (FlxG.keys.justPressed.Z) 
				{
					currentState = States.THROW;
				}	
				
			case States.WHIP:
				if (animation.name != "whip")
				{
					velocity.x = 0;
					animation.play("whip");
				}
				jump();
				if (animation.curAnim.curFrame == 2)
				{
					Whip.pFacing = facing;
					if (facing==FlxObject.RIGHT)
					{						
						whip.reset(x + width - 6, y + height - 35);
					}
					else
					{						
						whip.reset(x - width + 6, y + height - 35);					
					}			

				}
				if (animation.name == "whip" && animation.finished)
				{
					currentState = States.IDLE;
				}
				
			case States.THROW:
				if (animation.name != "throw")
				{
					velocity.x = 0;
					animation.play("throw");
				}
				jump();
				if (animation.curAnim.curFrame == 2)
				{
					kunai.kFacing = facing;
					if (kunai.alive == false) 
					{					
						if (facing==FlxObject.RIGHT)
						{						
							kunai.reset(x + width - 6, y + height - 20);
						}
						else
						{						
							kunai.reset(x - width + 6, y + height - 20);					
						}
					
					}
				}
				if (animation.name == "throw" && animation.finished)
				{
					currentState = States.IDLE;
				}			
			
		}
	}

	function move():Void
	{
		velocity.x = 0;

		if (FlxG.keys.pressed.RIGHT)
			velocity.x += 100;
		if (FlxG.keys.pressed.LEFT)
			velocity.x -= 100;

		if (velocity.x < 0)
			facing = FlxObject.LEFT;
		if (velocity.x > 0)
			facing = FlxObject.RIGHT;
	}

	function jump():Void
	{
		if (FlxG.keys.justPressed.UP && isTouching(FlxObject.FLOOR))
			velocity.y = -300;
	}

	function get_currentState():States
	{
		return currentState;
	}
	
	
}