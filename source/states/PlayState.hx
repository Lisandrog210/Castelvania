package states;

import entities.GouhlFly;
import entities.Weapon;
import flixel.FlxState;
import entities.Player;
import flixel.FlxSprite;
import flixel.FlxG;
import flixel.addons.weapon.FlxWeapon;
import flixel.util.FlxColor;
import flixel.FlxCamera;
import flixel.addons.display.FlxBackdrop;
import flixel.addons.editors.ogmo.FlxOgmoLoader;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.tile.FlxTilemap;
import flixel.FlxObject;
import flixel.system.FlxAssets.FlxGraphicAsset;
import entities.Weapon;

class PlayState extends FlxState
{

	private var player:Player;
	private var loader:FlxOgmoLoader;
	private var background:FlxBackdrop;
	private var tilemapBricks:FlxTilemap;
	private var groupGouhlfly:FlxTypedGroup<GouhlFly>;
	private var whip:Weapon;
	
	
	
	
	override public function create():Void
	{
		super.create();

		groupGouhlfly = new FlxTypedGroup<GouhlFly>();

		background = new FlxBackdrop(AssetPaths.wallpaper1__png);
		levelSetup();
		add(background);
		add(tilemapBricks);

		FlxG.worldBounds.set(0, 0, tilemapBricks.width, tilemapBricks.height);
		
		player = new Player(100, 10);
		player.pixelPerfectPosition = false;
		
		whip = new Weapon(player.width / 2, player.height / 2, AssetPaths.whip__png);
		
		add(whip);
		whip.kill();
		add(groupGouhlfly);
		add(player);
		cameraSetup();
	}

	function cameraSetup()
	{
		FlxG.camera.follow(player, FlxCameraFollowStyle.PLATFORMER);
	}

	function levelSetup()
	{
		loader = new FlxOgmoLoader(AssetPaths.test1__oel);

		tilemapBricks = loader.loadTilemap(AssetPaths.lvlTEST__png,32,32,"BRICKS");
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
				var gouhl1:GouhlFly = new GouhlFly(x, y, AssetPaths.gouhl2__png);
				groupGouhlfly.add(gouhl1);

		}
	}
	function collisionDetect()
	{
		
		FlxG.overlap(player, groupGouhlfly, collidePlayerGouhl);
		
	}
	
	function collidePlayerGouhl(e:FlxSprite,p:Player){
			e.kill();
			p.kill();
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		collisionDetect();
		FlxG.collide(player, tilemapBricks);
		
	}
	
	/*function checkPlayerState(){
		
		player.currentState;
		if () 
		{
			
		}
	}*/
}	
