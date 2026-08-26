function character()
{
    sparrowAtlas('Pico_FNF_assetss');
	addByPrefix('idle', "Pico Idle Dance", 24, false);
	addByPrefix('singUP', 'pico Up note0', 24, false);
	addByPrefix('singDOWN', 'Pico Down Note0', 24, false);
    
	if (isPlayer())
	{
		addByPrefix('singLEFT', 'Pico NOTE LEFT0', 24, false);
		addByPrefix('singRIGHT', 'Pico Note Right0', 24, false);
		addByPrefix('singRIGHTmiss', 'Pico Note Right Miss', 24, false);
		addByPrefix('singLEFTmiss', 'Pico NOTE LEFT miss', 24, false);
	}
	else
	{
		addByPrefix('singLEFT', 'Pico Note Right0', 24, false);
		addByPrefix('singRIGHT', 'Pico NOTE LEFT0', 24, false);
		addByPrefix('singRIGHTmiss', 'Pico NOTE LEFT miss', 24, false);
		addByPrefix('singLEFTmiss', 'Pico Note Right Miss', 24, false);
	}

	addByPrefix('singUPmiss', 'pico Up note miss', 24);
	addByPrefix('singDOWNmiss', 'Pico Down Note MISS', 24);

	playAnim('idle');

	flipX(true);
}