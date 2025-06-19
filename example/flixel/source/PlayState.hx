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
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}
