package
{
    // for some reason this will NOT work when named "Walker"
    import org.flixel.*;

    public class WalkerDude extends Baddy
    {
        public var walkSpeed:Number;

        public function WalkerDude(Target:FlxObject=null,
                                   X:Number=0,Y:Number=0,
                                   WalkSpeed:Number=20)
        {
            super(Target,X,Y);
            makeGraphic(8, 8, 0xffffbb00);

            acceleration.y = 400;
            facing = LEFT;

            walkSpeed = WalkSpeed;
        }

        override public function update():void
        {
            if(justTouched(FlxObject.LEFT))
            {
                facing = FlxObject.RIGHT;
            }
            else if(justTouched(FlxObject.RIGHT))
            {
                facing = LEFT;
            }

            if(facing == RIGHT)
            {
                velocity.x = walkSpeed;
            }
            else if(facing == LEFT)
            {
                velocity.x = -walkSpeed;
            }
            super.update();
        }
    }
}
