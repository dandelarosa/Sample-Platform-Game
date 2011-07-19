package src
{
    import net.flashpunk.Entity;
    import net.flashpunk.FP;
    import net.flashpunk.graphics.Spritemap;
    import net.flashpunk.utils.Input;
    import net.flashpunk.utils.Key;
    
    /**
     * Player character for a platform game
     */
    public class Player extends Entity implements IFollowableEntity
    {        
        // Variables related to X velocity
        private var xSpeed:Number = 0;
        private var runAcceleration:Number = 0.2;
        private var maxRunningSpeed:Number = 5;
        private var groundDeceleration:Number = 0.5;
        private var airAcceleration:Number = 0.1;
        private var maxAirSpeed:Number = 2;
        private var airDeceleration:Number = 0;
        
        // Variables related to Y velocity
        private var ySpeed:Number = 0;
        private var gravity:Number = 0.3;
        private var initialJumpSpeed:Number = 5;
        private var maxFallingSpeed:Number = 5;
        
        // Multi-jump functionality
        private var extraJumps:int = 0;
        private var maxExtraJumps:int = 2;
        
        // Player spritemap
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
            if (collide("wall", x, y + 1))
            {
                // Player is on the ground
                if (Input.check(Key.LEFT))
                {
                    xSpeed -= runAcceleration;
                }
                else if (Input.check(Key.RIGHT)) 
                {
                    xSpeed += runAcceleration;
                }
                else if (Math.abs(xSpeed) < groundDeceleration)
                {
                    // If the speed is close enough to zero, set it to zero
                    // without needing the ground deceleration to take over
                    xSpeed = 0;
                }
                else 
                {
                    // Have ground friction take over
                    if (xSpeed > 0)
                    {
                        xSpeed -= groundDeceleration;
                    }
                    else
                    {
                        xSpeed += groundDeceleration;
                    }
                }
                xSpeed = FP.clamp(xSpeed, -maxRunningSpeed, maxRunningSpeed);
            }
            else
            {
                // Player is in the air
                if (Input.check(Key.LEFT))
                {
                    xSpeed -= airAcceleration;
                }
                else if (Input.check(Key.RIGHT)) 
                {
                    xSpeed += airAcceleration;
                }
                else if (Math.abs(xSpeed) < airDeceleration)
                {
                    // If the speed is close enough to zero, set it to zero
                    // without needing the ground deceleration to take over
                    xSpeed = 0;
                }
                else 
                {
                    // Have ground friction take over
                    if (xSpeed > 0)
                    {
                        xSpeed -= airDeceleration;
                    }
                    else
                    {
                        xSpeed += airDeceleration;
                    }
                }
                xSpeed = FP.clamp(xSpeed, -maxAirSpeed, maxAirSpeed);
            }

            // Calculate new y velocity
            if (collide("wall", x, y + 1))
            {
                // Player is on the ground
                ySpeed = 0;
                extraJumps = 0;
                
                // Player jumps from ground
                if (Input.pressed(Key.UP))
                {
                    ySpeed = -initialJumpSpeed;
                }
            }
            else if (Input.pressed(Key.UP) && extraJumps < maxExtraJumps)
            {
                // Jump in mid-air (if allowed to)
                ySpeed = -initialJumpSpeed;
                extraJumps++;
            }
            else
            {
                // In all other cases, just free-fall
                ySpeed += gravity;
                if (ySpeed > maxFallingSpeed)
                {
                    ySpeed = maxFallingSpeed;
                }
            }
            
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
        
        /**
         * Get the player's x position
         */
        public function getX():Number
        {
            return this.x;
        }
        
        /**
         * Get the player's y position
         */
        public function getY():Number
        {
            return this.y;
        }
        
        /**
         * Get the player's x speed
         */
        public function getXSpeed():Number
        {
            return this.xSpeed;
        }
        
        /**
         * Get the player's y speed
         */
        public function getYSpeed():Number
        {
            return this.ySpeed
        }
    }
}

