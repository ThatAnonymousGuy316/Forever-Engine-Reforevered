package gameObjects;

/**
	The character class initialises any and all characters that exist within gameplay. For now, the character class will
	stay the same as it was in the original source of the game. I'll most likely make some changes afterwards though!
**/
import flixel.FlxG;
import flixel.addons.util.FlxSimplex;
import flixel.animation.FlxBaseAnimation;
import flixel.graphics.frames.FlxAtlasFrames;
import gameObjects.userInterface.HealthIcon;
import meta.*;
import meta.data.*;
import meta.data.dependency.FNFSprite;
import meta.state.PlayState;
import openfl.utils.Assets as OpenFlAssets;
import flixel.util.FlxSort;

using StringTools;

typedef CharacterData =
{
	var offsetX:Float;
	var offsetY:Float;
	var camOffsetX:Float;
	var camOffsetY:Float;
	var quickDancer:Bool;
}

class Character extends FNFSprite
{
	public var debugMode:Bool = false;

	public var isPlayer:Bool = false;
	public var curCharacter:String = 'bf';

	public var holdTimer:Float = 0;

	public var characterData:CharacterData;
	public var adjustPos:Bool = true;

	public var animationNotes:Array<Dynamic> = [];

	public var script:ForeverHScript;

	public function new(?isPlayer:Bool = false)
	{
		super(x, y);
		this.isPlayer = isPlayer;
	}

	public function setCharacter(x:Float, y:Float, character:String):Character
	{
		curCharacter = character;
		var tex:FlxAtlasFrames;
		antialiasing = true;

		characterData = {
			offsetY: 0,
			offsetX: 0,
			camOffsetY: 0,
			camOffsetX: 0,
			quickDancer: false
		};

		switch (curCharacter)
		{
			default:
				for (ext in ForeverHScript.globalExtensions())
				{
					var characterPath:String = '';

					var characterRoots = [
						'assets/${ForeverHScript.scriptsFolder()}/characters',
						'mod/${ForeverHScript.scriptsFolder()}/characters'
					];

					function findCharacter(root:String, target:String, extension:String):String
					{
						if (!sys.FileSystem.exists(root))
							return '';

						for (file in sys.FileSystem.readDirectory(root))
						{
							var fullPath = '$root/$file';

							if (sys.FileSystem.isDirectory(fullPath))
							{
								var found = findCharacter(fullPath, target, extension);

								if (found != '')
									return found;
							}
							else if (
								haxe.io.Path.withoutExtension(file).toLowerCase() == target.toLowerCase()
								&& haxe.io.Path.extension(file).toLowerCase() == extension.toLowerCase()
							)
							{
								return fullPath;
							}
						}

						return '';
					}

					for (root in characterRoots)
					{
						characterPath = findCharacter(
							root,
							curCharacter,
							ext
						);

						if (characterPath != '')
							break;
					}

					script = new ForeverHScript(
						characterPath
					);
					
					script.set(['sparrowAtlas'], function(a:String){
						this.frames = Paths.getSparrowAtlas('characters/' + a);
					});
					script.set(['packerAtlas'], function(a:String){
						this.frames = Paths.getPackerAtlas('characters/' + a);
					});
					script.set(['addByPrefix'], function(a:String, b:String, c:Int = 24, d:Bool = false){
						this.animation.addByPrefix(a, b, c, d);
					});
					script.set(['addByIndices'], function(a:String, b:String, c:Array<Int>, thing:String = '', d:Int = 24, e:Bool = false){
						this.animation.addByIndices(a, b, c, thing, d, e);
					});
					script.set(['playAnim'], function(a:String){
						this.playAnim(a);
					});
					script.set(['antialiasing'], function(a:Bool){
						this.antialiasing = a;
					});
					script.set(['setGraphicSize'], function(a:Dynamic){
						this.setGraphicSize(a);
					});
					script.set(['updateHitbox'], function(){
						this.updateHitbox();
					});
					script.set(['quickDancer'], function(a:Bool){
						this.characterData.quickDancer = a;
					});
					script.set(['offsetY'], function(a:Float){
						this.characterData.offsetY = a;
					});
					script.set(['offsetX'], function(a:Float){
						this.characterData.offsetX = a;
					});
					script.set(['camOffsetY'], function(a:Float){
						this.characterData.camOffsetY = a;
					});
					script.set(['camOffsetX'], function(a:Float){
						this.characterData.camOffsetX = a;
					});
					script.set(['characterData'], function(){
						return this.characterData;
					});
					script.set(['adjustPos'], function(a:Bool){
						this.adjustPos = a;
					});
					script.set(['addOffset'], function(a:String, b:Float){
						this.addOffset(a, b);
					});
					script.set(['flipX'], function(a:Bool){
						this.flipX = a;
					});
					script.set(['flipY'], function(a:Bool){
						this.flipY = a;
					});
					script.set(['width'], function(){
						return this.width;
					});
					script.set(['height'], function(){
						return this.height;
					});
					script.set(['widthMinus'], function(a:Float){
						this.width -= a;
					});
					script.set(['heightMinus'], function(a:Float){
						this.height -= a;
					});
					script.set(['widthPlus'], function(a:Float){
						this.width += a;
					});
					script.set(['heightPlus'], function(a:Float){
						this.height += a;
					});
					script.set(['flipLeftRight'], function(){
						this.flipLeftRight();
					});
					script.set(['isPlayer'], function(){
						return this.isPlayer;
					});
					script.set(['loadMappedAnims'], function(){
						loadMappedAnims();
					});
					script.call(['character', 'char'], []);
				}
		}

		// set up offsets cus why not
		if (OpenFlAssets.exists(Paths.offsetTxt(curCharacter + 'Offsets')))
		{
			var characterOffsets:Array<String> = CoolUtil.coolTextFile(Paths.offsetTxt(curCharacter + 'Offsets'));
			for (i in 0...characterOffsets.length)
			{
				var getterArray:Array<Array<String>> = CoolUtil.getOffsetsFromTxt(Paths.offsetTxt(curCharacter + 'Offsets'));
				addOffset(getterArray[i][0], Std.parseInt(getterArray[i][1]), Std.parseInt(getterArray[i][2]));
			}
		}

		dance();

		if (isPlayer) // fuck you ninjamuffin lmao
		{
			flipX = !flipX;

			// Doesn't flip for BF, since his are already in the right place???
			if (!curCharacter.startsWith('bf'))
				flipLeftRight();
			//
		}
		else if (curCharacter.startsWith('bf'))
			flipLeftRight();

		if (adjustPos)
		{
			x += characterData.offsetX;
			// trace('character ${curCharacter} scale ${scale.y}');
			y += (characterData.offsetY - (frameHeight * scale.y));
		}

		this.x = x;
		this.y = y;

		return this;
	}

	public function loadMappedAnims()
	{
		var swagshit = meta.data.Song.loadFromJson('picospeaker', 'stress');

		var notes = swagshit.notes;

		for (section in notes)
		{
			for (idk in section.sectionNotes)
			{
				animationNotes.push(idk);
			}
		}

		TankmenBG.animationNotes = animationNotes;

		trace(animationNotes);
		animationNotes.sort(sortAnims);
	}

	function sortAnims(val1:Array<Dynamic>, val2:Array<Dynamic>):Int
	{
		return FlxSort.byValues(FlxSort.ASCENDING, val1[0], val2[0]);
	}

	function flipLeftRight():Void
	{
		// get the old right sprite
		var oldRight = animation.getByName('singRIGHT').frames;

		// set the right to the left
		animation.getByName('singRIGHT').frames = animation.getByName('singLEFT').frames;

		// set the left to the old right
		animation.getByName('singLEFT').frames = oldRight;

		// insert ninjamuffin screaming I think idk I'm lazy as hell

		if (animation.getByName('singRIGHTmiss') != null)
		{
			var oldMiss = animation.getByName('singRIGHTmiss').frames;
			animation.getByName('singRIGHTmiss').frames = animation.getByName('singLEFTmiss').frames;
			animation.getByName('singLEFTmiss').frames = oldMiss;
		}
	}

	override function update(elapsed:Float)
	{
		if (!isPlayer)
		{
			if (animation.curAnim.name.startsWith('sing'))
			{
				holdTimer += elapsed;
			}

			var dadVar:Float = 4;
			if (holdTimer >= Conductor.stepCrochet * dadVar * 0.001)
			{
				dance();
				holdTimer = 0;
			}
		}

		var curCharSimplified:String = simplifyCharacter();
		switch (curCharSimplified)
		{
			case 'gf':
				if (animation.curAnim.name == 'hairFall' && animation.curAnim.finished)
					playAnim('danceRight');
				if ((animation.curAnim.name.startsWith('sad')) && (animation.curAnim.finished))
					playAnim('danceLeft');

			case "pico-speaker":
				// for pico??
				if (animationNotes.length > 0)
				{
					if (Conductor.songPosition > animationNotes[0][0])
					{
						trace('played shoot anim' + animationNotes[0][1]);

						var shootAnim:Int = 1;

						if (animationNotes[0][1] >= 2)
							shootAnim = 3;

						shootAnim += FlxG.random.int(0, 1);

						playAnim('shoot' + FlxG.random.int(1, 4), true);
						animationNotes.shift();
					}
				}

				if (animation.curAnim.finished)
				{
					playAnim('shoot' + FlxG.random.int(1, 4), true);
				}
		}

		// Post idle animation (think Week 4 and how the player and mom's hair continues to sway after their idle animations are done!)
		if (animation.curAnim.finished && animation.curAnim.name == 'idle')
		{
			// We look for an animation called 'idlePost' to switch to
			if (animation.getByName('idlePost') != null)
				// (( WE DON'T USE 'PLAYANIM' BECAUSE WE WANT TO FEED OFF OF THE IDLE OFFSETS! ))
				animation.play('idlePost', true, false, 0);
		}

		super.update(elapsed);
	}

	private var danced:Bool = false;

	/**
	 * FOR GF DANCING SHIT
	 */
	public override function dance(?forced:Bool = false):Void
	{
		super.dance(forced);
		
		if (!debugMode)
		{
			var curCharSimplified:String = simplifyCharacter();
			switch (curCharSimplified)
			{
				case 'pico-speaker':
					playAnim('shoot' + FlxG.random.int(1, 4), true);

				case 'tankman':
					if (!animation.curAnim.name.endsWith('DOWN-alt'))
						playAnim('idle');

				case 'gf' | 'gf-tankman':
					if ((!animation.curAnim.name.startsWith('hair')) && (!animation.curAnim.name.startsWith('sad')))
					{
						danced = !danced;

						if (danced)
							playAnim('danceRight', forced);
						else
							playAnim('danceLeft', forced);
					}
				default:
					// Left/right dancing, think Skid & Pump
					if (animation.getByName('danceLeft') != null && animation.getByName('danceRight') != null)
					{
						danced = !danced;
						if (danced)
							playAnim('danceRight', forced);
						else
							playAnim('danceLeft', forced);
					}
					else
						playAnim('idle', forced);
			}
		}
	}

	override public function playAnim(AnimName:String, Force:Bool = false, Reversed:Bool = false, Frame:Int = 0):Void
	{
		if (animation.getByName(AnimName) != null)
			super.playAnim(AnimName, Force, Reversed, Frame);

		if (curCharacter == 'gf')
		{
			if (AnimName == 'singLEFT')
				danced = true;
			else if (AnimName == 'singRIGHT')
				danced = false;

			if (AnimName == 'singUP' || AnimName == 'singDOWN')
				danced = !danced;
		}
	}

	override public function destroy()
	{
		if (script != null)
		{
			script.onDestroy();
		}
	}

	public function simplifyCharacter():String
	{
		var base = curCharacter;

		if (base.contains('-'))
			base = base.substring(0, base.indexOf('-'));
		return base;
	}
}
