package
{
    import org.flixel.*;
    [SWF(width="640", height="480", backgroundColor="#ffffff")]

    public class Game extends FlxGame
    {
        public function Game()
        {
            super(320,240,PlayState,2);
        }
    }
}

