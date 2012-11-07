package
{
    import org.flixel.*;

    public class Baddy extends FlxSprite
    {
        public var target:FlxObject;

        public function Baddy(Target:FlxObject=null,X:Number=0,Y:Number=0)
        {
            super(X,Y);
            target = Target;
        }

    }
}
