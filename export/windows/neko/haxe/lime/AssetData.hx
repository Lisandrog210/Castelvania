package lime;


import lime.utils.Assets;


class AssetData {

	private static var initialized:Bool = false;
	
	public static var library = new #if haxe3 Map <String, #else Hash <#end LibraryType> ();
	public static var path = new #if haxe3 Map <String, #else Hash <#end String> ();
	public static var type = new #if haxe3 Map <String, #else Hash <#end AssetType> ();	
	
	public static function initialize():Void {
		
		if (!initialized) {
			
			path.set ("assets/data/MAPA.oep", "assets/data/MAPA.oep");
			type.set ("assets/data/MAPA.oep", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/data/MapaTerminadoBien.oel", "assets/data/MapaTerminadoBien.oel");
			type.set ("assets/data/MapaTerminadoBien.oel", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/images/ataque del linyera.png", "assets/images/ataque del linyera.png");
			type.set ("assets/images/ataque del linyera.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/bala taco gorro.png", "assets/images/bala taco gorro.png");
			type.set ("assets/images/bala taco gorro.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/dinopianitoBestoBosso.png", "assets/images/dinopianitoBestoBosso.png");
			type.set ("assets/images/dinopianitoBestoBosso.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/enemigoGorroBolador.png", "assets/images/enemigoGorroBolador.png");
			type.set ("assets/images/enemigoGorroBolador.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/gouhl1.png", "assets/images/gouhl1.png");
			type.set ("assets/images/gouhl1.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/gouhl2.png", "assets/images/gouhl2.png");
			type.set ("assets/images/gouhl2.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/isis.png", "assets/images/isis.png");
			type.set ("assets/images/isis.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/kunai.png", "assets/images/kunai.png");
			type.set ("assets/images/kunai.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/lampara para el mapa.png", "assets/images/lampara para el mapa.png");
			type.set ("assets/images/lampara para el mapa.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/linyera.png", "assets/images/linyera.png");
			type.set ("assets/images/linyera.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/pinchos.png", "assets/images/pinchos.png");
			type.set ("assets/images/pinchos.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/PlataformaQueSemueve.png", "assets/images/PlataformaQueSemueve.png");
			type.set ("assets/images/PlataformaQueSemueve.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/player.png", "assets/images/player.png");
			type.set ("assets/images/player.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/player1.png", "assets/images/player1.png");
			type.set ("assets/images/player1.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/slave.png", "assets/images/slave.png");
			type.set ("assets/images/slave.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/tilemap.png", "assets/images/tilemap.png");
			type.set ("assets/images/tilemap.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/vidasJugador.png", "assets/images/vidasJugador.png");
			type.set ("assets/images/vidasJugador.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/whip.png", "assets/images/whip.png");
			type.set ("assets/images/whip.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/WiskiArrojadizo.png", "assets/images/WiskiArrojadizo.png");
			type.set ("assets/images/WiskiArrojadizo.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/music/music-goes-here.txt", "assets/music/music-goes-here.txt");
			type.set ("assets/music/music-goes-here.txt", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/sounds/sounds-go-here.txt", "assets/sounds/sounds-go-here.txt");
			type.set ("assets/sounds/sounds-go-here.txt", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("flixel/sounds/beep.ogg", "flixel/sounds/beep.ogg");
			type.set ("flixel/sounds/beep.ogg", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("flixel/sounds/flixel.ogg", "flixel/sounds/flixel.ogg");
			type.set ("flixel/sounds/flixel.ogg", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("flixel/fonts/nokiafc22.ttf", "flixel/fonts/nokiafc22.ttf");
			type.set ("flixel/fonts/nokiafc22.ttf", Reflect.field (AssetType, "font".toUpperCase ()));
			path.set ("flixel/fonts/monsterrat.ttf", "flixel/fonts/monsterrat.ttf");
			type.set ("flixel/fonts/monsterrat.ttf", Reflect.field (AssetType, "font".toUpperCase ()));
			path.set ("flixel/images/ui/button.png", "flixel/images/ui/button.png");
			type.set ("flixel/images/ui/button.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("flixel/images/logo/default.png", "flixel/images/logo/default.png");
			type.set ("flixel/images/logo/default.png", Reflect.field (AssetType, "image".toUpperCase ()));
			
			
			initialized = true;
			
		} //!initialized
		
	} //initialize
	
	
} //AssetData
