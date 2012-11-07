package
{
    import org.flixel.*;

    public class Boxer extends Baddy
    {
        //public var sight:FlxObject;
        public var sight:FlxSprite;

        public var jumped:Boolean;
        public var jumpVelocity:FlxPoint;

        public function Boxer(Target:FlxObject, X:Number=0, Y:Number=0)
        {
            super(Target,X,Y);
            makeGraphic(8, 8, 0xffff0000);

            maxVelocity.x = 120;
            maxVelocity.y = 400;
            acceleration.y = 400;
            drag.x = maxVelocity.x * 2;

            facing = LEFT;

            //sight = new FlxObject(0,0,30,8);
            sight = new FlxSprite(x,y);
            sight.makeGraphic(30, 8, 0xffaaffaa);

            jumpVelocity = new FlxPoint(100, -maxVelocity.y / 4);
            jumped = false;
        }

        override public function kill():void
        {
            sight.kill();
            super.kill();
        }

        override public function update():void
        {
            if(facing == RIGHT)
            {
                sight.x = x + width;
            }
            else if(facing == LEFT)
            {
                sight.x = x - sight.width;
            }
            sight.y = y;

            if(!jumped && FlxG.overlap(sight, target))
            {
                jumped = true;
                // lunge at target
                if(facing == RIGHT)
                {
                    velocity.x = jumpVelocity.x;
                    velocity.y = jumpVelocity.y;
                    //velocity.x = jumpVelocity;
                }
                else
                {
                    velocity.x = -jumpVelocity.x;
                    velocity.y = jumpVelocity.y;
                }
            }

            if(justTouched(FlxObject.RIGHT))
            {
                facing = LEFT;
            }
            else if (justTouched(FlxObject.LEFT))
            {
                facing = RIGHT;
            }
            else if (justTouched(FlxObject.FLOOR))
            {
                jumped = false;
            }

            super.update();
        }
    }
}
