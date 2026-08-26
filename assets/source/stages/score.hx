var startingPath:String = "backgrounds/score/";
var objectScale:Float = 1;
var scrollFactor:Float = 0.95;
var objectX:Float = -1320;
var objectY:Float = -370;

function create()
{
    cameraZoom(0.7);
    makeHaxeSprite(false, "1", startingPath + "april_bg_1", objectX, objectY);
    setHaxeScale("1", objectScale, objectScale);
    setHaxeScrollfactor("1", scrollFactor, scrollFactor);
    addHaxeSprite("1");
    makeHaxeSprite(false, "2", startingPath + "april_bg_2", objectX, objectY);
    setHaxeScale("2", objectScale, objectScale);
    setHaxeScrollfactor("2", scrollFactor, scrollFactor);
    addHaxeSprite("2");
    makeHaxeSprite(false, "3", startingPath + "april_bg_3", objectX, objectY);
    setHaxeScale("3", objectScale, objectScale);
    setHaxeScrollfactor("3", scrollFactor, scrollFactor);
    addHaxeSprite("3");
    makeHaxeSprite(false, "4", startingPath + "april_bg_4", objectX, objectY);
    setHaxeScale("4", objectScale, objectScale);
    setHaxeScrollfactor("4", scrollFactor, scrollFactor);
    addHaxeSprite("4");
    makeHaxeSprite(false, "5", startingPath + "april_bg_5", objectX, objectY);
    setHaxeScale("5", objectScale, objectScale);
    setHaxeScrollfactor("5", scrollFactor, scrollFactor);
    addHaxeSpriteForeground("5");
}

function girlfriend()
{
    gfVersion('neneScore');
}

function repositionPlayers(curStage, boyfriend, dad, gf)
{
    if (curStage == 'score')
    {
        boyfriend.x += 550;
        boyfriend.y -= 120;
        dad.x += 250;
        dad.y -= 100;
        gf.x += 340;
    }
}