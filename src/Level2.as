package
{
    import org.flixel.*;

    public class Level2 extends Level
    {
        [Embed(source="../assets/level2.png")] public var tilemapPNG:Class;

        public function Level2()
        {
            super();

            tilemap = new FlxTilemap();
            // NOTE: autotilemap is 8x8 tiles
            tilemap.loadMap(FlxTilemap.imageToCSV(tilemapPNG),
                          FlxTilemap.ImgAuto, 0, 0, FlxTilemap.AUTO);
            FlxG.worldBounds = tilemap.getBounds();
            add(tilemap);
        }
    }
}
