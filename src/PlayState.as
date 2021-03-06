package
{
    import org.flixel.*;

    public class PlayState extends FlxState
    {
        public var ninja:Ninja;
        public var level:Level;

        override public function create():void
        {
            FlxG.levels[1] = Level1;
            FlxG.levels[2] = Level2;
            FlxG.levels[0] = LevelTestClimbing;
            FlxG.level = 0;
            initLevel();
        }

        public function initLevel():void
        {
            clear();
            
            level = new FlxG.levels[FlxG.level]();
            add(level);

            ninja = new Ninja(level);
            level.ninja = ninja;

            ninja.x = level.spawn.x;
            ninja.y = level.spawn.y;
            add(ninja);
            add(ninja.sword);

            FlxG.camera.follow(ninja, FlxCamera.STYLE_PLATFORMER)
            FlxG.camera.bounds = FlxG.worldBounds;
        }

        public function overlapBaddies(o1:FlxObject, o2:FlxObject):void
        {
            o2.kill();
        }

        override public function update():void
        {
            super.update();

            if(FlxG.keys.justPressed("F1"))
            {
                FlxG.debug = !FlxG.debug;
                FlxG.visualDebug = !FlxG.visualDebug;
            }
            if(FlxG.keys.justPressed("F2"))
            {
                FlxG.level = (FlxG.level + 1) % FlxG.levels.length;
                initLevel();
                return
            }

            FlxG.collide(level.tilemap, ninja);
            FlxG.collide(level.tilemap, level.baddies);

            if(level.instantDeath) 
            {
                if(FlxG.collide(level.instantDeath, ninja))
                {
                    FlxG.camera.flash();
                    initLevel();
                }
            }

            if(FlxG.overlap(ninja, level.baddies))
            {
                // you dead
                initLevel();
            }

            if(ninja.sword._attackframe > 0) 
            {
                FlxG.overlap(ninja.sword, level.baddies, overlapBaddies)
            }

            if(FlxG.overlap(level.exit, ninja)) 
            {
                FlxG.level = (FlxG.level + 1) % FlxG.levels.length;
                initLevel();
            }
        }
    }
}
