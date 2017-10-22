package entities;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.FlxG;
import flixel.FlxObject;

import flixel.util.FlxColor;

enum States
{
	IDLE;
	RUN;
	JUMP;
	MELEE;
}

class Player extends FlxSprite
{
	public var currentState(get, null):States;

	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset)
	{
		super(X, Y, SimpleGraphic);
		//makeGraphic(20, 40, FlxColor.GREEN);
		loadGraphic(AssetPaths.player1__png, true, 64, 64);
		setFacingFlip(FlxObject.RIGHT, false, false);
		setFacingFlip(FlxObject.LEFT, true, false);

		animation.add("idle", [1], 8, true);
		animation.add("run", [1,2,3,4,5], 8, true);
		animation.add("jump", [9], 8, false);
		animation.add("melee", [7,8], 8, false);
		acceleration.y = 1600;
		currentState = States.IDLE;
		scale.set(0.5, 0.5);
		updateHitbox();

	}

	override public function update(elapsed:Float):Void
	{
		stateMachine();
		super.update(elapsed);
	}

	private function stateMachine() : Void
	{
		switch (currentState)
		{
			case States.IDLE:
				animation.play("idle");
				move();
				jump();

				if (velocity.y != 0)
					currentState = States.JUMP;
				else if (velocity.x != 0)
					currentState = States.RUN;
				if (FlxG.keys.justPressed.SPACE)
				{
					currentState = States.MELEE;
				}
			case States.RUN:
				animation.play("run");
				move();
				jump();

				if (velocity.y != 0)
					currentState = States.JUMP;
				else if (velocity.x == 0)
					currentState = States.IDLE;
			case States.JUMP:
				animation.play("jump");
				move();

				if (velocity.y == 0)
				{
					if (velocity.x == 0)
						currentState = States.IDLE;
					else
						currentState = States.RUN;

				}
			case States.MELEE:
				
					animation.play("melee");
					if (animation.curAnim.curFrame == 1) 
					{
						currentState = States.IDLE;
					}
				

		}
	}

	private function move():Void
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

	private function jump():Void
	{
		if (FlxG.keys.justPressed.UP && isTouching(FlxObject.FLOOR))
			velocity.y = -300;
	}

	function get_currentState():States
	{
		return currentState;
	}
}