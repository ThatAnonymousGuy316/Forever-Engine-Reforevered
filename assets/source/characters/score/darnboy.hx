function character()
{
    sparrowAtlas('score/darnboy');

    addByPrefix('idle', 'idle', 24, false);
	addByPrefix('singUP', 'up', 24, false);
	addByPrefix('singLEFT', 'left', 24, false);
	addByPrefix('singRIGHT', 'right', 24, false);
	addByPrefix('singDOWN', 'down', 24, false);

    playAnim('idle');
}