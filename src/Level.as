package
{
    import org.flixel.*;

    public class Level extends FlxGroup
    {
        public var tilemap:FlxTilemap;
        public var climbmap:FlxTilemap;
        public var instantDeath:FlxTilemap;
        public var spawn:FlxSprite;
        public var exit:FlxSprite;
        public var baddies:FlxGroup;
        public var ninja:Ninja;

        public function Level()
        {
            super();
            tilemap = null;
        }
    }
}
