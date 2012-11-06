package
{
    import org.flixel.*;

    public class Boxer extends FlxSprite
    {
        public function Boxer(X:Number=0, Y:Number=0)
        {
            super(X,Y);
            makeGraphic(8, 8, 0xffff0000);
        }

        override public function update():void
        {
            super.update();
        }
    }
}
