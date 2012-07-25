package flurryagent;

#if android
import nme.JNI;
#end

/** Google Analytics */
class FlurryAgent 
{
	/**
	Various event IDs
	*/
	
	/** On Ready Callback */
	private static var _onAuthCallback:Dynamic;
	
	/** Initialization State */
	private static var initState:Bool = false;

	#if android
	public static inline var ANDROID_CLASS : String = 'NMEFlurryAgent';
	
	private static var _startSession_func:Dynamic;
	public static function startSession(apiKey:String):Void
	{
		if (_startSession_func == null)
			_startSession_func = nme.JNI.createStaticMethod(ANDROID_CLASS, "startSession", "(Ljava/lang/String;)V", true);
		var a = new Array<Dynamic>();
		a.push(apiKey);
		_startSession_func(a);
		
		initState = true;
	}
    
    
	private static var _logEvent_func:Dynamic;
	public static function logEvent(eventName:String):Void{
		assertInit();
		if (_logEvent_func == null)
			_logEvent_func = nme.JNI.createStaticMethod(ANDROID_CLASS, "logEvent", "(Ljava/lang/String;)V", true);
		var a = new Array<Dynamic>();
		a.push(eventName);
		_logEvent_func(a);
	}
    
    
	private static var _logPageView_func:Dynamic;
	public static function logPageView():Void{
		assertInit();
		if (_logPageView_func == null)
			_logPageView_func = nme.JNI.createStaticMethod(ANDROID_CLASS, "logPageView", "()V", true);
		var a = new Array<Dynamic>();
		_logPageView_func(a);
	}
    
	
	private static var _debuggerMode_func:Dynamic;
	public static function setDebugEnabled(deb:Bool)
	{
		assertInit();
		if (_debuggerMode_func == null)
			_debuggerMode_func = nme.JNI.createStaticMethod(ANDROID_CLASS, "setDebugEnabled", "(Z)V", true);
		var a = new Array<Dynamic>();
		a.push(deb);
		_debuggerMode_func(a);
	}
	
	
	#else


	//
	// Public Methods
	//

	/**
	Set debug mode
	*/

	public static function setDebugEnabled(deb:Bool)
	{
		if(deb == false)
			flurryagent_debug_mode(0);
		else
			flurryagent_debug_mode(1);
	}

	/**
	 *  Start tracking - use at beginning of app
	 */

	public static function startSession(apiKey:String):Void
	{
		trace("*** FlurryAgent: startTracker ***");
		flurryagent_start_session(apiKey);
		initState = true;
	}

	/**
 	*  trackEvent
 	*/

	public static function logEvent(eventName:String):Void{
		assertInit();
		flurryagent_log_event(eventName);
	}

	/**
 	*  trackPage
 	*/	

	public static function logPageView():Void
	{
		assertInit();
		flurryagent_log_pageview();
	}
	
	static var flurryagent_debug_mode = nme.Loader.load("flurryagent_debug_mode",1);
	static var flurryagent_start_session = nme.Loader.load("flurryagent_start_session",1);
	static var flurryagent_log_event = nme.Loader.load("flurryagent_log_event",1);
	static var flurryagent_log_pageview = nme.Loader.load("flurryagent_log_pageview",0);

	#end
	//
	// Implementation
	//

	/** Callback from CFFI */
	private static function FlurryAgent_event_callback(eventId:Int):Void
	{
		trace("FlurryAgent :: received event: "+eventId);
		// TODO: dispatch other events, and callbacks success/failure

	}
	

	
	/** Ensure Initialization state */
	private static function assertInit():Void
	{
		if (initState==false)
		{
			throw "Initialize FlurryAgent with FlurryAgent.startTracker() first.";
		}
	}
}

