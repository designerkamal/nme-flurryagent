#ifndef __NMEFLURRYAGENT_H
#define __NMEFLURRYAGENT_H

namespace flurryagent 
{
	#ifdef IPHONE
	void setDebugMode(int deb);
	void startSession(const char *accountApiKey);
	void logPageView();
	void logEvent(const char *eventName);
    #endif
}

#endif

