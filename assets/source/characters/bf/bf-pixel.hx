function character()
{
    sparrowAtlas('bfPixel');
    
	addByPrefix('idle', 'BF IDLE', 24, false);
	addByPrefix('singUP', 'BF UP NOTE', 24, false);
	addByPrefix('singLEFT', 'BF LEFT NOTE', 24, false);
	addByPrefix('singRIGHT', 'BF RIGHT NOTE', 24, false);
	addByPrefix('singDOWN', 'BF DOWN NOTE', 24, false);
	addByPrefix('singUPmiss', 'BF UP MISS', 24, false);
	addByPrefix('singLEFTmiss', 'BF LEFT MISS', 24, false);
	addByPrefix('singRIGHTmiss', 'BF RIGHT MISS', 24, false);
	addByPrefix('singDOWNmiss', 'BF DOWN MISS', 24, false);

	setGraphicSize(Std.int(width() * 6));
	updateHitbox();

	playAnim('idle');

	widthMinus(100);
	heightMinus(100);

	antialiasing(false);

	flipX(true);
}