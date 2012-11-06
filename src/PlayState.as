package
{
    import flash.utils.Dictionary;
    import org.flixel.*;

    public class PlayState extends FlxState
    {
        [Embed(source="../assets/level2.png")] public var level2PNG:Class;

        public var ninja:Ninja;
        public var spawn:FlxSprite;
        public var exit:FlxSprite;
        public var level:Level;

        public var currentLevel:Level;

        override public function create():void
        {
            FlxG.levels[0] = Level1;
            FlxG.levels[1] = Level2;
            FlxG.level = 0;
            initLevel();
        }

        public function initLevel():void
        {
            clear();

            level = new FlxG.levels[FlxG.level]();
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

            FlxG.collide(level.tilemap, ninja);

            if(FlxG.overlap(exit, ninja)) {
                FlxG.level = (FlxG.level + 1) % FlxG.levels.length;
                initLevel();
            }
        }
    }
}
