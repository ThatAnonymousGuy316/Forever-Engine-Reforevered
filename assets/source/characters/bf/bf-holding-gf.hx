function character()
{
    sparrowAtlas('bfAndGF');
    
	addByPrefix('idle', 'BF idle dance');
	addByPrefix('singDOWN', 'BF NOTE DOWN0');
	addByPrefix('singLEFT', 'BF NOTE LEFT0');
	addByPrefix('singRIGHT', 'BF NOTE RIGHT0');
	addByPrefix('singUP', 'BF NOTE UP0');

	addByPrefix('singDOWNmiss', 'BF NOTE DOWN MISS');
	addByPrefix('singLEFTmiss', 'BF NOTE LEFT MISS');
	addByPrefix('singRIGHTmiss', 'BF NOTE RIGHT MISS');
	addByPrefix('singUPmiss', 'BF NOTE UP MISS');
	addByPrefix('bfCatch', 'BF catches GF');

	playAnim('idle');

	flipX(true);
}