# FlxDebug
[![Haxelib Haxeflixel](https://badgen.net/haxelib/d/flixel?color=blue)](https://lib.haxe.org/p/flxdebug/))

**FlxDebug** is a lightweight debugging utility for [HaxeFlixel](https://haxeflixel.com/) that helps developers enhance their games with custom FPS counters and useful diagnostics.

> ⚠️ **Note:** FlxDebug is not recommended for HTML5 projects.  
> It may cause crashes or unexpected behavior. Use it on **desktop platforms only**.

---

## Features

### 📊 FPS Counter

To add a custom FPS counter to your HaxeFlixel game:

```haxe
var fpsVar = new FlxDebug(x, y, textcolor, textfont);
add(fpsVar);
```

else if you want you can add default settings, like default fps, an max memory usage and more, and when you setted all the settings you can apply them with:
```haxe
setDefaultSettings(maxFPS:Int, newMaxMemory:Int, newDefaultFont:String, newDefaultSize:Int, newDefaultColor:Int)
applyDefaultSettings()
```
