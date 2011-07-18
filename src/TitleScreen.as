package src
{
    import net.flashpunk.Entity;
    import net.flashpunk.World;
    import net.flashpunk.FP;
    import net.flashpunk.utils.Input;
    import net.flashpunk.utils.Key;
    import net.flashpunk.graphics.Text;
    
    /**
     * The game's title screen
     */
    public class TitleScreen extends World
    {
        /**
         * Constructor
         */
        public function TitleScreen() 
        {
            var titleText:Text = new Text("Press X to Start");
            var textEntity:Entity = new Entity(0, 0, titleText);
            textEntity.x = (FP.width / 2) - (titleText.width / 2);
            textEntity.y = (FP.height *  0.25) - (titleText.height / 2);
            add(textEntity);
            
            var splashText:Text = new Text("GAME NAME", 0, 0, 640, 480);
            splashText.color = 0x00ff00;
            splashText.size = 32;
            var splashEntity:Entity = new Entity(0, 0, splashText);
            splashEntity.x = (FP.width / 2) - (splashText.width / 2);
            textEntity.y = (FP.height / 2) - (titleText.height / 2);
            add(splashEntity);
        }
        
        /**
         * Update state each frame
         */
        override public function update():void
        {
            super.update();
            if (Input.check(Key.X))
            {
                FP.screen.color = 0x222233;
                FP.world = new PlatformWorld();
            }
        }
    }
}

