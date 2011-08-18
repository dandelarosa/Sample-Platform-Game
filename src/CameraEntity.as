package src
{
    import net.flashpunk.Entity;
    import net.flashpunk.FP;
    
    /**
     * The camera management object
     */
    public class CameraEntity extends Entity 
    {
        private var followedEntity:IFollowableEntity = null;
        private var xSpeed:Number = 0;
        private var ySpeed:Number = 0;
        private var xSpeedMax:Number = 100;
        private var ySpeedMax:Number = 100;
        
        /*
         * Right now the only camera functionality that works correctly is:
         *  - Camera centers on the player (or other specified entity)
         *  - "Camera Walls" that restrict the camera so that the camera won't,
              for intstance, pan past the beginning or end of the level
         */
        /*
         * The camera was planned to have more customizability, like detecting 
         * whether the distance between the player and the camera reaches a 
         * certain threshold before having the camera move. However, this lead 
         * to several problems, such as the camera having jerky movement or 
         * smooth movement that didn't react very quickly to player movement. 
         * Therefore, such functionality will be disabled until it can be
         * implemented correctly.
         */
        private var cameraStillX:Boolean = true;
        private var cameraStillY:Boolean = true;
        private var cameraThresholdX:Number = 0;
        private var cameraThresholdY:Number = 0;
        private var cameraAccelerationX:Number = 0.5;
        private var cameraAccelerationY:Number = 0.5;
         
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
        public function follow(theEntity:IFollowableEntity):void
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
                xSpeed = followedEntity.getX() - this.centerX;
                xSpeed = FP.clamp(xSpeed, -xSpeedMax, xSpeedMax);
                /*if (followedEntity.getX() - this.centerX == 0 && xSpeed == 0)
                {
                    cameraStillX = true;
                }
                else
                {
                    if (followedEntity.getX() - this.centerX > cameraThresholdX 
                            && followedEntity.getXSpeed() > 0
                            || followedEntity.getX() - this.centerX 
                            < -cameraThresholdX 
                            && followedEntity.getXSpeed() < 0)
                    {
                        cameraStillX = false;
                    }
                    if (!cameraStillX)
                    {
                        if (Math.abs(followedEntity.getX() - this.centerX) 
                                < Math.abs(this.xSpeed))
                        {
                            xSpeed = followedEntity.getX() - this.centerX;
                        }
                        else if (Math.abs(followedEntity.getXSpeed() - this.xSpeed) 
                                < cameraAccelerationX)
                        {
                            xSpeed = followedEntity.getXSpeed();
                        }
                        else if (followedEntity.getX() - this.centerX < 0)
                        {
                            xSpeed -= cameraAccelerationX;
                        }
                        else
                        {
                            xSpeed += cameraAccelerationX;
                        }
                        xSpeed = FP.clamp(xSpeed, -xSpeedMax, xSpeedMax);
                    }
                    else
                    {
                        xSpeed = 0;
                    }
                }*/
                
		        // Determine Y camera speed
		        ySpeed = followedEntity.getY() - this.centerY;
                ySpeed = FP.clamp(ySpeed, -ySpeedMax, ySpeedMax);
                /*if (followedEntity.getY() - this.centerY == 0 && ySpeed == 0)
                {
                    cameraStillY = true;
                }
                else
                {
                    if (followedEntity.getY() - this.centerY > cameraThresholdY 
                            && followedEntity.getYSpeed() > 0
                            || followedEntity.getY() - this.centerY 
                            < -cameraThresholdY 
                            && followedEntity.getYSpeed() < 0)
                    {
                        cameraStillY = false;
                    }
                    if (!cameraStillY)
                    {
                        if (Math.abs(followedEntity.getY() - this.centerY) 
                                < Math.abs(this.ySpeed))
                        {
                            ySpeed = followedEntity.getY() - this.centerY;
                        }
                        else if (Math.abs(followedEntity.getYSpeed() - this.ySpeed) 
                                < cameraAccelerationY)
                        {
                            ySpeed = followedEntity.getYSpeed();
                        }
                        else if (followedEntity.getY() - this.centerY < 0)
                        {
                            ySpeed -= cameraAccelerationY;
                        }
                        else
                        {
                            ySpeed += cameraAccelerationY;
                        }
                        ySpeed = FP.clamp(ySpeed, -ySpeedMax, ySpeedMax);
                    }
                    else
                    {
                        ySpeed = 0;
                    }
                }*/
                
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
        override public function moveCollideX(e:Entity):Boolean
        {
            xSpeed = 0;
            cameraStillX = true;
            return true;
        }
        
        /**
         * Process collisions while moving in the y direction
         */
        override public function moveCollideY(e:Entity):Boolean
        {
            ySpeed = 0;
            cameraStillX = true;
            return true;
        }
    }
}

