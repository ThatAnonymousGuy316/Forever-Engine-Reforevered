function character()
{
    sparrowAtlas('senpai');
	addByPrefix('idle', 'Angry Senpai Idle', 24, false);
	addByPrefix('singUP', 'Angry Senpai UP NOTE', 24, false);
	addByPrefix('singLEFT', 'Angry Senpai LEFT NOTE', 24, false);
	addByPrefix('singRIGHT', 'Angry Senpai RIGHT NOTE', 24, false);
	addByPrefix('singDOWN', 'Angry Senpai DOWN NOTE', 24, false);

	setGraphicSize(Std.int(width() * 6));
	updateHitbox();

	antialiasing(false);

	camOffsetY(-330);
	camOffsetX(-200);
}