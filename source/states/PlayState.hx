package states;

import entities.Boss;
import entities.Linyera;
import entities.Isis;
import entities.Gorro;
import entities.GouhlFly;
import entities.Kunai;
import entities.Platform;
import entities.Reja;
import entities.Slave;
import entities.Trap;
import entities.Whip;
import entities.Reja;
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
	private var groupReja:FlxTypedGroup<Reja>;
	
	private static var _justDead:Bool = false;

	override public function create():Void
	{
		super.create();

		groupSlave = new FlxTypedGroup<Slave>();
		groupIsis = new FlxTypedGroup<Isis>();
		groupLinyera = new FlxTypedGroup<Linyera>();
		groupGorro = new FlxTypedGroup<Gorro>();
		groupTrap = new FlxTypedGroup<Trap>();
		groupPlatform = new FlxTypedGroup<Platform>();
		groupReja = new FlxTypedGroup<Reja>();
		
		
		hud = new FlxSprite(0, 0,AssetPaths.lifebar__png);
		hud.makeGraphic(256, 30, FlxColor.BLACK);
		hud.scrollFactor.set(0, 0);	
		
		levelSetup();		
		add(tilemap);
		add(hud);

		FlxG.worldBounds.set(0, 0, tilemap.width, tilemap.height);
		
		player = new Player(180, 700);
		player.pixelPerfectPosition = false;
		
		add(groupTrap);
		add(groupSlave);
		add(groupPlatform);
		add(groupLinyera);
		add(groupIsis);
		add(groupGorro);
		add(player);
		add(groupReja);
		cameraSetup();
		
		/*if (FlxG.sound.music == null)
		{
			FlxG.sound.playMusic(AssetPaths.Castlevania__wav, 1, true);
		}*/
		
		
	}

	function cameraSetup()
	{
		FlxG.camera.follow(player);
	}

	function levelSetup()
	{
		loader = new FlxOgmoLoader(AssetPaths.lvl1__oel);
		
		tilemap = loader.loadTilemap(AssetPaths.tilemap__png,32,32,"walls");
		tilemap.setTileProperties(0, FlxObject.NONE);
		tilemap.setTileProperties(5, FlxObject.NONE);
		
		
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
				var trap1:Trap = new Trap(x, y+22, AssetPaths.pinchos__png);				
				groupTrap.add(trap1);
			case "Boss":
				var boss1:Boss = new Boss(x, y, AssetPaths.boss__png);
				add(boss1);
			case "Reja":
				var Reja1:Reja = new Reja(x, y, AssetPaths.PlataformaInest__png);
				groupReja.add(Reja1);
			
		}
	}
	
	function collisionDetect()
	{
		//Colisiones gorros
		FlxG.overlap(player, groupGorro, collidePlayerGorro);
		FlxG.overlap(player.whip, groupGorro, collideWhipGorro);
		FlxG.overlap(player.kunai, groupGorro, collideKunaiGorro);
		FlxG.overlap(player.whisky, groupGorro, collideWhiskyGorro);
		//Colisiones isis
		FlxG.overlap(player, groupIsis, collidePlayerIsis);
		FlxG.overlap(player.whisky, groupIsis, collideWhiskyIsis);
		FlxG.overlap(player.whip, groupIsis, collideWhipIsis);
		FlxG.overlap(player.kunai, groupIsis, collideKunaiIsis);
		//Colisiones linyera
		FlxG.overlap(player, groupLinyera, collidePlayerLinyera);
		FlxG.overlap(player.whisky, groupLinyera, collideWhiskyLinyera);
		FlxG.overlap(player.whip, groupLinyera, collideWhipLinyera);
		FlxG.overlap(player.kunai, groupLinyera, collideKunaiLinyera);
		//Colisiones slave
		FlxG.overlap(player, groupSlave, collidePlayerSlave);
		FlxG.overlap(player.whisky, groupSlave, collideWhiskySlave);
		FlxG.overlap(player.whip, groupSlave, collideWhipSlave);
		FlxG.overlap(player.kunai, groupSlave, collideKunaiSlave);
		//Colision Reja
		FlxG.overlap(player.whip, groupReja, collideWhipReja);
		
		FlxG.collide(player, groupReja);
		FlxG.collide(player, groupPlatform);
		FlxG.overlap(player, groupTrap, collidePlayerTrap);
	}
	
	function collideWhipReja(e: FlxSprite, w:FlxSprite) 
	{
		w.kill();
	}
	
	function collideWhiskyGorro(e:FlxSprite, w:FlxSprite) 
	{
		w.kill();
	}
	
	function collideWhiskyIsis(e:FlxSprite, w:FlxSprite) 
	{
		w.kill();
	}
	
	function collideWhiskyLinyera(e:FlxSprite, w:FlxSprite) 
	{
		w.kill();
	}
	
	function collideWhiskySlave(e:FlxSprite, w:FlxSprite) 
	{
		w.kill();
	}
	
	function collidePlayerTrap(t:Trap,p:Player) 
	{
		t.kill();
	}
	
	function collideKunaiSlave(e:FlxSprite, w:FlxSprite) 
	{
		w.kill();
	}
	
	function collideWhipSlave(e:FlxSprite, w:FlxSprite) 
	{
		w.kill();
	}
	
	function collidePlayerSlave(e:FlxSprite, p:Player)
	{
		e.kill();
		p.kill();
	}	
	
	function collideKunaiLinyera(e:FlxSprite, w:FlxSprite) 
	{
		w.kill();
	}
	
	function collideWhipLinyera(e:FlxSprite, w:FlxSprite) 
	{
		w.kill();
	}
	
	function collidePlayerLinyera(e:FlxSprite, p:Player)
	{
		e.kill();
		p.kill();
	}
	
	function collideKunaiIsis(e:FlxSprite, w:FlxSprite) 
	{
		w.kill();
	}
	
	function collideWhipIsis(e:FlxSprite, w:FlxSprite) 
	{
		w.kill();
	}
	
	function collidePlayerIsis(e:FlxSprite, p:Player)
	{
		e.kill();
		p.kill();
	}	
	
	function collideWhipGorro(e:FlxSprite, w:FlxSprite) 
	{
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
		FlxG.collide(groupTrap, tilemap);
		FlxG.collide(groupSlave, tilemap);
		FlxG.collide(groupGorro, tilemap);
		FlxG.collide(groupIsis, tilemap);
		FlxG.collide(groupPlatform, tilemap);
		FlxG.collide(groupLinyera, tilemap);
		FlxG.collide(groupReja, tilemap);
		
		if (player.alive == false)
		{
			_justDead = true;
			FlxG.resetState();
		}
	}
}	
