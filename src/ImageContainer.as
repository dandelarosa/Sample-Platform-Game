package src
{
    import net.flashpunk.graphics.Image;
    
    /**
     * Any non-spritemap image assets are stored and taken from this object
     */
    public class ImageContainer
    {	
        [Embed(source='../assets/wall.png')]
        private const WALL:Class;
        
        // This class is a singleton.
        private static var singleton:ImageContainer = new ImageContainer();
        
        /**
         * Get the singleton instance of ImageContainer
         */
        public static function getInstance():ImageContainer
        {
            return singleton;
        }
        
        /**
         * Get the image mapped to the given key
         */
        public function getImage(key:String):Image
        {
            switch(key)
            {
                case "Wall":
                {
                    return new Image(WALL);
                }
                
                default:
                {
                    return null;
                }
            }
        }
    }
}

