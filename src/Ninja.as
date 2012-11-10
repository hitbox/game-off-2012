package
{
    import org.flixel.*;

    public class Ninja extends FlxSprite
    {
        public var sword:Sword;
        public var jumpFrame:Number;

        public var climbing:Boolean;
        public var grabObject:FlxObject;

        public var level:Level;

		static public const CLIMB_SPEED:Number = 80;

        public var upKey:String = "UP";
        public var downKey:String = "DOWN";
        public var leftKey:String = "LEFT";
        public var rightKey:String = "RIGHT";

        public var jumpKey:String = "Z";
        public var attackKey:String = "X";

        public function Ninja(level:Level)
        {
            super();
            this.level = level;

            makeGraphic(10, 12, 0xffaaaaaa);
            maxVelocity.x = 120;
            maxVelocity.y = 400;
            drag.x = maxVelocity.x*4;

            sword = new Sword(this);

            climbing = false;
            grabObject = new FlxObject(x - 1, y, width + 3, height);

            level.add(grabObject);

            jumpFrame = 0;
        }

        override public function update():void
        {
            //grabObject.x = x - 1;
            //grabObject.y = y;

            //FlxG.collide(grabObject, level.tilemap);

            if(!climbing && !isTouching(FLOOR) && justTouched(WALL))
            {
                climbing = true;
            }

            if(climbing)
            {
                acceleration.y = 0;
                velocity.y = 0;

                if(FlxG.keys.pressed(upKey) 
                    && grabObject.overlapsAt(x - 1, y + -10, level.tilemap))
                {
                    velocity.y = -CLIMB_SPEED;
                }
                else if(FlxG.keys.pressed(downKey) 
                    && grabObject.overlapsAt(x - 1, y + 10, level.tilemap))
                {
                    velocity.y = CLIMB_SPEED;
                }

                if(FlxG.keys.justPressed(jumpKey))
                {
                    if(facing == RIGHT)
                    {
                        velocity.x = -maxVelocity.x*2;
                    }
                    else if(facing == LEFT)
                    {
                        velocity.x = maxVelocity.x*2;
                    }

                    jumpFrame = 8;
                    climbing = false;
                }
            }

            if(!climbing)
            {
                acceleration.y = 400;
                acceleration.x = 0;
                if(FlxG.keys.pressed(leftKey))
                {
                    acceleration.x = -maxVelocity.x*4;
                    facing = LEFT;
                }
                if(FlxG.keys.pressed(rightKey))
                {
                    acceleration.x = maxVelocity.x*4;
                    facing = RIGHT;
                }

                if(FlxG.keys.justPressed(jumpKey) && isTouching(FlxObject.FLOOR))
                {
                    jumpFrame = 10;
                }
                else if(jumpFrame > 0 && FlxG.keys.pressed(jumpKey))
                {
                    velocity.y += -5 * jumpFrame;
                }
                else if(!FlxG.keys.X)
                {
                    jumpFrame = 0;
                }

                if(jumpFrame > 0)
                {
                    jumpFrame--;
                }
            }

            if(FlxG.keys.justPressed(attackKey))
            {
                sword.attack();
            }
            sword.update();
            super.update();
        }
    }
}
