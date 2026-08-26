function character()
{
    sparrowAtlas('bfCar');

	addByPrefix('idle', 'BF idle dance', 24, false);
	addByIndices('idlePost', 'BF idle dance', [8, 9, 10, 11, 12, 13, 14], "", 24, true);
	addByPrefix('singUP', 'BF NOTE UP0', 24, false);
	addByPrefix('singLEFT', 'BF NOTE LEFT0', 24, false);
	addByPrefix('singRIGHT', 'BF NOTE RIGHT0', 24, false);
	addByPrefix('singDOWN', 'BF NOTE DOWN0', 24, false);
	addByPrefix('singUPmiss', 'BF NOTE UP MISS', 24, false);
	addByPrefix('singLEFTmiss', 'BF NOTE LEFT MISS', 24, false);
	addByPrefix('singRIGHTmiss', 'BF NOTE RIGHT MISS', 24, false);
	addByPrefix('singDOWNmiss', 'BF NOTE DOWN MISS', 24, false);

	playAnim('idle');

	flipX(true);
}