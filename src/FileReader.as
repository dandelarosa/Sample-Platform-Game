package src
{
    // Can't use flash.net.URLLoader (Needs to read from local file)
    // Can't use flash.net.FileReference (Needs to read file without bringing up file selector)
    // Can't use flash.filesystem.* (No AIR runtime on Linux)
    import flash.events.*;
    import flash.net.*;
    import net.flashpunk.FP;
    
    /**
     * Utilities to read local files
     */
    public class FileReader
    {
        public static function readTextFile(filename:String):String
        {
            return "Hi!";
        }
    }
}
