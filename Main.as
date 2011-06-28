package 
{
	import net.flashpunk.Engine;
	import net.flashpunk.FP;
	
	/**
	 * Platformer Engine
	 */
	public class Main extends Engine 
	{
	    /**
	     * Constructor
	     */
		public function Main() 
		{
		    // For a game like a platformer we want have to a fixed framerate
		    // so that collision detection can be more precise.
			super(640,480,60,true);
		}
		
		/**
		 * To be called after the engine is created
		 */
		override public function init():void 
		{	
			FP.screen.color = 0x222233;
			FP.world=new PlatformWorld();
			
			// Invoke the MochiBot tracker
			MochiBot.track(this, "6f3254be");
		}
	}
}
