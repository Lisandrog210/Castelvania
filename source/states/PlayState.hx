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

		
		background = new FlxBackdrop(AssetPaths.wallpaper1__png);

		add(background);
		add(tilemapBricks);

		player = new Player(100, 10);
		player.pixelPerfectPosition = false;

		levelSetup();

		add(groupGouhlfly);
		add(player);
		cameraSetup();
	}
	
	function cameraSetup()
	{
		camera = new FlxCamera();
		camera.follow(player);
	}
	
	function levelSetup()
	{
		loader = new FlxOgmoLoader(AssetPaths.test1__oel);

		tilemapBricks = loader.loadTilemap(AssetPaths.lvlTEST__png, 32, 32, "bricks");
		tilemapBricks.setTileProperties(0, FlxObject.NONE);

		loader.loadEntities(entityCreator, "enemies");

		
	}
	
	private function entityCreator(entityName:String, entityData:Xml)
		{

			var x:Int = Std.parseInt(entityData.get("x"));
			var y:Int = Std.parseInt(entityData.get("y"));

			switch (entityName)
			{
				case "gouhlfly":
					var gouhl1:GouhlFly = new GouhlFly(x, y, AssetPaths.gouhl1__png);
					groupGouhlfly.add(gouhl1);
			}
		}
	function collisionDetect()
	{
		
	}
	
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
}