<p align="center">
    <img src="./terminalIcon.png" width="500" alt="Terminal Logo."/> 
</p>

# FlxDebug

FlxDebug is an open source library focused to help the developer when making games, avaible with [HaxeFlixel](https://haxeflixel.com).

It can be useful for example when you want an memory counter on your screen, with this you can do it, or open an url, yes, you can just do it with this.
For now it's in developement so i(the developer) i'm trying to make flxdebug more powerful for every developer and every game.

If you want to download it you can just go on your terminal and use `haxelib install flxdebug` or if you want you can install the [Git](https://git-scm.com/downloads) version with `haxelib git flxdebug https://www.github.com/Mattonesss/flxdebug/`.

If you want direct support or questions you can contact Mattonesss on [Discord](https://discord.com/users/1165240636992135231)

## FPS Counter

For use the FPS Counter support of FlxDebug you will need to first import them on your xml project file and on your script file (like PlayState), when you done you can actually create an FPS Counter doing
```haxe
    var fpsCounter = new FlxDebug(0, 0, 0x000000, "assets/fonts/comicsans.ttf");
    add(fpsCounter);
```
else you can change the max fps in game using
```haxe
    FlxDebug.setMaxFPS(60);
```
if you want more expaining you can go [Here](docs/USING_FLXDEBUG.md)