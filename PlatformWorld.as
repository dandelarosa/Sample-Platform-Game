package {
	import net.flashpunk.World;
	
	/**
	 * A sample platform level
	 */
	public class PlatformWorld extends World 
	{
	    /**
	     * Constructor
	     */
		public function PlatformWorld() 
		{
		    // Add the Player Character
		    add(new Player(100, 100));
		    
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
	}
}
