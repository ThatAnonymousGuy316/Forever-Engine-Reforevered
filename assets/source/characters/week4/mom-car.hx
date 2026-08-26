function character()
{
    sparrowAtlas('momCar');

	addByPrefix('idle', "Mom Idle", 24, false);
	addByIndices('idlePost', 'Mom Idle', [10, 11, 12, 13], "", 24, true);
	addByPrefix('singUP', "Mom Up Pose", 24, false);
	addByPrefix('singDOWN', "MOM DOWN POSE", 24, false);
	addByPrefix('singLEFT', 'Mom Left Pose', 24, false);
	addByPrefix('singRIGHT', 'Mom Pose Left', 24, false);

	playAnim('idle');
}