#import "TouchesAppDelegate.h"

@implementation TouchesAppDelegate

@synthesize window;

//- (void)applicationDidFinishLaunching:(UIApplication *)application {	
//	// Override point for customization after app launch
//	// Look in the Info.plist file and you'll see the status bar is hidden
//	// Set the style to black so it matches the background of the application
//	[application setStatusBarStyle:UIStatusBarStyleBlackTranslucent animated:NO];
//	// Now show the status bar, but animate to the style.
//	[application setStatusBarHidden:NO animated:YES];
//}
//
- (void)dealloc {
	[window release];
	[super dealloc];
}

@end
