function character()
{
    sparrowAtlas('tankmanCaptain');

	addByPrefix('idle', "Tankman Idle Dance");

	if (isPlayer())
	{
		addByPrefix('singLEFT', 'Tankman Note Left ');
		addByPrefix('singRIGHT', 'Tankman Right Note ');
		addByPrefix('singLEFTmiss', 'Tankman Note Left MISS');
		addByPrefix('singRIGHTmiss', 'Tankman Right Note MISS');
	}
	else
	{
		// Need to be flipped! REDO THIS LATER
		addByPrefix('singLEFT', 'Tankman Right Note ');
		addByPrefix('singRIGHT', 'Tankman Note Left ');
		addByPrefix('singLEFTmiss', 'Tankman Right Note MISS');
		addByPrefix('singRIGHTmiss', 'Tankman Note Left MISS');
	}

	addByPrefix('singUP', 'Tankman UP note ');
	addByPrefix('singDOWN', 'Tankman DOWN note ');
	addByPrefix('singUPmiss', 'Tankman UP note MISS');
	addByPrefix('singDOWNmiss', 'Tankman DOWN note MISS');

	addByPrefix('singDOWN-alt', 'PRETTY GOOD');
	addByPrefix('singUP-alt', 'TANKMAN UGH');

	playAnim('idle');

	flipX(true);
}