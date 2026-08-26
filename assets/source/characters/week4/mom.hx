function character()
{
    sparrowAtlas('Mom_Assets');

	addByPrefix('idle', "Mom Idle", 24, false);
	addByPrefix('singUP', "Mom Up Pose", 24, false);
	addByPrefix('singDOWN', "MOM DOWN POSE", 24, false);
	addByPrefix('singLEFT', 'Mom Left Pose', 24, false);
	addByPrefix('singRIGHT', 'Mom Pose Left', 24, false);

	playAnim('idle');

	camOffsetY(100);
}