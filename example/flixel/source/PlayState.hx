package;

import FlxDebug;
import flixel.FlxState;

class PlayState extends FlxState
{
	// Font used on the FpsCounter
	public var ComicSans:String = FlxDebug.getPath("assets/fonts/", "comicsans.ttf"); // Path of the font

	override public function create()
	{
		super.create();

		// Create an FpsCounter
		var fpsCounter = new FlxDebug(0, 0, 0xFFFFFF, "ComicSans");
		add(fpsCounter);

		fpsCounter.changeTextStyle(ComicSans, 20, 0xCA9856);

		// Opens google.com
		FlxDebug.openURL("https://www.google.com");

		// Sets a custom title
		FlxDebug.setWindowTitle("a custom title");

		// Trace the memory in use
		trace(FlxDebug.getMemoryUsage());

		// Sets a custom window position
		FlxDebug.setWindowPosition(100, 300);

		// A max amount of FPS
		FlxDebug.setMaxFPS(30);

		// Whith logs you can have three levels of logs: LOG, WARNING, ERROR
		FlxDebug.save_Log("a custom log", LOG);
		FlxDebug.save_Log("a custom warning log", WARNING);
		FlxDebug.save_Log("a custom error log", ERROR);

		// Close the game with a .vbs screen and save the error
		FlxDebug.crashHandler("a crashhandler");
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}
