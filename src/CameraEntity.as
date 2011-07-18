package src
{
    import net.flashpunk.Entity;
    import net.flashpunk.FP;
    
    /**
     * The camera management object
     */
    public class CameraEntity extends Entity 
    {
        private var followedEntity:Entity = null;
        private var cameraStillX:Boolean = true;
        private var cameraStillY:Boolean = true;
        private var cameraThresholdX:Number = 32;
        private var cameraThresholdY:Number = 32;
        private var xSpeed:Number = 0;
        private var ySpeed:Number = 0;
        private var xSpeedMax:Number = 5;
        private var ySpeedMax:Number = 2;
        
        /**
         * Constructor
         */
        public function CameraEntity(x:Number = 0, y:Number = 0) 
        {
            setHitbox(FP.width, FP.height);
            this.x = x;
            this.y = y;
        }
        
        /**
         * Tell the camera to follow the entity
         */
        public function follow(theEntity:Entity):void
        {
            followedEntity = theEntity;
        }
        
        /**
         * Update player state each frame - this is seperate from the standard
         * Entity's update function since it has to be called after all the 
         * other entities are updated.
         */
        public function updateCamera():void 
        {
            if (followedEntity != null)
            {   
                // Determine X camera speed
                if (followedEntity.x - this.centerX == 0)
                {
                    cameraStillX = true;
                }
                else
                {
                    if (Math.abs(followedEntity.x - this.centerX) 
                            > cameraThresholdX)
                    {
                        cameraStillX = false;
                    }
                    if (!cameraStillX)
                    {
                        xSpeed = followedEntity.x - this.centerX;
                        xSpeed = FP.clamp(xSpeed, -xSpeedMax, xSpeedMax);
                    }
                    else
                    {
                        xSpeed = 0;
                    }
                }
                
		        // Determine Y camera speed
                if (followedEntity.y - this.centerY == 0)
                {
                    cameraStillY = true;
                }
                else
                {
                    if (Math.abs(followedEntity.y - this.centerY) 
                            > cameraThresholdY)
                    {
                        cameraStillY = false;
                    }
                    if (!cameraStillY)
                    {
                        ySpeed = followedEntity.y - this.centerY;
                        ySpeed = FP.clamp(ySpeed, -ySpeedMax, ySpeedMax);
                    }
                    else
                    {
                        ySpeed = 0;
                    }
                }
                
                // Move camera by the above speeds, barring collisions
                moveBy(xSpeed, ySpeed, "cameraWall");
                
                // Have the screen centered on the camera
                FP.camera.x = this.x;
                FP.camera.y = this.y;
            }
        }
        
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

