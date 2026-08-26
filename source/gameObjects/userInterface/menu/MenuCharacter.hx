package gameObjects.userInterface.menu;

import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;

class MenuCharacter extends FlxSprite
{
	public var character:String = '';

	var curCharacterMap:Map<String, Array<Dynamic>> = [
		// the format is currently
		// name of character => id in atlas, fps, loop, scale, offsetx, offsety
		'bf' => ["M BF Idle", 24, true, 1.4 * 0.75, 65, 0],
		'bfConfirm' => ['M bf HEY', 24, false, 1.4 * 0.75, 65, 0],
		'gf' => ["M GF Idle", 24, true, 1.4, 0, 0],
		'dad' => ["M Dad Idle", 24, true, 1.4 * 0.75, 0, 0],
		'spooky' => ["M Spooky Kids Idle", 24, true, 1.4 * 0.75, 0, 0],
		'pico' => ["M Pico Idle", 24, true, 1 * 1.4 * 0.75, 0, 0],
		'mom' => ["M Mom Idle", 24, true, 1 * 1.4 * 0.75, 0, 0],
		'parents-christmas' => ["M Parents Idle", 24, true, 1.4 * 0.75, -250, 0],
		'senpai' => ["M Senpai Idle", 24, true, 1.4 * 0.5, 0, 0],
		'tankman' => ["M Tankman Idle", 24, true, 1.4 * 0.75, 0, 0]
	];

	var baseX:Float = 0;
	var baseY:Float = 0;

	public function new(x:Float, newCharacter:String = 'bf')
	{
		super(x);
		y += 70;

		baseX = x;
		baseY = y;

		createCharacter(newCharacter);
		updateHitbox();
	}

	public function createCharacter(newCharacter:String, canChange:Bool = false)
	{
		if (newCharacter != '' && newCharacter != null)
		{
			var assortedValues = curCharacterMap.get(newCharacter);
			var tex = Paths.getSparrowAtlas('menus/base/storymenu/characters/${newCharacter}');
			frames = tex;
			if (assortedValues != null)
			{
				if (!visible)
					visible = true;

				// animation
				animation.addByPrefix(newCharacter, assortedValues[0], assortedValues[1], assortedValues[2]);
				// if (character != newCharacter)
				animation.play(newCharacter);

				if (canChange)
				{
					// offset
					setGraphicSize(Std.int(width * assortedValues[3]));
					updateHitbox();
					setPosition(baseX + assortedValues[4], baseY + assortedValues[5]);

					if (newCharacter == 'pico')
						flipX = true;
					else
						flipX = false;
				}
			}
			else
				visible = false;

			character = newCharacter;
		}
	}
}
