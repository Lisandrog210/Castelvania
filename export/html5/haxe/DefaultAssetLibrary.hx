package;


import haxe.Timer;
import haxe.Unserializer;
import lime.app.Future;
import lime.app.Preloader;
import lime.app.Promise;
import lime.audio.AudioSource;
import lime.audio.openal.AL;
import lime.audio.AudioBuffer;
import lime.graphics.Image;
import lime.net.HTTPRequest;
import lime.system.CFFI;
import lime.text.Font;
import lime.utils.Bytes;
import lime.utils.UInt8Array;
import lime.Assets;

#if sys
import sys.FileSystem;
#end

#if flash
import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.Loader;
import flash.events.Event;
import flash.events.IOErrorEvent;
import flash.events.ProgressEvent;
import flash.media.Sound;
import flash.net.URLLoader;
import flash.net.URLRequest;
#end


class DefaultAssetLibrary extends AssetLibrary {
	
	
	public var className (default, null) = new Map <String, Dynamic> ();
	public var path (default, null) = new Map <String, String> ();
	public var type (default, null) = new Map <String, AssetType> ();
	
	private var lastModified:Float;
	private var timer:Timer;
	
	
	public function new () {
		
		super ();
		
		#if (openfl && !flash)
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		openfl.text.Font.registerFont (__ASSET__OPENFL__flixel_fonts_nokiafc22_ttf);
		openfl.text.Font.registerFont (__ASSET__OPENFL__flixel_fonts_monsterrat_ttf);
		
		
		
		#end
		
		#if flash
		
		className.set ("assets/data/lvl1.oel", __ASSET__assets_data_lvl1_oel);
		type.set ("assets/data/lvl1.oel", AssetType.TEXT);
		className.set ("assets/data/MAPA.oep", __ASSET__assets_data_mapa_oep);
		type.set ("assets/data/MAPA.oep", AssetType.TEXT);
		className.set ("assets/data/MapaTerminadoBien.oel", __ASSET__assets_data_mapaterminadobien_oel);
		type.set ("assets/data/MapaTerminadoBien.oel", AssetType.TEXT);
		className.set ("assets/images/boss.png", __ASSET__assets_images_boss_png);
		type.set ("assets/images/boss.png", AssetType.IMAGE);
		className.set ("assets/images/bulletGorro.png", __ASSET__assets_images_bulletgorro_png);
		type.set ("assets/images/bulletGorro.png", AssetType.IMAGE);
		className.set ("assets/images/EnemiesMusulman.png", __ASSET__assets_images_enemiesmusulman_png);
		type.set ("assets/images/EnemiesMusulman.png", AssetType.IMAGE);
		className.set ("assets/images/EnemigoNegro.png", __ASSET__assets_images_enemigonegro_png);
		type.set ("assets/images/EnemigoNegro.png", AssetType.IMAGE);
		className.set ("assets/images/explosion.png", __ASSET__assets_images_explosion_png);
		type.set ("assets/images/explosion.png", AssetType.IMAGE);
		className.set ("assets/images/gorro.png", __ASSET__assets_images_gorro_png);
		type.set ("assets/images/gorro.png", AssetType.IMAGE);
		className.set ("assets/images/gouhl1.png", __ASSET__assets_images_gouhl1_png);
		type.set ("assets/images/gouhl1.png", AssetType.IMAGE);
		className.set ("assets/images/gouhl2.png", __ASSET__assets_images_gouhl2_png);
		type.set ("assets/images/gouhl2.png", AssetType.IMAGE);
		className.set ("assets/images/isis.png", __ASSET__assets_images_isis_png);
		type.set ("assets/images/isis.png", AssetType.IMAGE);
		className.set ("assets/images/kunai.png", __ASSET__assets_images_kunai_png);
		type.set ("assets/images/kunai.png", AssetType.IMAGE);
		className.set ("assets/images/lamp.png", __ASSET__assets_images_lamp_png);
		type.set ("assets/images/lamp.png", AssetType.IMAGE);
		className.set ("assets/images/Lingera.png", __ASSET__assets_images_lingera_png);
		type.set ("assets/images/Lingera.png", AssetType.IMAGE);
		className.set ("assets/images/linyera.png", __ASSET__assets_images_linyera_png);
		type.set ("assets/images/linyera.png", AssetType.IMAGE);
		className.set ("assets/images/PlataformaInest.png", __ASSET__assets_images_plataformainest_png);
		type.set ("assets/images/PlataformaInest.png", AssetType.IMAGE);
		className.set ("assets/images/platform.png", __ASSET__assets_images_platform_png);
		type.set ("assets/images/platform.png", AssetType.IMAGE);
		className.set ("assets/images/player.png", __ASSET__assets_images_player_png);
		type.set ("assets/images/player.png", AssetType.IMAGE);
		className.set ("assets/images/player1.png", __ASSET__assets_images_player1_png);
		type.set ("assets/images/player1.png", AssetType.IMAGE);
		className.set ("assets/images/rockLinyera.png", __ASSET__assets_images_rocklinyera_png);
		type.set ("assets/images/rockLinyera.png", AssetType.IMAGE);
		className.set ("assets/images/slave.png", __ASSET__assets_images_slave_png);
		type.set ("assets/images/slave.png", AssetType.IMAGE);
		className.set ("assets/images/tilemap.png", __ASSET__assets_images_tilemap_png);
		type.set ("assets/images/tilemap.png", AssetType.IMAGE);
		className.set ("assets/images/trap.png", __ASSET__assets_images_trap_png);
		type.set ("assets/images/trap.png", AssetType.IMAGE);
		className.set ("assets/images/vidasJugador.png", __ASSET__assets_images_vidasjugador_png);
		type.set ("assets/images/vidasJugador.png", AssetType.IMAGE);
		className.set ("assets/images/whip.png", __ASSET__assets_images_whip_png);
		type.set ("assets/images/whip.png", AssetType.IMAGE);
		className.set ("assets/images/whisky.png", __ASSET__assets_images_whisky_png);
		type.set ("assets/images/whisky.png", AssetType.IMAGE);
		className.set ("assets/music/Castlevania.wav", __ASSET__assets_music_castlevania_wav);
		type.set ("assets/music/Castlevania.wav", AssetType.SOUND);
		className.set ("assets/music/music-goes-here.txt", __ASSET__assets_music_music_goes_here_txt);
		type.set ("assets/music/music-goes-here.txt", AssetType.TEXT);
		className.set ("assets/sounds/sounds-go-here.txt", __ASSET__assets_sounds_sounds_go_here_txt);
		type.set ("assets/sounds/sounds-go-here.txt", AssetType.TEXT);
		className.set ("flixel/sounds/beep.ogg", __ASSET__flixel_sounds_beep_ogg);
		type.set ("flixel/sounds/beep.ogg", AssetType.SOUND);
		className.set ("flixel/sounds/flixel.ogg", __ASSET__flixel_sounds_flixel_ogg);
		type.set ("flixel/sounds/flixel.ogg", AssetType.SOUND);
		className.set ("flixel/fonts/nokiafc22.ttf", __ASSET__flixel_fonts_nokiafc22_ttf);
		type.set ("flixel/fonts/nokiafc22.ttf", AssetType.FONT);
		className.set ("flixel/fonts/monsterrat.ttf", __ASSET__flixel_fonts_monsterrat_ttf);
		type.set ("flixel/fonts/monsterrat.ttf", AssetType.FONT);
		className.set ("flixel/images/ui/button.png", __ASSET__flixel_images_ui_button_png);
		type.set ("flixel/images/ui/button.png", AssetType.IMAGE);
		className.set ("flixel/images/logo/default.png", __ASSET__flixel_images_logo_default_png);
		type.set ("flixel/images/logo/default.png", AssetType.IMAGE);
		
		
		#elseif html5
		
		var id;
		id = "assets/data/lvl1.oel";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/data/MAPA.oep";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/data/MapaTerminadoBien.oel";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/images/boss.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/bulletGorro.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/EnemiesMusulman.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/EnemigoNegro.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/explosion.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/gorro.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/gouhl1.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/gouhl2.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/isis.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/kunai.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/lamp.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Lingera.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/linyera.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/PlataformaInest.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/platform.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/player.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/player1.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/rockLinyera.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/slave.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/tilemap.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/trap.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/vidasJugador.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/whip.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/whisky.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/music/Castlevania.wav";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "assets/music/music-goes-here.txt";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/sounds/sounds-go-here.txt";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "flixel/sounds/beep.ogg";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "flixel/sounds/flixel.ogg";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "flixel/fonts/nokiafc22.ttf";
		className.set (id, __ASSET__flixel_fonts_nokiafc22_ttf);
		
		type.set (id, AssetType.FONT);
		id = "flixel/fonts/monsterrat.ttf";
		className.set (id, __ASSET__flixel_fonts_monsterrat_ttf);
		
		type.set (id, AssetType.FONT);
		id = "flixel/images/ui/button.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "flixel/images/logo/default.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		
		
		var assetsPrefix = null;
		if (ApplicationMain.config != null && Reflect.hasField (ApplicationMain.config, "assetsPrefix")) {
			assetsPrefix = ApplicationMain.config.assetsPrefix;
		}
		if (assetsPrefix != null) {
			for (k in path.keys()) {
				path.set(k, assetsPrefix + path[k]);
			}
		}
		
		#else
		
		#if (windows || mac || linux)
		
		var useManifest = false;
		
		className.set ("assets/data/lvl1.oel", __ASSET__assets_data_lvl1_oel);
		type.set ("assets/data/lvl1.oel", AssetType.TEXT);
		
		className.set ("assets/data/MAPA.oep", __ASSET__assets_data_mapa_oep);
		type.set ("assets/data/MAPA.oep", AssetType.TEXT);
		
		className.set ("assets/data/MapaTerminadoBien.oel", __ASSET__assets_data_mapaterminadobien_oel);
		type.set ("assets/data/MapaTerminadoBien.oel", AssetType.TEXT);
		
		className.set ("assets/images/boss.png", __ASSET__assets_images_boss_png);
		type.set ("assets/images/boss.png", AssetType.IMAGE);
		
		className.set ("assets/images/bulletGorro.png", __ASSET__assets_images_bulletgorro_png);
		type.set ("assets/images/bulletGorro.png", AssetType.IMAGE);
		
		className.set ("assets/images/EnemiesMusulman.png", __ASSET__assets_images_enemiesmusulman_png);
		type.set ("assets/images/EnemiesMusulman.png", AssetType.IMAGE);
		
		className.set ("assets/images/EnemigoNegro.png", __ASSET__assets_images_enemigonegro_png);
		type.set ("assets/images/EnemigoNegro.png", AssetType.IMAGE);
		
		className.set ("assets/images/explosion.png", __ASSET__assets_images_explosion_png);
		type.set ("assets/images/explosion.png", AssetType.IMAGE);
		
		className.set ("assets/images/gorro.png", __ASSET__assets_images_gorro_png);
		type.set ("assets/images/gorro.png", AssetType.IMAGE);
		
		className.set ("assets/images/gouhl1.png", __ASSET__assets_images_gouhl1_png);
		type.set ("assets/images/gouhl1.png", AssetType.IMAGE);
		
		className.set ("assets/images/gouhl2.png", __ASSET__assets_images_gouhl2_png);
		type.set ("assets/images/gouhl2.png", AssetType.IMAGE);
		
		className.set ("assets/images/isis.png", __ASSET__assets_images_isis_png);
		type.set ("assets/images/isis.png", AssetType.IMAGE);
		
		className.set ("assets/images/kunai.png", __ASSET__assets_images_kunai_png);
		type.set ("assets/images/kunai.png", AssetType.IMAGE);
		
		className.set ("assets/images/lamp.png", __ASSET__assets_images_lamp_png);
		type.set ("assets/images/lamp.png", AssetType.IMAGE);
		
		className.set ("assets/images/Lingera.png", __ASSET__assets_images_lingera_png);
		type.set ("assets/images/Lingera.png", AssetType.IMAGE);
		
		className.set ("assets/images/linyera.png", __ASSET__assets_images_linyera_png);
		type.set ("assets/images/linyera.png", AssetType.IMAGE);
		
		className.set ("assets/images/PlataformaInest.png", __ASSET__assets_images_plataformainest_png);
		type.set ("assets/images/PlataformaInest.png", AssetType.IMAGE);
		
		className.set ("assets/images/platform.png", __ASSET__assets_images_platform_png);
		type.set ("assets/images/platform.png", AssetType.IMAGE);
		
		className.set ("assets/images/player.png", __ASSET__assets_images_player_png);
		type.set ("assets/images/player.png", AssetType.IMAGE);
		
		className.set ("assets/images/player1.png", __ASSET__assets_images_player1_png);
		type.set ("assets/images/player1.png", AssetType.IMAGE);
		
		className.set ("assets/images/rockLinyera.png", __ASSET__assets_images_rocklinyera_png);
		type.set ("assets/images/rockLinyera.png", AssetType.IMAGE);
		
		className.set ("assets/images/slave.png", __ASSET__assets_images_slave_png);
		type.set ("assets/images/slave.png", AssetType.IMAGE);
		
		className.set ("assets/images/tilemap.png", __ASSET__assets_images_tilemap_png);
		type.set ("assets/images/tilemap.png", AssetType.IMAGE);
		
		className.set ("assets/images/trap.png", __ASSET__assets_images_trap_png);
		type.set ("assets/images/trap.png", AssetType.IMAGE);
		
		className.set ("assets/images/vidasJugador.png", __ASSET__assets_images_vidasjugador_png);
		type.set ("assets/images/vidasJugador.png", AssetType.IMAGE);
		
		className.set ("assets/images/whip.png", __ASSET__assets_images_whip_png);
		type.set ("assets/images/whip.png", AssetType.IMAGE);
		
		className.set ("assets/images/whisky.png", __ASSET__assets_images_whisky_png);
		type.set ("assets/images/whisky.png", AssetType.IMAGE);
		
		className.set ("assets/music/Castlevania.wav", __ASSET__assets_music_castlevania_wav);
		type.set ("assets/music/Castlevania.wav", AssetType.SOUND);
		
		className.set ("assets/music/music-goes-here.txt", __ASSET__assets_music_music_goes_here_txt);
		type.set ("assets/music/music-goes-here.txt", AssetType.TEXT);
		
		className.set ("assets/sounds/sounds-go-here.txt", __ASSET__assets_sounds_sounds_go_here_txt);
		type.set ("assets/sounds/sounds-go-here.txt", AssetType.TEXT);
		
		className.set ("flixel/sounds/beep.ogg", __ASSET__flixel_sounds_beep_ogg);
		type.set ("flixel/sounds/beep.ogg", AssetType.SOUND);
		
		className.set ("flixel/sounds/flixel.ogg", __ASSET__flixel_sounds_flixel_ogg);
		type.set ("flixel/sounds/flixel.ogg", AssetType.SOUND);
		
		className.set ("flixel/fonts/nokiafc22.ttf", __ASSET__flixel_fonts_nokiafc22_ttf);
		type.set ("flixel/fonts/nokiafc22.ttf", AssetType.FONT);
		
		className.set ("flixel/fonts/monsterrat.ttf", __ASSET__flixel_fonts_monsterrat_ttf);
		type.set ("flixel/fonts/monsterrat.ttf", AssetType.FONT);
		
		className.set ("flixel/images/ui/button.png", __ASSET__flixel_images_ui_button_png);
		type.set ("flixel/images/ui/button.png", AssetType.IMAGE);
		
		className.set ("flixel/images/logo/default.png", __ASSET__flixel_images_logo_default_png);
		type.set ("flixel/images/logo/default.png", AssetType.IMAGE);
		
		
		if (useManifest) {
			
			loadManifest ();
			
			if (Sys.args ().indexOf ("-livereload") > -1) {
				
				var path = FileSystem.fullPath ("manifest");
				lastModified = FileSystem.stat (path).mtime.getTime ();
				
				timer = new Timer (2000);
				timer.run = function () {
					
					var modified = FileSystem.stat (path).mtime.getTime ();
					
					if (modified > lastModified) {
						
						lastModified = modified;
						loadManifest ();
						
						onChange.dispatch ();
						
					}
					
				}
				
			}
			
		}
		
		#else
		
		loadManifest ();
		
		#end
		#end
		
	}
	
	
	public override function exists (id:String, type:String):Bool {
		
		var requestedType = type != null ? cast (type, AssetType) : null;
		var assetType = this.type.get (id);
		
		if (assetType != null) {
			
			if (assetType == requestedType || ((requestedType == SOUND || requestedType == MUSIC) && (assetType == MUSIC || assetType == SOUND))) {
				
				return true;
				
			}
			
			#if flash
			
			if (requestedType == BINARY && (assetType == BINARY || assetType == TEXT || assetType == IMAGE)) {
				
				return true;
				
			} else if (requestedType == TEXT && assetType == BINARY) {
				
				return true;
				
			} else if (requestedType == null || path.exists (id)) {
				
				return true;
				
			}
			
			#else
			
			if (requestedType == BINARY || requestedType == null || (assetType == BINARY && requestedType == TEXT)) {
				
				return true;
				
			}
			
			#end
			
		}
		
		return false;
		
	}
	
	
	public override function getAudioBuffer (id:String):AudioBuffer {
		
		#if flash
		
		var buffer = new AudioBuffer ();
		buffer.src = cast (Type.createInstance (className.get (id), []), Sound);
		return buffer;
		
		#elseif html5
		
		return null;
		//return new Sound (new URLRequest (path.get (id)));
		
		#else
		
		if (className.exists(id)) return AudioBuffer.fromBytes (cast (Type.createInstance (className.get (id), []), Bytes));
		else return AudioBuffer.fromFile (path.get (id));
		
		#end
		
	}
	
	
	public override function getBytes (id:String):Bytes {
		
		#if flash
		
		switch (type.get (id)) {
			
			case TEXT, BINARY:
				
				return Bytes.ofData (cast (Type.createInstance (className.get (id), []), flash.utils.ByteArray));
			
			case IMAGE:
				
				var bitmapData = cast (Type.createInstance (className.get (id), []), BitmapData);
				return Bytes.ofData (bitmapData.getPixels (bitmapData.rect));
			
			default:
				
				return null;
			
		}
		
		return cast (Type.createInstance (className.get (id), []), Bytes);
		
		#elseif html5
		
		var loader = Preloader.loaders.get (path.get (id));
		
		if (loader == null) {
			
			return null;
			
		}
		
		var bytes = loader.bytes;
		
		if (bytes != null) {
			
			return bytes;
			
		} else {
			
			return null;
		}
		
		#else
		
		if (className.exists(id)) return cast (Type.createInstance (className.get (id), []), Bytes);
		else return Bytes.readFile (path.get (id));
		
		#end
		
	}
	
	
	public override function getFont (id:String):Font {
		
		#if flash
		
		var src = Type.createInstance (className.get (id), []);
		
		var font = new Font (src.fontName);
		font.src = src;
		return font;
		
		#elseif html5
		
		return cast (Type.createInstance (className.get (id), []), Font);
		
		#else
		
		if (className.exists (id)) {
			
			var fontClass = className.get (id);
			return cast (Type.createInstance (fontClass, []), Font);
			
		} else {
			
			return Font.fromFile (path.get (id));
			
		}
		
		#end
		
	}
	
	
	public override function getImage (id:String):Image {
		
		#if flash
		
		return Image.fromBitmapData (cast (Type.createInstance (className.get (id), []), BitmapData));
		
		#elseif html5
		
		return Image.fromImageElement (Preloader.images.get (path.get (id)));
		
		#else
		
		if (className.exists (id)) {
			
			var fontClass = className.get (id);
			return cast (Type.createInstance (fontClass, []), Image);
			
		} else {
			
			return Image.fromFile (path.get (id));
			
		}
		
		#end
		
	}
	
	
	/*public override function getMusic (id:String):Dynamic {
		
		#if flash
		
		return cast (Type.createInstance (className.get (id), []), Sound);
		
		#elseif openfl_html5
		
		//var sound = new Sound ();
		//sound.__buffer = true;
		//sound.load (new URLRequest (path.get (id)));
		//return sound;
		return null;
		
		#elseif html5
		
		return null;
		//return new Sound (new URLRequest (path.get (id)));
		
		#else
		
		return null;
		//if (className.exists(id)) return cast (Type.createInstance (className.get (id), []), Sound);
		//else return new Sound (new URLRequest (path.get (id)), null, true);
		
		#end
		
	}*/
	
	
	public override function getPath (id:String):String {
		
		//#if ios
		
		//return SystemPath.applicationDirectory + "/assets/" + path.get (id);
		
		//#else
		
		return path.get (id);
		
		//#end
		
	}
	
	
	public override function getText (id:String):String {
		
		#if html5
		
		var loader = Preloader.loaders.get (path.get (id));
		
		if (loader == null) {
			
			return null;
			
		}
		
		var bytes = loader.bytes;
		
		if (bytes != null) {
			
			return bytes.getString (0, bytes.length);
			
		} else {
			
			return null;
		}
		
		#else
		
		var bytes = getBytes (id);
		
		if (bytes == null) {
			
			return null;
			
		} else {
			
			return bytes.getString (0, bytes.length);
			
		}
		
		#end
		
	}
	
	
	public override function isLocal (id:String, type:String):Bool {
		
		var requestedType = type != null ? cast (type, AssetType) : null;
		
		#if flash
		
		//if (requestedType != AssetType.MUSIC && requestedType != AssetType.SOUND) {
			
			return className.exists (id);
			
		//}
		
		#end
		
		return true;
		
	}
	
	
	public override function list (type:String):Array<String> {
		
		var requestedType = type != null ? cast (type, AssetType) : null;
		var items = [];
		
		for (id in this.type.keys ()) {
			
			if (requestedType == null || exists (id, type)) {
				
				items.push (id);
				
			}
			
		}
		
		return items;
		
	}
	
	
	public override function loadAudioBuffer (id:String):Future<AudioBuffer> {
		
		var promise = new Promise<AudioBuffer> ();
		
		#if (flash)
		
		if (path.exists (id)) {
			
			var soundLoader = new Sound ();
			soundLoader.addEventListener (Event.COMPLETE, function (event) {
				
				var audioBuffer:AudioBuffer = new AudioBuffer();
				audioBuffer.src = event.currentTarget;
				promise.complete (audioBuffer);
				
			});
			soundLoader.addEventListener (ProgressEvent.PROGRESS, function (event) {
				
				if (event.bytesTotal == 0) {
					
					promise.progress (0);
					
				} else {
					
					promise.progress (event.bytesLoaded / event.bytesTotal);
					
				}
				
			});
			soundLoader.addEventListener (IOErrorEvent.IO_ERROR, promise.error);
			soundLoader.load (new URLRequest (path.get (id)));
			
		} else {
			
			promise.complete (getAudioBuffer (id));
			
		}
		
		#else
		
		promise.completeWith (new Future<AudioBuffer> (function () return getAudioBuffer (id)));
		
		#end
		
		return promise.future;
		
	}
	
	
	public override function loadBytes (id:String):Future<Bytes> {
		
		var promise = new Promise<Bytes> ();
		
		#if flash
		
		if (path.exists (id)) {
			
			var loader = new URLLoader ();
			loader.dataFormat = flash.net.URLLoaderDataFormat.BINARY;
			loader.addEventListener (Event.COMPLETE, function (event:Event) {
				
				var bytes = Bytes.ofData (event.currentTarget.data);
				promise.complete (bytes);
				
			});
			loader.addEventListener (ProgressEvent.PROGRESS, function (event) {
				
				if (event.bytesTotal == 0) {
					
					promise.progress (0);
					
				} else {
					
					promise.progress (event.bytesLoaded / event.bytesTotal);
					
				}
				
			});
			loader.addEventListener (IOErrorEvent.IO_ERROR, promise.error);
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			promise.complete (getBytes (id));
			
		}
		
		#elseif html5
		
		if (path.exists (id)) {
			
			var request = new HTTPRequest ();
			promise.completeWith (request.load (path.get (id) + "?" + Assets.cache.version));
			
		} else {
			
			promise.complete (getBytes (id));
			
		}
		
		#else
		
		promise.completeWith (new Future<Bytes> (function () return getBytes (id)));
		
		#end
		
		return promise.future;
		
	}
	
	
	public override function loadImage (id:String):Future<Image> {
		
		var promise = new Promise<Image> ();
		
		#if flash
		
		if (path.exists (id)) {
			
			var loader = new Loader ();
			loader.contentLoaderInfo.addEventListener (Event.COMPLETE, function (event:Event) {
				
				var bitmapData = cast (event.currentTarget.content, Bitmap).bitmapData;
				promise.complete (Image.fromBitmapData (bitmapData));
				
			});
			loader.contentLoaderInfo.addEventListener (ProgressEvent.PROGRESS, function (event) {
				
				if (event.bytesTotal == 0) {
					
					promise.progress (0);
					
				} else {
					
					promise.progress (event.bytesLoaded / event.bytesTotal);
					
				}
				
			});
			loader.contentLoaderInfo.addEventListener (IOErrorEvent.IO_ERROR, promise.error);
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			promise.complete (getImage (id));
			
		}
		
		#elseif html5
		
		if (path.exists (id)) {
			
			var image = new js.html.Image ();
			image.onload = function (_):Void {
				
				promise.complete (Image.fromImageElement (image));
				
			}
			image.onerror = promise.error;
			image.src = path.get (id) + "?" + Assets.cache.version;
			
		} else {
			
			promise.complete (getImage (id));
			
		}
		
		#else
		
		promise.completeWith (new Future<Image> (function () return getImage (id)));
		
		#end
		
		return promise.future;
		
	}
	
	
	#if (!flash && !html5)
	private function loadManifest ():Void {
		
		try {
			
			#if blackberry
			var bytes = Bytes.readFile ("app/native/manifest");
			#elseif tizen
			var bytes = Bytes.readFile ("../res/manifest");
			#elseif emscripten
			var bytes = Bytes.readFile ("assets/manifest");
			#elseif (mac && java)
			var bytes = Bytes.readFile ("../Resources/manifest");
			#elseif (ios || tvos)
			var bytes = Bytes.readFile ("assets/manifest");
			#else
			var bytes = Bytes.readFile ("manifest");
			#end
			
			if (bytes != null) {
				
				if (bytes.length > 0) {
					
					var data = bytes.getString (0, bytes.length);
					
					if (data != null && data.length > 0) {
						
						var manifest:Array<Dynamic> = Unserializer.run (data);
						
						for (asset in manifest) {
							
							if (!className.exists (asset.id)) {
								
								#if (ios || tvos)
								path.set (asset.id, "assets/" + asset.path);
								#else
								path.set (asset.id, asset.path);
								#end
								type.set (asset.id, cast (asset.type, AssetType));
								
							}
							
						}
						
					}
					
				}
				
			} else {
				
				trace ("Warning: Could not load asset manifest (bytes was null)");
				
			}
		
		} catch (e:Dynamic) {
			
			trace ('Warning: Could not load asset manifest (${e})');
			
		}
		
	}
	#end
	
	
	public override function loadText (id:String):Future<String> {
		
		var promise = new Promise<String> ();
		
		#if html5
		
		if (path.exists (id)) {
			
			var request = new HTTPRequest ();
			var future = request.load (path.get (id) + "?" + Assets.cache.version);
			future.onProgress (function (progress) promise.progress (progress));
			future.onError (function (msg) promise.error (msg));
			future.onComplete (function (bytes) promise.complete (bytes.getString (0, bytes.length)));
			
		} else {
			
			promise.complete (getText (id));
			
		}
		
		#else
		
		promise.completeWith (loadBytes (id).then (function (bytes) {
			
			return new Future<String> (function () {
				
				if (bytes == null) {
					
					return null;
					
				} else {
					
					return bytes.getString (0, bytes.length);
					
				}
				
			});
			
		}));
		
		#end
		
		return promise.future;
		
	}
	
	
}


#if !display
#if flash

@:keep @:bind #if display private #end class __ASSET__assets_data_lvl1_oel extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_data_mapa_oep extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_data_mapaterminadobien_oel extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_images_boss_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_bulletgorro_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_enemiesmusulman_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_enemigonegro_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_explosion_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_gorro_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_gouhl1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_gouhl2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_isis_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_kunai_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_lamp_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_lingera_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_linyera_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_plataformainest_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_platform_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_player_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_player1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_rocklinyera_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_slave_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_tilemap_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_trap_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_vidasjugador_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_whip_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_whisky_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_music_castlevania_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_music_music_goes_here_txt extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_sounds_go_here_txt extends null { }
@:keep @:bind #if display private #end class __ASSET__flixel_sounds_beep_ogg extends null { }
@:keep @:bind #if display private #end class __ASSET__flixel_sounds_flixel_ogg extends null { }
@:keep @:bind #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends null { }
@:keep @:bind #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends null { }
@:keep @:bind #if display private #end class __ASSET__flixel_images_ui_button_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__flixel_images_logo_default_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }


#elseif html5

































@:keep #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends lime.text.Font { public function new () { super (); name = "Nokia Cellphone FC Small"; } } 
@:keep #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends lime.text.Font { public function new () { super (); name = "Monsterrat"; } } 




#else



#if (windows || mac || linux || cpp)


@:file("assets/data/lvl1.oel") #if display private #end class __ASSET__assets_data_lvl1_oel extends lime.utils.Bytes {}
@:file("assets/data/MAPA.oep") #if display private #end class __ASSET__assets_data_mapa_oep extends lime.utils.Bytes {}
@:file("assets/data/MapaTerminadoBien.oel") #if display private #end class __ASSET__assets_data_mapaterminadobien_oel extends lime.utils.Bytes {}
@:image("assets/images/boss.png") #if display private #end class __ASSET__assets_images_boss_png extends lime.graphics.Image {}
@:image("assets/images/bulletGorro.png") #if display private #end class __ASSET__assets_images_bulletgorro_png extends lime.graphics.Image {}
@:image("assets/images/EnemiesMusulman.png") #if display private #end class __ASSET__assets_images_enemiesmusulman_png extends lime.graphics.Image {}
@:image("assets/images/EnemigoNegro.png") #if display private #end class __ASSET__assets_images_enemigonegro_png extends lime.graphics.Image {}
@:image("assets/images/explosion.png") #if display private #end class __ASSET__assets_images_explosion_png extends lime.graphics.Image {}
@:image("assets/images/gorro.png") #if display private #end class __ASSET__assets_images_gorro_png extends lime.graphics.Image {}
@:image("assets/images/gouhl1.png") #if display private #end class __ASSET__assets_images_gouhl1_png extends lime.graphics.Image {}
@:image("assets/images/gouhl2.png") #if display private #end class __ASSET__assets_images_gouhl2_png extends lime.graphics.Image {}
@:image("assets/images/isis.png") #if display private #end class __ASSET__assets_images_isis_png extends lime.graphics.Image {}
@:image("assets/images/kunai.png") #if display private #end class __ASSET__assets_images_kunai_png extends lime.graphics.Image {}
@:image("assets/images/lamp.png") #if display private #end class __ASSET__assets_images_lamp_png extends lime.graphics.Image {}
@:image("assets/images/Lingera.png") #if display private #end class __ASSET__assets_images_lingera_png extends lime.graphics.Image {}
@:image("assets/images/linyera.png") #if display private #end class __ASSET__assets_images_linyera_png extends lime.graphics.Image {}
@:image("assets/images/PlataformaInest.png") #if display private #end class __ASSET__assets_images_plataformainest_png extends lime.graphics.Image {}
@:image("assets/images/platform.png") #if display private #end class __ASSET__assets_images_platform_png extends lime.graphics.Image {}
@:image("assets/images/player.png") #if display private #end class __ASSET__assets_images_player_png extends lime.graphics.Image {}
@:image("assets/images/player1.png") #if display private #end class __ASSET__assets_images_player1_png extends lime.graphics.Image {}
@:image("assets/images/rockLinyera.png") #if display private #end class __ASSET__assets_images_rocklinyera_png extends lime.graphics.Image {}
@:image("assets/images/slave.png") #if display private #end class __ASSET__assets_images_slave_png extends lime.graphics.Image {}
@:image("assets/images/tilemap.png") #if display private #end class __ASSET__assets_images_tilemap_png extends lime.graphics.Image {}
@:image("assets/images/trap.png") #if display private #end class __ASSET__assets_images_trap_png extends lime.graphics.Image {}
@:image("assets/images/vidasJugador.png") #if display private #end class __ASSET__assets_images_vidasjugador_png extends lime.graphics.Image {}
@:image("assets/images/whip.png") #if display private #end class __ASSET__assets_images_whip_png extends lime.graphics.Image {}
@:image("assets/images/whisky.png") #if display private #end class __ASSET__assets_images_whisky_png extends lime.graphics.Image {}
@:file("assets/music/Castlevania.wav") #if display private #end class __ASSET__assets_music_castlevania_wav extends lime.utils.Bytes {}
@:file("assets/music/music-goes-here.txt") #if display private #end class __ASSET__assets_music_music_goes_here_txt extends lime.utils.Bytes {}
@:file("assets/sounds/sounds-go-here.txt") #if display private #end class __ASSET__assets_sounds_sounds_go_here_txt extends lime.utils.Bytes {}
@:file("C:/HaxeToolkit/haxe/lib/flixel/4,3,0/assets/sounds/beep.ogg") #if display private #end class __ASSET__flixel_sounds_beep_ogg extends lime.utils.Bytes {}
@:file("C:/HaxeToolkit/haxe/lib/flixel/4,3,0/assets/sounds/flixel.ogg") #if display private #end class __ASSET__flixel_sounds_flixel_ogg extends lime.utils.Bytes {}
@:font("C:/HaxeToolkit/haxe/lib/flixel/4,3,0/assets/fonts/nokiafc22.ttf") #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends lime.text.Font {}
@:font("C:/HaxeToolkit/haxe/lib/flixel/4,3,0/assets/fonts/monsterrat.ttf") #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends lime.text.Font {}
@:image("C:/HaxeToolkit/haxe/lib/flixel/4,3,0/assets/images/ui/button.png") #if display private #end class __ASSET__flixel_images_ui_button_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/flixel/4,3,0/assets/images/logo/default.png") #if display private #end class __ASSET__flixel_images_logo_default_png extends lime.graphics.Image {}



#end
#end

#if (openfl && !flash)
@:keep #if display private #end class __ASSET__OPENFL__flixel_fonts_nokiafc22_ttf extends openfl.text.Font { public function new () { var font = new __ASSET__flixel_fonts_nokiafc22_ttf (); src = font.src; name = font.name; super (); }}
@:keep #if display private #end class __ASSET__OPENFL__flixel_fonts_monsterrat_ttf extends openfl.text.Font { public function new () { var font = new __ASSET__flixel_fonts_monsterrat_ttf (); src = font.src; name = font.name; super (); }}

#end

#end