package;

import Reflect;
import flixel.FlxG;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import haxe.Json;
import openfl.Lib;
import openfl.system.System;
import sys.io.File;
import sys.io.FileOutput;

/**
 * ## FlxDebug
 * FlxDebug can help developers to create their own games, with custom fps counters
 * and much more helpful things.
 *
 * I don't suggest to use this library if you want to create an html5
 * game, if you try the game can crash or have issues.
 * I suggest to use only desktop platforms.
 *
 * ## Read JSON File
 * If you want to read a json file you can use the readJSONFile function, you need to
 * insert the path of the file and what you want to receive from that file.
 * ```haxe
 * readJSONFile(filePath, receive)
 * ```
 * this read the file
 * and return the levelName info from the file.
 * This can be so helpful if you use json to create levels in your game.
 *
 * ## Create an FPS counter
 * If you want to add an fps counter on your haxeflixel game you can do it!
 * ```haxe
 * var fpsVar = new FlxDebug(x, y, textcolor, textfont)
 * ```
 * this fps counter display the fps, memory usage, state in use and the haxeflixel version.
 *
 * ## Save custom logs
 * If you want to save logs for your game you can easely do it with:
 * ```haxe
 * save_Log(message, level, path)
 * ```
 * in this case there are
 * three levels of logs: 'LOG, WARNING, ERROR', log is an normal log,
 * warning is an log that display an future error, and error can be a crash.
 *
 * ## Issues
 * If you find any strange bug in flxdebug you can add an issue on the official github page.
 *
 * ## Github Page
 * If you want you can see the github page for more examples of how to use flxdebug
 * @see https://github.com/Mattonesss/flxdebug/blob/main/src/FlxDebug.hx/
 * @version 1.2.0
 */
class FlxDebug extends FlxText
{
    /**
     * This function can help to pause and reactive the game in any moment.
     * NOTE: If there is any probrem try to report the issue on the github page
     * @see https://github.com/Mattonesss/flxdebug/blob/main/src/FlxDebug.hx/
     *
     * @since 1.2.0
     */
    static public function togglePause()
    {
        FlxG.pause = !FlxG.paused;
    }

    /**
     * This function can help to change a value from a json file from another one.
     *
     * NOTE: If the game crash try to see if you put the correct path of the file,
     * if continue to crash try to report the issue on the github page
     * @see https://github.com/Mattonesss/flxdebug/blob/main/src/FlxDebug.hx/
     *
     * @param  file    The file path.
     * @param  key     The information to change of the json file.
     * @param  value   The new value.
     *
     * @since 1.2.0
     */
    static public function changeJSONValue(file:String, key:String, value:String)
    {
        #if desktop
        var fileContent = File.getContent(file);
        var fileData = Json.parse(fileContent);
        Reflect.setField(fileData, key, value);

        var newContent = Json.stringify(fileData, null, "   ");
        File.saveContent(file, newContent);
        #else
        trace("`readJSONFile` is not avaible on this platform");
        #end
    }

    /**
     * This var contain the key that toggle the fps counter.
     * @since 1.2.0
     */
    static public var toggleKey:String = 'F1';

    /**
     * This function can help developers to read Json file.
     * This can also help to have more space in the code.
     *
     * NOTE: If the game crash try to see if you put the correct path of the file.
     *
     * @param  file    The file path.
     * @param  receive The information that you want to receive from the file.
     * @return The value of the information of the json file.
     *
     * @since 1.2.0
     */
    static public function readJSONFile(file:String, receive:String)
    {
        #if desktop
        var fileContent = File.getContent(file);
        var fileData = Json.parse(fileContent);
        return Reflect.field(fileData, receive);
        #else
        trace("`readJSONFile` is not avaible on this platform");
        #end
    }

    /**
     * The fps var is used to be visualized as a text in the game.
     * But it can be used for more. 'Default FPS: 60
     */
    static public var fps:Int;

    /**
     * This var is used for the default settings that first are to be setted and after you can apply them.
     */
    static public var settings_defaultFont:Null<String> = null;

    /**
     * This var is used for the default settings that first are to be setted and after you can apply them.
     */
    static public var settings_defaultSize:Null<Int> = null;

    /**
     * This var is used for the default settings that first are to be setted and after you can apply them.
     */
    static public var settings_defaultColor:Null<Int> = null;

    /**
     * This var is used for the default settings that first are to be setted and after you can apply them.
     */
    static public var settings_maxMemoryUsage:Null<Int> = null;

    /**
     * This var is used for the default settings that first are to be setted and after you can apply them.
     */
    static public var defaultFps:Null<Int> = null;

    /**
     * This var is used to be the principally font of the fps counter.
     */
    static public var defaultFont:Null<String> = null;

    /**
     * This var is used to be the default size of the fps counter.
     */
    static public var defaultSize:Null<Int> = null;

    /**
     / This var is used to be the default color of the fps counter.
     */
    static public var defaultColor:Int = null;

    /**
     * This var is used to be the default color of the fps counter when the ram usage is more than his limit.
     * @since 1.1.1
     */
    static public var redDefaultColor:Int = 0xFF0000;

    /**
     * This var is used to be the max memory usage, if the ram reach the var value the game try to lower the memory usage.
     */
    static public var maxMemoryUsage:Int = 1000;

    /**
     * If the fps in game are low than this value here the fps counter will be red.
     */
    static public var minFps:Int = 25;

    /**
     * The memory var is used to be displayed as a text in the game.
     * But it can be used for more.
     */
    static public var memory:Int;

    /**
     * The state var is a var that has a string value that display the actual state in use.
     * Like if you are in the PlayState state and use trace with this in the console appears PlayState, the name of the state in use.
     */
    static public var state:String;

    /**
     * This var display the version of haxeflixel in use.
     * Used on the fpsCounter.
     */
    static public var version:String;

    /**
     * This var is used to show and hide the fps counter with the F1 key.
     * Only if the fpsCounter is added.
     */
    var showFpsCounter:Bool = true;

    /**
     * The path of the data folder.
     * Used to not insert all the file destination.
     */
    static public var dataPath:String = "assets/data/";

    /**
     * The path of the images folder.
     * Used to not insert all the file destination.
     */
    static public var imagesPath:String = "assets/images/";

    /**
     * The path of the music folder.
     * Used to not insert all the file destination.
     */
    static public var musicPath:String = "assets/music/";

    /**
     * The path of the sound folder.
     * Used to not insert all the file destination.
     */
    static public var soundPath:String = "assets/sound/";

    /**
     * Returns the path of the file in the data folder.
     * Can be used to import graphics without insert all the destination of the file.
     * @since 1.1.0
     */
    static public function getDataPath(fileName:String):String
    {
        return (dataPath + fileName);
    }

    /**
     * Returns the path of the file in the images folder.
     * Can be used to import graphics without insert all the destination of the file.
     * @since 1.1.0
     */
    static public function getImagesPath(fileName:String):String
    {
        return (imagesPath + fileName);
    }

    /**
     * Returns the path of the file in the music folder.
     * Can be used to import graphics without insert all the destination of the file.
     * @since 1.1.0
     */
    static public function getMusicPath(fileName:String):String
    {
        return (musicPath + fileName);
    }

    /**
     * Returns the path of the file in the sound folder.
     * Can be used to import graphics without insert all the destination of the file.
     * @since 1.1.0
     */
    static public function getSoundPath(fileName:String):String
    {
        return (soundPath + fileName);
    }

    /**
     * Returns into a custom path.
     * Can be used to import graphics without insert all the destination of the file.
     * @since 1.1.0
     */
    static public function getPath(path:String, fileName:String):String
    {
        return "assets/" + path + fileName;
    }

    /**
     * Create a new text displaying an fps counter.
     * Including memory and the state in use.
     */
    public function new(x:Float = 0, y:Float = 0, textColor:Int = 0xFFFFFF, textFont:String = null)
    {
        super(x, y);

        defaultFont = textFont;
        defaultColor = textColor;
        defaultSize = 16;

        text = "";
        size = 16;
        font = textFont;
        color = textColor;
        borderColor = FlxColor.BLACK;
        borderStyle = FlxTextBorderStyle.OUTLINE;
    }

    /**
     * The update function, used for the fps counter and more.
     * @since 1.0.0
     */
    override public function update(elapsed:Float)
    {
        super.update(elapsed);

        fps = FlxG.drawFramerate;
        memory = Std.int(System.totalMemory / 1024 / 1024);

        state = Type.getClassName(Type.getClass(FlxG.state));

        version = Std.string(FlxG.VERSION);

        if (!showFpsCounter)
        {
            text = "";
        }
        else
        {
            text = "FPS: " + fps + "\nMemory: " + memory + "\nState: " + state + "\n" + version;
        }

        // Hide or show the fps counter with this key. If you want you can add more keys.
        if (FlxG.keys.anyJustPressed([toggleKey]))
        {
            showFpsCounter = !showFpsCounter;
        }

        if (maxMemoryUsage != null)
        {
            if (memory >= maxMemoryUsage || fps <= minFps)
            {
                changeTextStyle(defaultFont, defaultSize, redDefaultColor);
            }
            else 
            {
                changeTextStyle(defaultFont, defaultSize, defaultColor);
            }
        }
    }

    /**
     * Save a log in a txt file in the game directory.
     */
    static public function save_Log(message:String, level:LogLevel = LOG, path:String = "log.txt") 
    {
        #if desktop
        var file = File.append(path);
        var timestamp = Date.now().toString();
        file.writeString("[" + timestamp + "] [" + level + "] " + message + "\n");
        file.close();
        trace("SAVED LOG AT: " + path + " TYPE: " + level);
        #else
        trace("`save_Log` is not avaible on this platform");
        #end
    }

    /**
     * Change the actual fps counter style with a new style. 
     */
    public function changeTextStyle(newFont:String, newSize:Int, newColor:Int):Void
    {
        font = newFont;
        size = newSize;
        color = newColor;
    }

    /**
     * Get the actual haxeflixel version.
     * Used on the fps counter.
     */
    static public function getVersion():String
    {
        return version;
    }

    /**
     * Get the actual class name.
     * It's used on the fps counter.
     */
    static public function getClassName():String
    {
        return state;
    }

    /**
     * Get the actual memory usage in the moment you use it.
     */
    static public function getMemoryUsage()
    {
        return memory + "MB";
    }

    /**
     * Get the actual value of fps in the moment you use it.
     */
    static public function getFPS():Int
    {
        return fps;
    }

    /**
     * Change the window title, can be used on an html5 or on a desktop target.
     */
    static public function setWindowTitle(nameTitle:String):Void
    {
        #if html5
        js.Browser.document.title = nameTitle;
        #elseif desktop
        openfl.Lib.current.stage.window.title = nameTitle;
        #else
        trace("`setWindowTitle` is not avaible on this platform.");
        #end
    }

    /**
     * Set the window position, possible only on desktop target.
     */
    static public function setWindowPosition(x:Int, y:Int):Void
    {
        #if desktop
        openfl.Lib.current.stage.window.x = x;
        openfl.Lib.current.stage.window.y = y;
        #elseif html5
        trace("'setWindowPosition' is not available on this platform.");
        #end
    }

    /**
     * Set an max fps amount for the game.
     * This is also displayed in the fps counter.
     */
    static public function setMaxFPS(value:Int):Void
    {
        FlxG.drawFramerate = value;
        FlxG.updateFramerate = value;
        trace("MAX FPS SETTED TO: " + value);
    }

    /**
     * Set the lowest fps value in the game.
     * When the fps counter reach this value it well be red.
     */
    static public function setLowestFPS(value:Int):Void
    {
        minFps = value;
    }

    /**
     * Set the max ram usage, when the ram reach the value the game this function try to lower the memory usage.
     * In the fps counter if the ram usage reach the value the color will be red.
     */
    static public function setHighMemoryUsage(value:Int)
    {
        maxMemoryUsage = value;
        trace("NEW MAX HIGH MEMORY USAGE SETTED TO: " + value);
    }

    /**
     * Open a custom URL.
     */
    static public function openURL(url:String):Void 
    {
        #if sys
        Sys.command("cmd", ["/C", "start", "", url]);
        #elseif html5
        js.Browser.window.open(url, "_blank");
        #else
        trace("`openURL` is not avaible on this platform.");
        #end
    }

    /**
     * A function that saves log when crash.
     */
    static public function crashHandler(error:Dynamic):Void 
    {
        #if sys
        var msg = Std.string(error);
        msg = StringTools.replace(msg, "\"", "'");
        msg = StringTools.replace(msg, "\n", " ");
        msg = StringTools.replace(msg, "\r", " ");

        var vbsContent = 
            "MsgBox \"" + msg + "\", 16, \"Crash Revealed\"\n" +
            "Set fso = CreateObject(\"Scripting.FileSystemObject\")\n" +
            "fso.DeleteFile WScript.ScriptFullName";

        var vbsPath = "crash_popup.vbs";
        sys.io.File.saveContent(vbsPath, vbsContent);
        Sys.command("cmd", ["/C", "start", "", vbsPath]);

        save_Log(error, ERROR);
        Sys.exit(1);
        #else
        trace("Error: " + Std.string(error));
        #end
    }

    /**
     * This function sets the default settings that can be setted and applied in the game.
     * Can be very important if in a game you want a button that restores the default settings.
     * @since 1.1.1
     */
    static public function setDefaultSettings(maxFPS:Int, newMaxMemory:Int, newDefaultFont:String, newDefaultSize:Int, newDefaultColor:Int)
    {
        defaultFps = maxFPS;
        settings_maxMemoryUsage = newMaxMemory;
        settings_defaultFont = newDefaultFont;
        settings_defaultSize = newDefaultSize;
        settings_defaultColor = newDefaultColor;
        trace("SETTED DEFAULT SETTINGS");
    }

    /**
     * Apply the default settings, so apply all the settings setted before, if you try to use this without setted anything the game can crash.
     * @since 1.1.1
     */
    static public function applyDefaultSettings()
    {
        setMaxFPS(defaultFps);
        maxMemoryUsage = settings_maxMemoryUsage;
        defaultFont = settings_defaultFont;
        defaultSize = settings_defaultSize;
        defaultColor = settings_defaultColor;
        trace("APPLIED DEFAULT SETTINGS");
    }
}

/**
 * All the status of possible logs.
 * With the save_Logs function all logs are saved in the 'log.txt' in the game folder.
 * Between the log there is the data when the it was created.
 */
enum LogLevel
{
    /**
     * A normal log, nothing to worry.
     * Can be used in every situation.
     */
    LOG;

    /**
     * A log that display a thing that for now is nothing but in the future can be a big probrem.
     */
    WARNING;

    /**
     * An error, a thing that causes crash and errors in the game, it's used on the crash handler function.
     */
    ERROR;
}
