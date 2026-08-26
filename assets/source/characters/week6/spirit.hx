function character()
{
    packerAtlas('spirit');
	addByPrefix('idle', "idle spirit_", 24, false);
	addByPrefix('singUP', "up_", 24, false);
	addByPrefix('singRIGHT', "right_", 24, false);
	addByPrefix('singLEFT', "left_", 24, false);
	addByPrefix('singDOWN', "spirit down_", 24, false);

	setGraphicSize(Std.int(width() * 6));
	updateHitbox();

	playAnim('idle');

	antialiasing(false);
	quickDancer(true);

	camOffsetY(50);
	camOffsetX(100);
}