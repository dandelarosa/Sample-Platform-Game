package
{
    import net.flashpunk.FP;
    import src.SamplePlatformGame;
    
    /**
     * The debug compile instructions for the game
     */
    public class Debug extends SamplePlatformGame
    {
        /**
         * Constructor
         */
        public function Debug()
        {
            super();
        }
        
        override public function init():void
        {
            super.init();
            
            // Use the FlashPunk debug console
            FP.console.enable();
        }
    }
}

