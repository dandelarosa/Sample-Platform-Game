package 
{
    import net.flashpunk.graphics.Spritemap;
    
    /**
     * Any sprite maps are stored and taken from this object
     */
    public class SpritemapContainer
    {	
        [Embed(source='assets/player.png')]
        private const PLAYER:Class;
        
        // This class is a singleton.
        private static var singleton:SpritemapContainer = 
                new SpritemapContainer();
        
        /**
         * Get the singleton instance of SpritemapContainer
         */
        public static function getInstance():SpritemapContainer
        {
            return singleton;
        }
        
        /**
         * Get the spritemap mapped to the given key
         */
        public function getSpritemap(key:String):Spritemap
        {
            switch(key)
            {
                case "Player":
                {
                    var playerSprite:Spritemap = new Spritemap(PLAYER,13,26);
                    playerSprite.add("goingLeft", [0], 1, false);
                    playerSprite.add("goingRight", [1], 1, false);
                    return playerSprite;
                }
                
                default:
                {
                    return null;
                }
            }
        }
    }
}

