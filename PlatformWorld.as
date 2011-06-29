package {
	import net.flashpunk.FP;
	import net.flashpunk.World;
	
	/**
	 * A sample platform level
	 */
	public class PlatformWorld extends World 
	{
	    private var player:Player = new Player(100,100);
	
	    /**
	     * Constructor
	     */
		public function PlatformWorld() 
		{
		    // Add the Player Character
		    add(player);
		    
		    // Add top and bottom walls
		    for (var i:int = 0; i < 7; i++) 
			{
				add(new Wall(i, 0));
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
		    
		    // Have the camera centered on the player
			FP.camera.x = player.x - FP.halfWidth;
			FP.camera.y = player.y - FP.halfHeight;
	    }
	}
}
