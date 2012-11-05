package
{
    import org.flixel.*;

    public class Sword extends FlxSprite
    {
        public var _ninja:Ninja;
        public var _attackframe:Number;

        public function Sword(ninja:Ninja)
        {
            super();
            makeGraphic(10, 5, 0xffffffff);

            _ninja = ninja;
            _attackframe = 0;
        }

        public function attack():void {
            if(_attackframe > 0)
                return

            _attackframe = 15;
        }

        override public function update():void
        {
            if(_attackframe > 0) {
                _attackframe -= 1;
            }
            visible = _attackframe > 0;

            if(_ninja.facing == RIGHT) {
                x = _ninja.x + _ninja.width;
            } else {
                x = _ninja.x - width;
            }
            y = _ninja.y;

            super.update();
        }
    }
}
