package 
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	
	/**
	 * A wall object that blocks movement
	 */
	public class Wall extends Entity 
	{
	    // Embed wall graphic
		[Embed(source='assets/wall.png')]
		private const WALL:Class;
		
		/**
		 * Constructor
		 */
		public function Wall(posX:int,posY:int) 
		{
			graphic=new Image(WALL);
			setHitbox(32,32);
			type="wall"; 
			x=posX*32;
			y=posY*32;
		}
	}
}
