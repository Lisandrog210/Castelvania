package states;

import entities.GouhlFly;
import flixel.FlxState;
import entities.Player;
import flixel.FlxSprite;
import flixel.FlxG;
import flixel.util.FlxColor;
import flixel.FlxCamera;
import flixel.addons.display.FlxBackdrop;
import flixel.addons.editors.ogmo.FlxOgmoLoader;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.tile.FlxTilemap;
import flixel.FlxObject;

class PlayState extends FlxState
{
	
	private var player:Player;
	private var loader:FlxOgmoLoader;
	private var background:FlxBackdrop;
	private var tilemapBricks:FlxTilemap;
	private var groupGouhlfly:FlxTypedGroup<GouhlFly>;	
	

	override public function create():Void
	{
		super.create();
		
		groupGouhlfly = new FlxTypedGroup<GouhlFly>();
		
		cameraSetup();
		
		FlxG.camera.bgColor = FlxColor.ORANGE;
		background = new FlxBackdrop(AssetPaths.wallpaper1__png);
		
		
		player = new Player(100, 10);
		
		add(player);		
		
	}
	
	function cameraSetup() 
	{
		camera = new FlxCamera();
		camera.follow(player);
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		

	}
}