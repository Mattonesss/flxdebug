# FlxDebug
[![FlxDebug](https://badgen.net/haxelib/d/flxdebug?color=blue)](https://lib.haxe.org/p/flxdebug/)

**FlxDebug** is a lightweight debugging utility for [HaxeFlixel](https://haxeflixel.com/) that helps developers enhance their games with custom FPS counters and useful diagnostics.

> **Note:** FlxDebug is not recommended for HTML5 projects.  
> It may cause crashes or unexpected behavior. Use it on **desktop platforms only**.
>
> **Other Note:** FlxDebug it's still in work in progress :)


To download FlxDebug you can use the stable version and the git version, i suggested the stable, to do it you need to do 'haxelib install flxdebug' or 'haxelib git https://github.com/Mattonesss/flxdebug/' and on the project.xml add <haxelib name="flxdebug" />

---

## Features

To add a custom FPS counter to your HaxeFlixel game do
```haxe
var fpsVar = new FlxDebug(x, y, textcolor, textfont);
add(fpsVar);
```

else if you want you can add default settings, like default fps, an max memory usage and more, and when you setted all the settings you can apply them with:
```haxe
setDefaultSettings(maxFPS:Int, newMaxMemory:Int, newDefaultFont:String, newDefaultSize:Int, newDefaultColor:Int);
applyDefaultSettings();
```

If you want to read an json file you can easely do
```haxe
readJSONFile(file:String, receive:String);
```
in this case the file is readed and in receive you need to write what you want to be returned by the json file,
else if you want to read any custom file you can do that with path usage, a function that you can easely express it with
If you want to read an json file you can easely do
```haxe
getPath(path:String, fileName:String)
```
but you can do more, you can do 'getPath' and the folder that there is the file like 'getDataPath', in this case you need only to insert the file name.
