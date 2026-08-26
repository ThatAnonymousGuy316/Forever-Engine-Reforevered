package;

class HScriptState extends meta.MusicBeat.MusicBeatState
{
    public var path:String = '';
    public var script:ForeverHScript;

    public function new(path:String)
    {
        super();
        this.path = path;
    }
}