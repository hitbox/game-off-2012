package
{
    import org.flixel.*;

    public class Ninja extends FlxSprite
    {
        public var sword:Sword;
        public var jumpFrame:Number;

        public function Ninja()
        {
            super();
            makeGraphic(10, 12, 0xffaaaaaa);
            maxVelocity.x = 120;
            maxVelocity.y = 400;
            acceleration.y = 400;
            drag.x = maxVelocity.x*4;

            sword = new Sword(this)

            jumpFrame = 0;
        }

        override public function update():void
        {
            acceleration.x = 0;
            if(FlxG.keys.LEFT)
            {
                acceleration.x = -maxVelocity.x*4;
                facing = LEFT;
            }
            if(FlxG.keys.RIGHT)
            {
                acceleration.x = maxVelocity.x*4;
                facing = RIGHT;
            }

            if(FlxG.keys.justPressed("UP") && isTouching(FlxObject.FLOOR))
            {
                jumpFrame = 10;
            }
            else if(jumpFrame > 0 && FlxG.keys.UP)
            {
                velocity.y += -5 * jumpFrame;
            }
            else if(!FlxG.keys.UP)
            {
                jumpFrame = 0;
            }

            if(jumpFrame > 0)
            {
                jumpFrame--;
            }

            if(FlxG.keys.justPressed("Z"))
            {
                sword.attack();
            }

            sword.update();
            super.update();
        }
    }
}
