Haxe Flurry Analytics

To build Haxe Flurry Analytics run the following commands from this directory:


haxelib run hxcpp Build.xml -Diphoneos
haxelib run hxcpp Build.xml -Diphonesim

For ARMV7 lib:

haxelib run hxcpp Build.xml -Diphoneos -DHXCPP_ARMV7

This will create libflurryagent.iphoneos.a and libflurryagent.iphonesim.a inside ndll/iPhone