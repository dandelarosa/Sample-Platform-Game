package src
{
    import net.flashpunk.Entity;
    
    /**
     * An object that blocks camera movement
     */
    public class CameraWall extends Entity
    {
        /**
         * Constructor
         */
        public function CameraWall(x:Number = 0, y:Number = 0, 
                width:Number = 0, height:Number = 0) 
        {
            setHitbox(width, height);
            this.x = x;
            this.y = y;
            this.type = "cameraWall";
        }
    }
}
