package 
{
    import net.flashpunk.Engine;
    import net.flashpunk.FP;
    
    // SWF Export attributes
    [SWF(width = "512", height = "448", frameRate = "60")]
    
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
            // Framerate is set to 30fps to run on netbooks and older hardware.
            super(256, 224, 30, true);
        }
        
        /**
         * To be called after the engine is created
         */
        override public function init():void 
        {	
            FP.screen.color = 0x332222;
            FP.screen.scale = 2;
            FP.world = new TitleScreen();
            
            FP.console.enable();
            
            // Invoke the MochiBot tracker
            MochiBot.track(this, "6f3254be");
        }
    }
}

