package
{
    import flash.utils.Dictionary;
    import org.flixel.*;
    [SWF(width="640", height="480", backgroundColor="#ffffff")]

    public class HelloWorld extends FlxGame
    {
        [Embed(source="../assets/level1.png")] public var level1PNG:Class;
        [Embed(source="../assets/level2.png")] public var level2PNG:Class;

        public function HelloWorld()
        {
            FlxG.level = 1;

            FlxG.levels = new Array(2);

            FlxG.levels[0] = new Dictionary();
            FlxG.levels[0]["levelPNG"] = level1PNG;

            FlxG.levels[1] = new Dictionary();
            FlxG.levels[1]["levelPNG"] = level2PNG;

            super(320,240,PlayState,2);
        }
    }
}

