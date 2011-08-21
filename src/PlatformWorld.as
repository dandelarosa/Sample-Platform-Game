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
        private var deathRestartTimer:int = 0;
        private const deathRestartDelay:int = 30; // In frames
        
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
            add(new CameraWall(0, 0, 1024, 0)); // Top wall
            add(new CameraWall(0, 0, 0, 224)); // Leftmost wall
            add(new CameraWall(0, 224, 1024, 0)); // Bottom wall
            add(new CameraWall(1024, 0, 0, 224)); // Rightmost wall
            
            for (var i:int = 0; i < 32; i++) 
            {
                // Bottom Wall
                add(new Wall(i, 6));
            }
            
            for (i = 0; i < 7; i++) 
            {
                // Left wall
                add(new Wall(-1, i));
                // Right wall
                add(new Wall(32, i));
            }
            
            // A block in the middle to act as a platform
            //add(new Wall(5, 4));
            
            // Create an enemy
            add(new Enemy(512, 166));
        }
        
        /**
         * Update the entities each frame
         */
        override public function update():void
        {
            super.update();
            
            if(!player.isAlive)
            {
                if (deathRestartTimer < deathRestartDelay)
                {
                    deathRestartTimer++;
                }
                else
                {
                    FP.world = new PlatformWorld();
                }
            }
            
            // This is to ensure the camera refers to the updated states of the 
            // entities for this frame otherwise the camera will behave
            // unexpectedly, like have jerky movement.
            cameraentity.updateCamera();
        }
    }
}

