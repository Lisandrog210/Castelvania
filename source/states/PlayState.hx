package states;

import entities.Gorro;
import entities.GouhlFly;
import entities.Kunai;
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
	
	private var tilemap:FlxTilemap;
	private var groupGouhlfly:FlxTypedGroup<GouhlFly>;
		
	override public function create():Void
	{
		super.create();

		groupGouhlfly = new FlxTypedGroup<GouhlFly>();
		hud = new FlxSprite(0, 0);
		hud.makeGraphic(256, 30, FlxColor.BLACK);
		hud.scrollFactor.set(0, 0);	
		
		levelSetup();		
		add(tilemap);
		add(hud);

		FlxG.worldBounds.set(0, 0, tilemap.width, tilemap.height);
		
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
		loader = new FlxOgmoLoader(AssetPaths.MapaTerminadoBien__oel);

		tilemap = loader.loadTilemap(AssetPaths.tilemap__png,32,32,"walls");
		tilemap.setTileProperties(0, FlxObject.NONE);
		tilemap.setTileProperties(9, FlxObject.NONE);
		

		loader.loadEntities(entityCreator, "entities");

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
				
			case "Gorro":
				var gorro1:Gorro = new Gorro(x,y, AssetPaths.

		}
	}
	
	function collisionDetect()
	{
		
		FlxG.overlap(player, groupGouhlfly, collidePlayerGouhl);
		FlxG.overlap(player.whip, groupGouhlfly, collideWhipGouhl);
		FlxG.overlap(player.kunai, groupGouhlfly, collideKunaiGouhl);
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
	function collideKunaiGouhl(e:FlxSprite, k:Kunai)
	{
		e.kill();
		k.kill();
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		collisionDetect();
		FlxG.collide(player, tilemap);
		
	}
	
	function checkPlayerState(){
		
	}
}	
