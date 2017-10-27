package entities;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.FlxG;
import flixel.FlxObject;
import entities.Weapon;
import flixel.FlxState;

import flixel.util.FlxColor;

enum States
{
	IDLE;
	RUN;
	JUMP;
	WHIP;
}

class Player extends FlxSprite
{
	public var currentState(get, null):States;
	public var whip:Weapon;

	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset)
	{
		super(X, Y, SimpleGraphic);
		loadGraphic(AssetPaths.player1__png, true, 40, 40);
		setFacingFlip(FlxObject.RIGHT, false, false);
		setFacingFlip(FlxObject.LEFT, true, false);

		animation.add("idle", [0], 8, true);
		animation.add("run", [0,1,2], 8, true);
		animation.add("jump", [3,4], 8, false);
		animation.add("whip", [5,6,7], 8, false);
		acceleration.y = 1200;
		currentState = States.IDLE;
		//scale.set(0.5, 0.5);
		//updateHitbox();
		whip = new Weapon(x / 2, y / 2, AssetPaths.whip__png,);
		whip.animation.add("whipAnim", [0, 1, 2, 3, 4, 5], 12, false);
		FlxG.state.add(whip);
		whip.kill();
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
					currentState = States.WHIP;
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
				if (animation.curAnim.curFrame == 1) 
				{
					animation.curAnim.stop;
				}
				move();

				if (velocity.y == 0)
				{
					if (velocity.x == 0)
						currentState = States.IDLE;
					else
						currentState = States.RUN;

				}
			case States.WHIP:
				
					animation.play("whip");
					
					
					if (animation.curAnim.curFrame == 2) 
					{
						whip.reset(x / 2, y / 2);
						whip.animation.play("whipAnim");
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