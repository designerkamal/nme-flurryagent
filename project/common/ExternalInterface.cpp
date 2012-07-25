#include <stdio.h>
#include <hx/CFFI.h>
#include "NMEFlurryAgent.h"
	
DEFINE_ENTRY_POINT(flurryagent_main);
	
using namespace flurryagent;
	
AutoGCRoot *flurryagentEventCallback=0;


//Prim definitions

value flurryagent_debug_mode(int deb)
{
	#ifdef IPHONE
	setDebugMode(deb);
	return alloc_null();
	#endif
}
DEFINE_PRIM(flurryagent_debug_mode,1);

value flurryagent_start_session(value accountApiKey)
{
	#ifdef IPHONE
	startSession(val_string(accountApiKey));
	return alloc_null();
	#endif
}
DEFINE_PRIM(flurryagent_start_session,1);
	
value flurryagent_log_event(value eventName)
{
	#ifdef IPHONE
	logEvent(val_string(eventName));
	return alloc_null();
	#endif
}
DEFINE_PRIM(flurryagent_log_event,1);
	
value flurryagent_log_pageview()
{

	#ifdef IPHONE
	logPageView();
	return alloc_null();
	#endif
}
DEFINE_PRIM(flurryagent_log_pageview,0);
	
extern "C" 
{
	void flurryagent_main()
	{	
		printf("flurryagent_main()\n");
	}	

	int flurryagent_register_prims()
	{
		printf("CPP: flurryagent_register_prims()\n");
		flurryagent_main();
		return 0;
	}
	
	void flurryagent_send_event(int eventId)
	{
		printf("Send Event: %i\n",eventId);
		val_call1(flurryagentEventCallback->get(),alloc_int(eventId));
	}
}