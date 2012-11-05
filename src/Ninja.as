package
{
    import org.flixel.*;

    public class Ninja extends FlxSprite
    {
        public var sword:Sword;

        public function Ninja()
        {
            super();
            makeGraphic(10, 12, 0xffaa1111);
            maxVelocity.x = 120;
            maxVelocity.y = 400;
            acceleration.y = 400;
            drag.x = maxVelocity.x*4;

            sword = new Sword(this)
        }

        override public function update():void
        {
            acceleration.x = 0;
            if(FlxG.keys.LEFT) {
                acceleration.x = -maxVelocity.x*4;
                facing = LEFT;
            }
            if(FlxG.keys.RIGHT) {
                acceleration.x = maxVelocity.x*4;
                facing = RIGHT;
            }
            if(FlxG.keys.justPressed("UP") && isTouching(FlxObject.FLOOR)) {
                velocity.y = -maxVelocity.y / 2;
            }
            if(FlxG.keys.justPressed("Z")) {
                sword.attack();
            }

            sword.update();
            super.update();
        }
    }
}
