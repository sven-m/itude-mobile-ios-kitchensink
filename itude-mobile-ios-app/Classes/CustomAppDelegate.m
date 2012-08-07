//
//  PilserviceAppDelegate.m
//  itude-mobile-ios-app
//
//  Created by Ricardo de Wilde on 7/8/11.
//  Copyright 2011 Itude Mobile. All rights reserved.
//

#import "CustomAppDelegate.h"

// Custom imports
#import "CustomApplicationFactory.h"
#import "CustomStyleHandler.h"
#import "CustomStyleConstants.h"
#import "CustomSoapServiceDataHandler.h"
#import "CustomPanelViewBuilder.h"
#import "CustomFieldViewBuilder.h"

// Framework imports
#import "MBCacheManager.h"
#import "MBDataManagerService.h"
#import "MBViewBuilderFactory.h"
#import "MBCacheManager.h"
#import "MBConfigurationDefinition.h"
#import "MBDeviceType.h"
#import "UncaughtExceptionHandler.h"
#import "NSDateUtilities.h"
#import "MBMacros.h"
#import "MBLocalizationService.h"


#define kAlertViewTakePill 1
#define kAlertViewForgotPill 2

@implementation CustomAppDelegate


@synthesize window = _window;
@synthesize splashScreen = _splashScreen;

-(void) startController {
	
	NSAutoreleasePool *pool = [NSAutoreleasePool new];
	
	// Uncomment this in development/test mode to get the stacktrace on-screen
	InstallUncaughtExceptionHandler();
    
	// set the custom PanelViewBuilder
	[[MBViewBuilderFactory sharedInstance] setPanelViewBuilder:[[CustomPanelViewBuilder new] autorelease]];
    
	// set the custom FieldViewBuilder
	[[MBViewBuilderFactory sharedInstance] setFieldViewBuilder:[[CustomFieldViewBuilder new] autorelease]];
	
    // Set custom stylehandling
    [[MBViewBuilderFactory sharedInstance] setStyleHandler:[[CustomStyleHandler new] autorelease]];
	
	// set the Custom datahandlers
	[[MBDataManagerService sharedInstance] registerDataHandler:[[CustomSoapServiceDataHandler new] autorelease] withName:@"PPSoapServiceDataHandler"];
    
	// Delete any cached documents at startup
	[MBCacheManager expireAllDocuments];
	
    CustomApplicationFactory *pilserviceFactory = [[CustomApplicationFactory alloc] init];
    
    [MBApplicationFactory setSharedInstance:pilserviceFactory];
    
    [self initializeApplicationProperties];
    
	[self performSelectorOnMainThread:@selector(startApplication:) withObject:pilserviceFactory waitUntilDone:YES];
    
	[pool drain];
    
}

- (void)startApplication:(MBApplicationFactory *)_applicationFactory {
    // Start the application
    [super startApplication:_applicationFactory];
    
    // We want to remove the splash-screen image, because it takes up memory and we don't need it anymore
	[self.splashScreen hide];

    // For now...
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
}

-(void)initializeApplicationProperties {
    MBDocument *_applicationStateDoc = [[MBDataManagerService sharedInstance] loadDocument: @"ApplicationState"];
    if ([[_applicationStateDoc valueForPath:@"/Device[0]/@deviceID"] length] < 1) {
        NSString *identifier = [[UIDevice currentDevice] uniqueIdentifier];

        //remove all notifications
        [[UIApplication sharedApplication] cancelAllLocalNotifications];
        
#if TARGET_IPHONE_SIMULATOR
        identifier = @"iPhone_simulator"; 
        //identifier = @"legegebruiker2"; 
#endif
      
        [_applicationStateDoc setValue:identifier forPath:@"/Device[0]/@deviceID"];

    }
    if ([[_applicationStateDoc valueForPath:@"/Device[0]/@deviceType"] length] < 1) {
        [_applicationStateDoc setValue:@"1" forPath:@"/Device[0]/@deviceType"];
    }
    [[MBDataManagerService sharedInstance] storeDocument:_applicationStateDoc];
}

// support 3.x
-(void) applicationDidFinishLaunching:(UIApplication *)application {
	[self application:application didFinishLaunchingWithOptions:nil];
}

// for 4.x
- (BOOL) application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    
    // start startup sequence in background 
	[self performSelectorInBackground:@selector(startController) withObject:nil];
	//[self startController];
    
	self.window = [[[UIWindow alloc] initWithFrame: [[UIScreen mainScreen]bounds]] autorelease];
	
    // Add a backgroundImage, so that when the app is waiting for something, there is a proper background to be displayed
	NSString *backgroundImageName = [CustomStyleConstants getFilenameForItem:@"Background"];
	UIImageView *bgImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:backgroundImageName]];
	bgImage.opaque = YES;
	[self.window addSubview:bgImage];
	[self.window sendSubviewToBack:bgImage];
    
    [bgImage release];
    
    // Show something on screen so user doesnt think the app is dead if the network takes a long time.
	self.splashScreen = [[[CustomSplashScreen alloc] initWithFrame:self.window.frame] autorelease];
	[self.window addSubview:self.splashScreen];
	[self.splashScreen show];
    
    // Hide the networkActivitiyIndicator, in case it's still running
	[[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
	[self.window makeKeyAndVisible];
	
	return YES;
}



- (void)dealloc
{
    [_window release];
    [super dealloc];
}

@end
