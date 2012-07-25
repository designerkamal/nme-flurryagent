#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#include <FlurryAnalytics.h>

//void uncaughtExceptionHandler(NSException *exception);

namespace flurryagent
{
	void setDebugMode(int deb)
	{
		NSLog(@"flurryagent :: setDebugMode ");


		//Turn off debug mode
		if(deb == 0)
		[FlurryAnalytics setDebugLogEnabled:false];
		else
		[FlurryAnalytics setDebugLogEnabled:true];
		
	}

	void startSession(const char *accountApiKey)
	{
		NSString *apiKey = [[NSString alloc] initWithUTF8String:accountApiKey];

		NSLog(@"flurryagent :: startSession");
		[FlurryAnalytics startSession:apiKey];

		[apiKey release];

	}

	void logPageView()
	{
		[FlurryAnalytics logPageView];
	}

	void logEvent(const char *evtName){
		
		NSString *eventName = [[NSString alloc] initWithUTF8String:evtName];
		
		[FlurryAnalytics logEvent:eventName];
		
		[eventName release];
	}
	
	//TODO: Event with Parameters, Timed Events
	


}
