function character()
{
    sparrowAtlas('bfPixelsDEAD');
	addByPrefix('singUP', "BF Dies pixel", 24, false);
	addByPrefix('firstDeath', "BF Dies pixel", 24, false);
	addByPrefix('deathLoop', "Retry Loop", 24, true);
	addByPrefix('deathConfirm', "RETRY CONFIRM", 24, false);
	play('firstDeath');

	setGraphicSize(Std.int(width() * 6));
	updateHitbox();
	antialiasing(false);
	flipX(true);
	offsetY(180);
}