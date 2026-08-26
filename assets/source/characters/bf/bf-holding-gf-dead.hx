function character()
{
    sparrowAtlas('bfHoldingGF-DEAD');

	addByPrefix('singUP', 'BF Dead with GF Loop');
	addByPrefix('firstDeath', 'BF Dies with GF');
	addByPrefix('deathLoop', 'BF Dead with GF Loop', 24, true);
	addByPrefix('deathConfirm', 'RETRY confirm holding gf');

	playAnim('firstDeath');

	flipX(true);
}