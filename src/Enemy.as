package src
{
    import net.flashpunk.Entity;
    import net.flashpunk.graphics.Spritemap;
    
    /**
     * Basic enemy object
     */
    public class Enemy extends Entity
    {
        // Variables related to X velocity
        private var xSpeed:Number = 0;
        
        // Variables related to Y velocity
        private var ySpeed:Number = 0;
        private var regularGravity:Number = 0.3;
        private var maxFallingSpeed:Number = 5;
        
        // Enemy spritemap
        private var enemySprite:Spritemap = null;
        
        /**
         * Constructor
         */
        public function Enemy(x:Number, y:Number) 
        {
            type = "enemy";
            setHitbox(13,26);
            this.x = x;
            this.y = y;
            var spritemapcontainer:SpritemapContainer = 
                    SpritemapContainer.getInstance();
            enemySprite = spritemapcontainer.getSpritemap("Player");
            graphic = enemySprite;
        }
        
        /**
         * Update enemy state each frame
         */
        override public function update():void 
        {
            xSpeed = -1;

            // Calculate new y velocity
            if (collide("wall", x, y + 1))
            {
                // Don't fall if there is a floor underneath
                ySpeed = 0;
            }
            else
            {
                // In all other cases, just free-fall
                ySpeed += regularGravity;
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
                enemySprite.play("goingRight");
            }
            if(xSpeed < 0)
            {
                enemySprite.play("goingLeft");
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
        override public function moveCollideX(e:Entity):Boolean
        {
            xSpeed = -xSpeed;
            return true;
        }
        
        /**
         * Process collisions while moving in the y direction
         */
        override public function moveCollideY(e:Entity):Boolean
        {
            ySpeed = 0;
            return true;
        }
    }
}

