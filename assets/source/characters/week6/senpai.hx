function character()
{
    sparrowAtlas('senpai');
	addByPrefix('idle', 'Senpai Idle', 24, false);
	addByPrefix('singUP', 'SENPAI UP NOTE', 24, false);
	addByPrefix('singLEFT', 'SENPAI LEFT NOTE', 24, false);
	addByPrefix('singRIGHT', 'SENPAI RIGHT NOTE', 24, false);
	addByPrefix('singDOWN', 'SENPAI DOWN NOTE', 24, false);

	playAnim('idle');

	setGraphicSize(Std.int(width() * 6));
	updateHitbox();

	antialiasing(false);

	camOffsetY(-330);
	camOffsetX(-200);
}