package
{
    import org.flixel.*;

    public class Boxer extends FlxSprite
    {
        public function Boxer(X:Number=0, Y:Number=0)
        {
            super(X,Y);
            makeGraphic(10, 12, 0xffff0000);
        }

        override public function update():void
        {
            super.update();
        }
    }
}
