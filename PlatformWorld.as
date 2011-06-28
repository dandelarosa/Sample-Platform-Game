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
		    add(new Player);
			for (var i:int=0; i<20; i++) 
			{
				add(new Wall(i,0));
				add(new Wall(i,14));
			}
			for (i=0; i<14; i++) 
			{
				add(new Wall(0,i));
				add(new Wall(19,i));
			}
			for (i=1; i<5; i++) 
			{
				add(new Wall(5-i,14-i));
				add(new Wall(8+i,5+i));
				add(new Wall(2+i,10-i));
				add(new Wall(13+i,8-i));
			}
		}
	}
}
