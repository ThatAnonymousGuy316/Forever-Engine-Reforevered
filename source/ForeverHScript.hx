package;

import crowplexus.iris.Iris;
import crowplexus.iris.IrisConfig;
import haxe.io.Path;
import flixel.util.FlxColor;
import meta.data.dependency.FNFSprite;

using StringTools;

class ForeverHScript
{
    public static function globalExtensions()
    {
        return ['hx', 'hxs', 'hxc', 'hsc', 'hscript'];
    }

    public static function scriptsFolder()
    {
        return "source";
    }

    public var hscript:Iris;

    public var filePath:String;

    public function new(filePath:String)
    {
        this.filePath = filePath;

        if (sys.FileSystem.exists(filePath))
        {
            var scriptName = Path.withoutExtension(Path.withoutDirectory(filePath));

            final rules:RawIrisConfig = {
                name: scriptName,
                autoRun: false,
                autoPreset: true
            };

            final getText:String->String =
                #if sys sys.io.File.getContent
                #elseif openfl openfl.utils.Assets.getText
                #end;

            hscript = new Iris(getText(filePath), rules);
            preset();
            hscript.execute();
            call(["new", "onLoad", "load"]);
        }
    }

    public function preset()
    {
        set(["Std"], Std);
		set(["StringTools"], StringTools);
		set(["Math"], Math);
        set(['Array'], Array);
        set(['FlxG'], flixel.FlxG);
		set(['FlxMath'], flixel.math.FlxMath);
        set(['FlxText'], flixel.text.FlxText);
		set(['FlxCamera'], flixel.FlxCamera);
        set(['FlxTimer'], flixel.util.FlxTimer);
		set(['FlxTween'], flixel.tweens.FlxTween);
		set(['FlxEase'], flixel.tweens.FlxEase);
        set(['FlxBar', 'Bar'], flixel.ui.FlxBar);
        set(['Dynamic'], Dynamic);
        set(['__script__', 'this', 'Script'], this);
        set(['State', 'Game'], flixel.FlxG.state);
        set(['ForeverAssets'], ForeverAssets);
        set(['ForeverTools'], ForeverTools);
        set(['Paths'], Paths);
        set(['Boyfriend'], gameObjects.Boyfriend);
        set(['Character'], gameObjects.Character);
        set(['Stage'], gameObjects.Stage);
        set(['HealthIcon', 'Icon'], gameObjects.userInterface.HealthIcon);
        set(['Mouse', 'Cursor'], flixel.FlxG.mouse);
        set(['CustomFlxColor', 'FlxColor', 'Color', 'FunkinColor'], CustomFlxColor);
        set(['Note'], gameObjects.userInterface.notes.Note);
        set(['NoteSplash'], gameObjects.userInterface.notes.NoteSplash);
        set(['Strumline', 'StrumNote'], gameObjects.userInterface.notes.Strumline);
        set(['FNFSprite', 'FlxSprite'], meta.data.dependency.FNFSprite);
        set(['BGSprite'], BGSprite);
        set(['MusicBeatState', 'FlxState', 'FlxUIState'], meta.MusicBeat.MusicBeatState);
        set(['MusicBeatSubState', 'FlxSubState'], meta.MusicBeat.MusicBeatSubState);
        set(['PlayState'], meta.state.PlayState);
        set(['Init'], Init);
        set(['CoolUtil'], meta.CoolUtil);
        set(['Conductor'], meta.data.Conductor);
        set(['Timings'], meta.data.Timings);
        set(['Main'], Main);
        set(['SpriteFromSheet'], gameObjects.SpriteFromSheet);
        set(['FlxBackdrop'], flixel.addons.display.FlxBackdrop);

        set(['add', 'addSprite'], flixel.FlxG.state.add);
        set(['remove', 'removeSprite'], flixel.FlxG.state.remove);
        set(['insert', 'insertSprite'], flixel.FlxG.state.insert);

        set(['Cursor', 'Mouse'], flixel.FlxG.mouse);

        set(["FlxCameraFollowStyle"], {
			LOCKON: flixel.FlxCamera.FlxCameraFollowStyle.LOCKON,
			PLATFORMER: flixel.FlxCamera.FlxCameraFollowStyle.PLATFORMER,
			TOPDOWN: flixel.FlxCamera.FlxCameraFollowStyle.TOPDOWN,
			TOPDOWN_TIGHT: flixel.FlxCamera.FlxCameraFollowStyle.TOPDOWN_TIGHT,
			SCREEN_BY_SCREEN: flixel.FlxCamera.FlxCameraFollowStyle.SCREEN_BY_SCREEN,
			NO_DEAD_ZONE: flixel.FlxCamera.FlxCameraFollowStyle.NO_DEAD_ZONE,

		});
		set(["FlxTextBorderStyle"], {
			NONE: flixel.text.FlxText.FlxTextBorderStyle.NONE,
			SHADOW: flixel.text.FlxText.FlxTextBorderStyle.SHADOW,
			OUTLINE: flixel.text.FlxText.FlxTextBorderStyle.OUTLINE,
			OUTLINE_FAST: flixel.text.FlxText.FlxTextBorderStyle.OUTLINE_FAST
		});
		set(["FlxTextAlign"], {
			CENTER: flixel.text.FlxText.FlxTextAlign.CENTER,
			JUSTIFY: flixel.text.FlxText.FlxTextAlign.JUSTIFY,
			LEFT: flixel.text.FlxText.FlxTextAlign.LEFT,
			RIGHT: flixel.text.FlxText.FlxTextAlign.RIGHT
		});
		set(["setTxtFormat"], function(txt:flixel.text.FlxText, ?Font:String, Size:Int = 8, Color:FlxColor = FlxColor.WHITE, ?Alignment:flixel.text.FlxText.FlxTextAlign, ?BorderStyle:flixel.text.FlxText.FlxTextBorderStyle, BorderColor:FlxColor = FlxColor.TRANSPARENT, EmbeddedFont:Bool = true){
			txt.setFormat(Font, Size, Color, Alignment, BorderStyle, BorderColor, EmbeddedFont);
		});

		set(["FlxAxes"], {
			X: flixel.util.FlxAxes.X,
			Y: flixel.util.FlxAxes.Y,
			XY: flixel.util.FlxAxes.XY
		});

        set(['makeHaxeSprite'], function(isAnimated:Bool, name:String, tex:String, ?x:Float = 0, ?y:Float = 0, ?antialiasing:Bool = true, ?animation:String = '', ?animationData:String = '', ?animationFrameRate:Int = 24, ?animationLoops:Bool = false){
            name = name.replace('.', '');
            var sprite:FNFSprite = new FNFSprite(x, y);
            if (isAnimated){
                sprite.frames = Paths.getSparrowAtlas(tex);
                sprite.animation.addByPrefix(animation, animationData, animationFrameRate, animationLoops);
                sprite.playAnim(animation);
            }else{
                sprite.loadGraphic(Paths.image(tex));
            }
            sprite.antialiasing = antialiasing;
            meta.state.PlayState.current.modchartSprites.set(name, sprite);
        });

        set(['playHaxeAnimation'], function(name:String, animation:String) {
            var sprite = meta.state.PlayState.current.modchartSprites.get(name);

            if (sprite != null) {
                sprite.playAnim(animation);
            }
        });

        set(['setHaxeScrollfactor'], function(name:String, x:Float, y:Float) {
            var sprite = meta.state.PlayState.current.modchartSprites.get(name);

            if (sprite != null) {
                sprite.scrollFactor.set(x, y);
            }
        });

        set(['addHaxeSprite'], function(name:String) {
            var sprite = meta.state.PlayState.current.modchartSprites.get(name);

            if (sprite != null) {
                meta.state.PlayState.current.add(sprite);
            }
        });

        set(['removeHaxeSprite'], function(name:String) {
            var sprite = meta.state.PlayState.current.modchartSprites.get(name);

            if (sprite != null) {
                meta.state.PlayState.current.remove(sprite);
            }
        });

        set(['setHaxeVisible'], function(name:String, visible:Bool) {
            var sprite = meta.state.PlayState.current.modchartSprites.get(name);

            if (sprite != null) {
                sprite.visible = visible;
            }
        });

        set(['setHaxeScale'], function(name:String, scaleX:Float, scaleY:Float) {
            var sprite = meta.state.PlayState.current.modchartSprites.get(name);

            if (sprite != null) {
                sprite.scale.set(scaleX, scaleY);
                sprite.updateHitbox();
            }
        });

        set(['setHaxeCameras'], function(name:String, cameras:Array<flixel.FlxCamera>) {
            var sprite = meta.state.PlayState.current.modchartSprites.get(name);

            if (sprite != null) {
                sprite.cameras = cameras;
            }
        });

        if (flixel.FlxG.state == meta.state.PlayState.current)
        {
            set(['Play'], meta.state.PlayState.current);
            set(['setObjectToCamHUD'], function(object:flixel.FlxBasic){
                object.cameras = [meta.state.PlayState.current.camHUD];
            });
        }

        set(['exit', 'exitGame'], function(){
            Sys.exit(0);
        });

        set(['getVersion'], function(){
            return Main.gameVersion;
        });
    }

    public function onDestroy()
    {
        if (hscript != null)
        {   
            call(['onScriptDestroy', 'scriptDestroy']);
            hscript.destroy();
        }
    }

    public function set(a:Array<String>, b:Dynamic)
    {
        if (hscript != null)
        {
            for (alias in a){
                hscript.set(alias, b);
            }
        }
    }

    public function call(a:Array<String>, ?b:Array<Dynamic>)
    {
        if (hscript != null)
        {
            for (alias in a)
            {
                if (hscript.exists(alias)){
                    hscript.call(alias, b);
                }
            }
        }
    }
}

class CustomFlxColor {
	public static var TRANSPARENT(default, null):Int = FlxColor.TRANSPARENT;
	public static var BLACK(default, null):Int = FlxColor.BLACK;
	public static var WHITE(default, null):Int = FlxColor.WHITE;
	public static var GRAY(default, null):Int = FlxColor.GRAY;

	public static var GREEN(default, null):Int = FlxColor.GREEN;
	public static var LIME(default, null):Int = FlxColor.LIME;
	public static var YELLOW(default, null):Int = FlxColor.YELLOW;
	public static var ORANGE(default, null):Int = FlxColor.ORANGE;
	public static var RED(default, null):Int = FlxColor.RED;
	public static var PURPLE(default, null):Int = FlxColor.PURPLE;
	public static var BLUE(default, null):Int = FlxColor.BLUE;
	public static var BROWN(default, null):Int = FlxColor.BROWN;
	public static var PINK(default, null):Int = FlxColor.PINK;
	public static var MAGENTA(default, null):Int = FlxColor.MAGENTA;
	public static var CYAN(default, null):Int = FlxColor.CYAN;

	public static function fromInt(Value:Int):Int 
		return cast FlxColor.fromInt(Value);

	public static function fromRGB(Red:Int, Green:Int, Blue:Int, Alpha:Int = 255):Int
		return cast FlxColor.fromRGB(Red, Green, Blue, Alpha);

	public static function fromRGBFloat(Red:Float, Green:Float, Blue:Float, Alpha:Float = 1):Int
		return cast FlxColor.fromRGBFloat(Red, Green, Blue, Alpha);

	public static inline function fromCMYK(Cyan:Float, Magenta:Float, Yellow:Float, Black:Float, Alpha:Float = 1):Int
		return cast FlxColor.fromCMYK(Cyan, Magenta, Yellow, Black, Alpha);

	public static function fromHSB(Hue:Float, Sat:Float, Brt:Float, Alpha:Float = 1):Int
		return cast FlxColor.fromHSB(Hue, Sat, Brt, Alpha);

	public static function fromHSL(Hue:Float, Sat:Float, Light:Float, Alpha:Float = 1):Int
		return cast FlxColor.fromHSL(Hue, Sat, Light, Alpha);

	public static function fromString(str:String):Int
		return cast FlxColor.fromString(str);
}