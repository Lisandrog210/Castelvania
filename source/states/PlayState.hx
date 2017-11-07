package states;

import entities.Linyera;
import entities.Isis;
import entities.Gorro;
import entities.GouhlFly;
import entities.Kunai;
import entities.Platform;
import entities.Slave;
import entities.Trap;
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
	private var groupGorro:FlxTypedGroup<Gorro>;
	private var groupSlave:FlxTypedGroup<Slave>;
	private var groupIsis:FlxTypedGroup<Isis>;
	private var groupLinyera:FlxTypedGroup<Linyera>;
	private var groupTrap:FlxTypedGroup<Trap>;
	private var groupPlatform:FlxTypedGroup<Platform>;

		
	override public function create():Void
	{
		super.create();
		
		groupSlave = new FlxTypedGroup<Slave>();
		groupIsis = new FlxTypedGroup<Isis>();
		groupLinyera = new FlxTypedGroup<Linyera>();
		groupGorro = new FlxTypedGroup<Gorro>();
		groupTrap = new FlxTypedGroup<Trap>();
		groupPlatform = new FlxTypedGroup<Platform>();
		
		
		hud = new FlxSprite(0, 0);
		hud.makeGraphic(256, 30, FlxColor.BLACK);
		hud.scrollFactor.set(0, 0);	
		
		levelSetup();		
		add(tilemap);
		add(hud);

		FlxG.worldBounds.set(0, 0, tilemap.width, tilemap.height);
		
		player = new Player(100, 10);
		player.pixelPerfectPosition = false;
		
		add(groupTrap);
		add(groupSlave);
		add(groupPlatform);
		add(groupLinyera);
		add(groupIsis);
		add(groupGorro);
		add(player);
		cameraSetup();
		enemiesAtacks();
	}
	
	function enemiesAtacks() 
	{
		//gorroChase();
	}
	
	/*function gorroChase() 
	{
		if (gorro1) 
		{
			
		}
	}*/

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
			case "Gorro":
				var gorro1:Gorro = new Gorro(x, y, AssetPaths.gorro__png);
				groupGorro.add(gorro1);
			case "EnemigoNegro":
				var slave1:Slave = new Slave(x, y, AssetPaths.slave__png);
				groupSlave.add(slave1);
			case "Linyera":
				var linyera1:Linyera = new Linyera(x, y, AssetPaths.linyera__png);
				groupLinyera.add(linyera1);
			case "Musulman":
				var isis1:Isis = new Isis(x, y, AssetPaths.isis__png);
				groupIsis.add(isis1);
			case "Plataforma":
				var platform1:Platform = new Platform(x, y, AssetPaths.platform__png);
				groupPlatform.add(platform1);
			case "Pinchos":
				var trap1:Trap = new Trap(x, y, AssetPaths.trap__png);
				groupTrap.add(trap1);

		}
	}
	
	function collisionDetect()
	{
		
		FlxG.overlap(player, groupGorro, collidePlayerGorro);
		FlxG.overlap(player.whip, groupGorro, collideWhipGorro);
		FlxG.overlap(player.kunai, groupGorro, collideKunaiGorro);
	}
	
	function collideWhipGorro(e:FlxSprite, w:FlxSprite) 
	{
		//e.kill();
		w.kill();
	}
	
	function collidePlayerGorro(e:FlxSprite, p:Player)
	{
			e.kill();
			p.kill();
	}	
	function collideKunaiGorro(e:FlxSprite, k:Kunai)
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
