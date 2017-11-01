package states;

import entities.GouhlFly;
import entities.Whip;
import flixel.FlxBasic;
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


class PlayState extends FlxState
{
	private var hud:FlxSprite;
	private var player:Player;
	private var loader:FlxOgmoLoader;
	private var background:FlxBackdrop;
	private var tilemapBricks:FlxTilemap;
	private var groupGouhlfly:FlxTypedGroup<GouhlFly>;
		
	override public function create():Void
	{
		super.create();

		groupGouhlfly = new FlxTypedGroup<GouhlFly>();
		hud = new FlxSprite(0, 0);
		hud.makeGraphic(256, 30, FlxColor.BLACK);
		hud.scrollFactor.set(0, 0);
		background = new FlxBackdrop(AssetPaths.wallpaper1__png);
		
		levelSetup();
		
		add(background);
		
		add(tilemapBricks);
		add(hud);

		FlxG.worldBounds.set(0, 0, tilemapBricks.width, tilemapBricks.height);
		
		player = new Player(100, 10);
		player.pixelPerfectPosition = false;
		
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
		FlxG.overlap(player.whip, groupGouhlfly, collideWhipGouhl);
	}
	
	function collideWhipGouhl(e:FlxSprite, w:FlxSprite) 
	{
		//e.kill();
		w.kill();
	}
	
	function collidePlayerGouhl(e:FlxSprite, p:Player)
	{
			e.kill();
			p.kill();
	}	

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		collisionDetect();
		FlxG.collide(player, tilemapBricks);
		
	}
	
	function checkPlayerState(){
		
	}
}	
