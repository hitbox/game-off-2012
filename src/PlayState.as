package
{
    import flash.utils.Dictionary;
    import org.flixel.*;

    public class PlayState extends FlxState
    {
        public var level:FlxTilemap;
        public var player:FlxSprite;
        public var spawn:FlxSprite;
        public var exit:FlxSprite;

        override public function create():void
        {
            var levelDict:Dictionary;
            levelDict = FlxG.levels[FlxG.level];

            level = new FlxTilemap();
            // NOTE: autotilemap is 8x8 tiles
            level.loadMap(FlxTilemap.imageToCSV(levelDict["levelPNG"]),
                          FlxTilemap.ImgAuto, 0, 0, FlxTilemap.AUTO);
            FlxG.worldBounds = level.getBounds();
            add(level);

            spawn = new FlxSprite(8 * 3, 8 * 27);
            spawn.makeGraphic(8, 16, 0xff00ff00);
            add(spawn);

            exit = new FlxSprite(8 * 38, 8 * 1);
            exit.makeGraphic(8, 16, 0xff0000ff);
            add(exit);

            player = new FlxSprite(FlxG.width / 2 - 5);
            player.x = spawn.x;
            player.y = spawn.y;
            player.makeGraphic(10, 12, 0xffaa1111);
            player.maxVelocity.x = 120;
            player.maxVelocity.y = 400;
            player.acceleration.y = 400;
            player.drag.x = player.maxVelocity.x*4;
            add(player);

            FlxG.camera.follow(player, FlxCamera.STYLE_PLATFORMER)
        }

        override public function update():void
        {
            player.acceleration.x = 0;
            if(FlxG.keys.LEFT)
                player.acceleration.x = -player.maxVelocity.x*4;
            if(FlxG.keys.RIGHT)
                player.acceleration.x = player.maxVelocity.x*4;
            if(FlxG.keys.justPressed("UP") && player.isTouching(FlxObject.FLOOR))
                player.velocity.y = -player.maxVelocity.y / 2;

            super.update();

            FlxG.collide(level, player);

            if(FlxG.overlap(exit, player)) {
                FlxG.switchState(new PlayState);
            }
        }
    }
}
