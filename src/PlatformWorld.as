package src
{
    import net.flashpunk.Entity;
    import net.flashpunk.FP;
    import net.flashpunk.World;
    
    /**
     * A sample platform level
     */
    public class PlatformWorld extends World 
    {
        private var player:Player = new Player(100,100);
        private var cameraentity:CameraEntity = new CameraEntity(0, 0);
        
        /**
         * Constructor
         */
        public function PlatformWorld() 
        {
            // Add the Player Character
            add(player);
            
            // Add the camera
            cameraentity.follow(player);
            add(cameraentity);
            
            // Camera Walls
            add(new CameraWall(0, 0, 1024, 0));
            add(new CameraWall(0, 0, 0, 1024));
            
            // Add top and bottom walls
            for (var i:int = 0; i < 13; i++) 
            {
                //add(new Wall(i, 0));
                add(new Wall(i, 6));
            }
            
            // Add left and right walls
            for (i = 0; i < 14; i++) 
            {
                add(new Wall(0, i));
                add(new Wall(13, i));
            }
            
            // A block in the middle to act as a platform
            add(new Wall(5, 4));
        }
        
        /**
         * Update the entities each frame
         */
        override public function update():void
        {
            super.update();
            
            // This is to ensure the camera refers to the updated states of the 
            // entities for this frame otherwise the camera will behave
            // unexpectedly, like have jerky movement.
            cameraentity.updateCamera();
        }
    }
}

