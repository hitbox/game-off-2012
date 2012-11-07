package
{
    import org.flixel.*;

    public class Level2 extends Level
    {
        [Embed(source="../assets/level2-tilemap.png")] public var tilemapPNG:Class;
        [Embed(source="../assets/level2-instant-death.png")] public var instantDeathPNG:Class;
        [Embed(source="../assets/level2-autotiles.png")] public var autotilesPNG:Class;

        public function Level2(target:FlxObject=null)
        {
            super();

            tilemap = new FlxTilemap();
            // NOTE: autotilemap is 8x8 tiles
            tilemap.loadMap(FlxTilemap.imageToCSV(tilemapPNG),
                            FlxTilemap.ImgAuto, 0, 0, FlxTilemap.AUTO);
            FlxG.worldBounds = tilemap.getBounds();
            add(tilemap);

            instantDeath = new FlxTilemap();
            instantDeath.loadMap(FlxTilemap.imageToCSV(instantDeathPNG), 
                                 autotilesPNG, 0, 0, FlxTilemap.AUTO)
            add(instantDeath);

            spawn = new FlxSprite(3 * 8, 2 * 8);
            spawn.makeGraphic(8, 8, 0xff00ff00);
            add(spawn);

            exit = new FlxSprite(118 * 8, 7 * 8)
            exit.makeGraphic(8, 16, 0xff0000ff);
            add(exit);
        }
    }
}
