package 
{
	import net.flashpunk.Entity;
	
	/**
	 * A wall object that blocks movement
	 */
	public class Wall extends Entity 
	{	
		/**
		 * Constructor
		 */
		public function Wall(posX:int,posY:int) 
		{
		    var imagecontainer:ImageContainer = ImageContainer.getInstance();
			graphic = imagecontainer.getImage("Wall");
			setHitbox(32, 32);
			type = "wall"; 
			x = posX * 32;
			y = posY * 32;
		}
	}
}
