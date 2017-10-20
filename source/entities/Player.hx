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

		animation.add("idle", [0], 8, true);
		animation.add("run", [0,1,2,3,4], 12, true);
		animation.add("jump", [8], 8, false);
		animation.add("melee",[6,7],12,true);

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
				if (FlxG.keys.pressed.SPACE)
				{
					animation.play("melee");
					move();
					jump();
				}

		}
	}

	private function move():Void
	{
		velocity.x = 0;

		if (FlxG.keys.pressed.RIGHT)
			velocity.x += 300;
		if (FlxG.keys.pressed.LEFT)
			velocity.x -= 300;

		if (velocity.x < 0)
			facing = FlxObject.LEFT;
		if (velocity.x > 0)
			facing = FlxObject.RIGHT;
	}

	private function jump():Void
	{
		if (FlxG.keys.justPressed.UP && isTouching(FlxObject.FLOOR))
			velocity.y = -600;
	}

	function get_currentState():States
	{
		return currentState;
	}
}