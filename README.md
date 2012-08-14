nme-flurryagent
===============

Based on http://code.google.com/p/haxe-google-analytics/


Flurry Analytics Extension for HaxeNME (iOS and Android targets) 

Version 1.0 supports Flurry Analytics with iOS and Android target.

1) Add FlurryAgent library to your nmml <haxelib name="flurryagent"/>
2) Import flurryagent (import flurryagent.FlurryAgent;),

start tracking FlurryAgent.startSession("YOUR_FLURRY_API_KEY");

Special instructions for iOS Target:
1) Build for iOS. Exports / Bin folder should include FlurryAgent folder. Drag and drop directory inside your Xcode project

TODO: Support Event Parameters and Timed Events