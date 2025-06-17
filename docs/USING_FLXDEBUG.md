## HOW TO USE IT

If you want to create and functionally working FPS Counter first all you need is to check if you imported FlxDebug on the xml project file and on your work file(like PlayState), when you done you can actually create it using
```haxe
    var fpsCounter = new FlxDebug(0, 0, 0x000000, "assets/fonts/comicsans.ttf");
    add(fpsCounter);
```
else you can change the max fps in game using
```haxe
    FlxDebug.setMaxFPS(60);
```
this actually set the max drawFramerates and the max updateFramerates and trace the actual changed value.

If you want you can change the font of the fpscounter with using
```haxe
    fpsCounter.changeTextStyle("assets/fonts/newfont", 16, 0x000000);
```

There are a lots of other things like if you want to get a path of a file easely you can use the getPath function or getDataPath to get a file in the data folder, you can use it like this:
```haxe
    getPath("assets/data/", data.json);
```
or directly going into the data folder using this:
```haxe
    getDataPath(data.json);
```

With FlxDebug you can get a lot of values that in a normal game you can't like the class name, the ram usage, the haxeflixel version in using, for do this you can actually do like this:
```haxe
    /**
     * Get the actual haxeflixel version.
     * Used on the fps counter.
     */
    getVersion();

    /**
     * Get the actual class name.
     * It's used on the fps counter.
     */
    getClassName();

    /**
     * Get the actual memory usage in the moment you use it.
     */
    getMemoryUsage();

    /**
     * Get the actual value of fps in the moment you use it.
     */
    getFPS();
```