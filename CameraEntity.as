package
{
    import net.flashpunk.Entity;
    import net.flashpunk.FP;
    
    /**
	 * The camera management object
	 */
	public class CameraEntity extends Entity 
	{
	    private var followedEntity:Entity = null;
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
		 * Update player state each frame
		 */
		override public function update():void 
		{
		    if (followedEntity != null)
		    {   
		        // Determine X camera speed
		        if(Math.abs(followedEntity.x - this.x) > cameraThresholdX)
		        {
		            xSpeed = followedEntity.x - this.x;
		            xSpeed = FP.clamp(xSpeed, -xSpeedMax, xSpeedMax);
		        }
		        else
		        {
		            xSpeed = 0;
		        }
		        
		        // Determine Y camera speed
		        if(Math.abs(followedEntity.y - this.y) > cameraThresholdY)
		        {
		            ySpeed = followedEntity.y - this.y;
		            ySpeed = FP.clamp(ySpeed, -ySpeedMax, ySpeedMax);
		        }
		        else
		        {
		            ySpeed = 0;
		        }
		        
		        // Move camera by the above speeds, barring collisions
		        moveBy(xSpeed, ySpeed, "cameraWall");
		        
		        // Have the screen centered on the camera
		        FP.camera.x = this.x - FP.halfWidth;
			    FP.camera.y = this.y - FP.halfHeight;
			    //FP.console.log(this.x, this.y, this.centerX, this.centerY);
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
