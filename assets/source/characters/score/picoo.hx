function character()
{
    sparrowAtlas('score/picoo');

	addByPrefix('idle', 'idle', 24, false);
	addByPrefix('singUP', 'up', 24, false);
	addByPrefix('singLEFT', 'right', 24, false);
	addByPrefix('singRIGHT', 'left', 24, false);
	addByPrefix('singDOWN', 'down', 24, false);
	addByPrefix('singUPmiss', 'missup', 24, false);
	addByPrefix('singLEFTmiss', 'missright', 24, false);
	addByPrefix('singRIGHTmiss', 'missleft', 24, false);
	addByPrefix('singDOWNmiss', 'missdown', 24, false);

	playAnim('idle');

	flipX(true);
}