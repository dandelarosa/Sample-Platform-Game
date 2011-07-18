package
{
    import src.SamplePlatformGame;
    
    /**
     * The release compile instructions for the game
     */
    public class Release extends SamplePlatformGame
    {
        /**
         * Constructor
         */
        public function Release()
        {
            super();
        }
        
        override public function init():void
        {
            super.init();
            
            // Invoke the MochiBot tracker
            MochiBot.track(this, "6f3254be");
        }
    }
}

