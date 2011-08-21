package src
{
    import net.flashpunk.Entity;
    
    /**
     * A goal object that ends the level
     */
    public class Goal extends Entity 
    {	
        /**
         * Constructor
         */
        public function Goal(posX:int,posY:int) 
        {
            var imagecontainer:ImageContainer = ImageContainer.getInstance();
            graphic = imagecontainer.getImage("Wall");
            setHitbox(32, 32);
            type = "goal"; 
            x = posX * 32;
            y = posY * 32;
        }
    }
}

