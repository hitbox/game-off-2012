package
{
    import org.flixel.*;

    public class PlayState extends FlxState
    {
        [Embed(source="../assets/level-test.png")] public var levelTestPNG:Class;

        public var level:FlxTilemap;
        public var player:FlxSprite;

        override public function create():void
        {
            // NOTE: autotilemap is 8x8 tiles
            level = new FlxTilemap();
            level.loadMap(FlxTilemap.imageToCSV(levelTestPNG),
                          FlxTilemap.ImgAuto, 0, 0, FlxTilemap.AUTO);
            FlxG.worldBounds = level.getBounds()
            add(level)

            player = new FlxSprite(FlxG.width / 2 - 5);
            player.y += 100
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
        }
    }
}
