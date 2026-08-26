function character()
{
    sparrowAtlas('picoSpeaker');

	addByPrefix('shoot1', "Pico shoot 1");
	addByPrefix('shoot2', "Pico shoot 2");
	addByPrefix('shoot3', "Pico shoot 3");
	addByPrefix('shoot4', "Pico shoot 4");

	playAnim('shoot1');

	loadMappedAnims();
}