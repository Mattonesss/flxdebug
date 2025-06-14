package util;

#if html5
import js.Browser;
#end

class DebugUtil
{
    public static function setWindowTitle(title:String):Void
    {
        #if desktop
        openfl.Lib.current.stage.window.title = title;
        #elseif html5
        js.Browser.document.title = title;
        #else
        trace("'setWindowTitle' is not available on this platform.");
        #end
    }

    public static function setWindowPosition(x:Int, y:Int):Void
    {
        #if desktop
        openfl.Lib.current.stage.window.x = x;
        openfl.Lib.current.stage.window.y = y;
        #elseif html5
        trace("'setWindowPosition' is not available on this platform.");
        #end
    }
}
