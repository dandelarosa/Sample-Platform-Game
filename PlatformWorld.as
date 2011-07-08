package {
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
		    var cwall:Entity = new Entity();
		    cwall.x = 0;
		    cwall.y = 0;
		    cwall.width = 1024;
		    cwall.height = 0;
		    cwall.type = "cameraWall";
		    add(cwall);
		    var cwall2:Entity = new Entity();
		    cwall2.x = 0;
		    cwall2.y = 0;
		    cwall2.width = 0;
		    cwall2.height = 1024;
		    cwall2.type = "cameraWall";
		    add(cwall2);
		    
		    // Add top and bottom walls
		    for (var i:int = 0; i < 7; i++) 
			{
				//add(new Wall(i, 0));
				add(new Wall(i, 6));
			}
			
			// Add left and right walls
			for (i = 0; i < 14; i++) 
			{
				add(new Wall(0, i));
				add(new Wall(7, i));
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
	    }
	}
}
