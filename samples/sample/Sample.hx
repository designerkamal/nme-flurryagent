package ;

import flash.Lib;
import flash.events.MouseEvent;
import flash.display.Sprite;
import flash.text.TextField;
import flurryagent.FlurryAgent;
import haxe.Timer;

/**
Google analyics sample
*/

class Sample extends Sprite
{
	public function new()
	{
		trace("FlurryAgent Sample :: new");

		super();

		FlurryAgent.setDebugMode(true);

		FlurryAgent.startSession("YOUR_API_KEY");


		haxe.Timer.delay(trackMe,5);
	}

	public function trackMe()
	{

		FlurryAgent.logEvent("Testing Event");
	}
}

		
