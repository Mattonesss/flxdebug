<p align="center">
    <img src="./terminalIcon.png" width="500" alt="Terminal Logo."/> 
</p>

# FlxDebug

FlxDebug is an open source [HaxeFlixel](https://haxeflixel.com) library that consist to allow to the user to have access to debug features.

# Installing

You can actually download it using `haxelib install flxdebug` on your command prompt.
If you want you can use the git version but first check if installed and type `haxelib git flxdebug https://www.github.com/Mattonesss/flxdebug/` on the command prompt.

# How To Use It

Whith it you can actually create an fps counter with memory counter, display of the current state and the haxeflixel version, for do this first import flxdebug on the xml and on the playstate using:
```haxe
//Xml
<haxelib name="flxdebug"/>

//PlayState
import FlxDebug;
```
when you imported them you can do a lot of things like create an fps counter, to create one you need to create them with this:
```haxe
var fpsCounter = new FlxDebug(0, 0, FlxColor.WHITE);
add(fpsCounter);
```
once you do it and build your game if you can see there is the fps counter, if you want to hide press F1.

If you want to trace the memory in use you can actually do this:
```haxe
trace(FlxDebug.getMemoryUsate());
```
or if you want to set an max fps amount you can do this:
```haxe
FlxDebug.setMaxFPS(60);
```