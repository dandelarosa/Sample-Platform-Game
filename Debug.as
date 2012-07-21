package
{
    import net.flashpunk.FP;
    import src.FileReader;
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
            var file:FileReader = new FileReader();
            //var fileContents:String = FileReader.readTextFile("sample.txt");
            //FP.console.log(fileContents);
        }
    }
}

