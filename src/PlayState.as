package
{
    import flash.utils.Dictionary;
    import org.flixel.*;

    public class PlayState extends FlxState
    {
        [Embed(source="../assets/level1.png")] public var level1PNG:Class;
        [Embed(source="../assets/level2.png")] public var level2PNG:Class;

        public var ninja:Ninja;
        public var spawn:FlxSprite;
        public var exit:FlxSprite;
        public var level:FlxTilemap;

        override public function create():void
        {
            var levelDict:Dictionary;
            levelDict = FlxG.levels[FlxG.level];

            level = new FlxTilemap();
            // NOTE: autotilemap is 8x8 tiles
            level.loadMap(FlxTilemap.imageToCSV(level1PNG),
                          FlxTilemap.ImgAuto, 0, 0, FlxTilemap.AUTO);
            FlxG.worldBounds = level.getBounds();
            add(level);

            spawn = new FlxSprite(8 * 3, 8 * 27);
            spawn.makeGraphic(8, 16, 0xff00ff00);
            add(spawn);

            exit = new FlxSprite(8 * 38, 8 * 1);
            exit.makeGraphic(8, 16, 0xff0000ff);
            add(exit);

            ninja = new Ninja();
            ninja.x = spawn.x;
            ninja.y = spawn.y;
            add(ninja);
            add(ninja.sword);

            FlxG.camera.follow(ninja, FlxCamera.STYLE_PLATFORMER)
        }

        override public function update():void
        {
            super.update();

            FlxG.collide(level, ninja);

            if(FlxG.overlap(exit, ninja)) {
                FlxG.switchState(new PlayState);
            }
        }
    }
}
