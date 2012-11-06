package
{
    import org.flixel.*;

    public class Level1 extends Level
    {
        [Embed(source="../assets/level1.png")] public var tilemapPNG:Class;

        public function Level1()
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
