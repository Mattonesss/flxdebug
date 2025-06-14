<p align="center">
    <img src="./terminalIcon.png" width="500" alt="Terminal Logo."/> 
</p>

# FlxDebug

FlxDebug is an open source [HaxeFlixel](https://haxeflixel.com) library that consist to allow to the user to have access to debug features. It's in developement but for now we don't know when the stable release will be released.

# Installing

You can actually download it using `haxelib install flxdebug` on your command prompt.
If you want you can use the git version but first check if installed and type `haxelib git flxdebug https://www.github.com/Mattonesss/flxdebug/` on the command prompt.

# How To Use It

First import the FlxDebug into the xml file:
```xml
<haxelib name="flxdebug" />
```

Whith it you can actually create an fps counter with memory counter, display of the current state and the haxeflixel version, for do this first import flxdebug using:
```haxe
import FlxDebug;
```
when you imported them you can actually add the fps counter doing this:
```haxe
var fpsCounter = new FlxDebug(0, 0, FlxColor.WHITE);
add(fpsCounter);
```
