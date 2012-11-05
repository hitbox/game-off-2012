package
{
    import flash.utils.Dictionary;
    import org.flixel.*;

    public class Ninja extends FlxSprite
    {
        public var ninja:FlxSprite;

        public function Ninja()
        {
            super(FlxG.width / 2 - 5);
            makeGraphic(10, 12, 0xffaa1111);
            maxVelocity.x = 120;
            maxVelocity.y = 400;
            acceleration.y = 400;
            drag.x = maxVelocity.x*4;
        }

        override public function update():void
        {
            acceleration.x = 0;
            if(FlxG.keys.LEFT)
                acceleration.x = -maxVelocity.x*4;
            if(FlxG.keys.RIGHT)
                acceleration.x = maxVelocity.x*4;
            if(FlxG.keys.justPressed("UP") && isTouching(FlxObject.FLOOR))
                velocity.y = -maxVelocity.y / 2;

            super.update();
        }
    }
}
