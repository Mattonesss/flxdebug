package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import openfl.system.System;

class FlxDebug extends FlxText
{
    public var fps:Int;
    public var memory:Int;

    public var state:String;

    public var haxeflixelversion:String;

    public function new(x:Float, y:Float, textColor:Int)
    {
        super(x, y);

        haxeflixelversion = Std.string(FlxG.VERSION);

        text = "";
        font = "assets/fonts/default.ttf";
        size = 16;
        color = textColor;
        borderColor = FlxColor.BLACK;
        borderStyle = FlxTextBorderStyle.OUTLINE;
        visible = true;
    }

    override public function update(elapsed:Float)
    {
        super.update(elapsed);

        fps = FlxG.drawFramerate;
        memory = Std.int(System.totalMemory / 1024 / 1024);

        state = Type.getClassName(Type.getClass(FlxG.state));

        text = "FPS: " + fps + "\nMemory: " + memory + "\nState: " + state + "\n" + haxeflixelversion;
    }

    public function setMaxFPS(value:Int)
    {
        FlxG.drawFramerate = value;
        FlxG.updateFramerate = value;
        trace("MAX FPS SETTED TO: " + value);
    }
}
