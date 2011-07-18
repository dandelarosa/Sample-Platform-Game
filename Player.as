package 
{
    import net.flashpunk.Entity;
    import net.flashpunk.FP;
    import net.flashpunk.graphics.Spritemap;
    import net.flashpunk.utils.Input;
    import net.flashpunk.utils.Key;
    
    /**
     * Player character for a platform game
     */
    public class Player extends Entity 
    {
        private var power:Number = 0.2;
        private var jumpPower:Number = 10;
        private var hFriction:Number = 0.95;
        private var vFriction:Number = 0.99;
        private var xSpeed:Number = 0;
        private var ySpeed:Number = 0;
        private var gravity:Number = 0.3;
        private var extraJumps:int = 0;
        private var maxExtraJumps:int = 2;
        private var playerSprite:Spritemap = null;
        
        /**
         * Constructor
         */
        public function Player(x:Number, y:Number) 
        {
            setHitbox(13,26);
            this.x = x;
            this.y = y;
            var spritemapcontainer:SpritemapContainer = 
                    SpritemapContainer.getInstance();
            playerSprite = spritemapcontainer.getSpritemap("Player");
            graphic = playerSprite;
        }
        
        /**
         * Update player state each frame
         */
        override public function update():void 
        {
            // To calculate new x velocity
            var pressed:Boolean = false;
            if (Input.check(Key.LEFT)) 
            {
                xSpeed -= power;
                pressed = true;
            }
            if (Input.check(Key.RIGHT)) 
            {
                xSpeed += power;
                pressed = true;
            }
            if (Math.abs(xSpeed) < 1 && !pressed) 
            {
                xSpeed = 0;
            }
            xSpeed *= hFriction;
            
            // Calculate new y velocity
            if (collide("wall", x, y + 1))
            {
                // Player is on the ground
                ySpeed = 0;
                extraJumps = 0;
                
                // Player jumps from ground
                if (Input.pressed(Key.UP))
                {
                    ySpeed = -jumpPower;
                }
            }
            else if (Input.pressed(Key.UP) && extraJumps < maxExtraJumps)
            {
                // Jump in mid-air (if allowed to)
                ySpeed = -jumpPower;
                extraJumps++;
            }
            else
            {
                // In all other cases, just free-fall
                ySpeed += gravity;
            }
            ySpeed *= vFriction;
            
            // Apply new speed, taking account collisions with walls
            moveBy(xSpeed, ySpeed, "wall");
            
            // Apply new image
            if(xSpeed > 0)
            {
                playerSprite.play("goingRight");
            }
            if(xSpeed < 0)
            {
                playerSprite.play("goingLeft");
            }
        }
        
        /*
        From ChevyRay:
        The moveBy() function will call these functions if it collides with a 
        "wall", and will actually also pass the wall instance they collide with 
        into them (e:Entity), so if you have further logic you want to evaluate 
        (eg. hitting on a trampoline if ySpeed > 0 and e is trampolineClass, 
        bounce) then you can do so.
        */
        
        /**
         * Process collisions while moving in the x direction
         */
        override public function moveCollideX(e:Entity):void
        {
            xSpeed = 0;
        }
        
        /**
         * Process collisions while moving in the y direction
         */
        override public function moveCollideY(e:Entity):void
        {
            ySpeed = 0;
        }
    }
}

