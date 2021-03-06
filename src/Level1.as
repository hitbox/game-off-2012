package
{
    import org.flixel.*;

    public class Level1 extends Level
    {
        [Embed(source="../assets/level1.png")] public var tilemapPNG:Class;

        public function Level1(ninja:Ninja)
        {
            super();

            tilemap = new FlxTilemap();
            // NOTE: autotilemap is 8x8 tiles
            tilemap.loadMap(FlxTilemap.imageToCSV(tilemapPNG),
                          FlxTilemap.ImgAuto, 0, 0, FlxTilemap.AUTO);

            FlxG.worldBounds = tilemap.getBounds();
            add(tilemap);

            spawn = new FlxSprite(8 * 3, 8 * 27);
            spawn.makeGraphic(8, 16, 0xff00ff00);
            add(spawn);

            exit = new FlxSprite(8 * 38, 8 * 1);
            exit.makeGraphic(8, 16, 0xff0000ff);
            add(exit);

            baddies = new FlxGroup();
            baddies.add(new WalkerDude(ninja, 17 * 8, 27 * 8));
            baddies.add(new WalkerDude(ninja, 18 * 8, 19 * 8));
            baddies.add(new WalkerDude(ninja, 28 * 8, 6 * 8));
            
            var i:uint = 0;
            while(i < baddies.length)
            {
                add(baddies.members[i]);
                i++;
            }
        }
    }
}
