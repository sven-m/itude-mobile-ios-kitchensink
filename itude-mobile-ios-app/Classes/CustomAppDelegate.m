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

-(void) startController {
	
	NSAutoreleasePool *pool = [NSAutoreleasePool new];
	
	// Uncomment this in development/test mode to get the stacktrace on-screen
	//InstallUncaughtExceptionHandler();
    
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
	
    CustomApplicationFactory *applicationFactory = [[[CustomApplicationFactory alloc] init] autorelease];
    [MBApplicationFactory setSharedInstance:applicationFactory];
    
    [self initializeApplicationProperties];
    
	[self performSelectorOnMainThread:@selector(startApplication:) withObject:applicationFactory waitUntilDone:YES];
    
	[pool drain];
    
}

- (void)startApplication:(MBApplicationFactory *)_applicationFactory {
    // Start the application
    [super startApplication:_applicationFactory];
}


-(void)initializeApplicationProperties {
    MBDocument *applicationStateDoc = [[MBDataManagerService sharedInstance] loadDocument: @"ApplicationState"];
    
    // set the device identifier
    if ([[applicationStateDoc valueForPath:@"/Device[0]/@deviceID"] length] < 1) {
        [applicationStateDoc setValue:[[UIDevice currentDevice] uniqueIdentifier] forPath:@"/Device[0]/@deviceID"];
    
        // Set a different identifier for the simulator because the default uses special characters
#if TARGET_IPHONE_SIMULATOR
        [applicationStateDoc setValue:@"iPhone_simulator" forPath:@"/Device[0]/@deviceID"];
#endif
      
        //remove all notifications
        [[UIApplication sharedApplication] cancelAllLocalNotifications];

    }
    
    // set the device type
    if ([[applicationStateDoc valueForPath:@"/Device[0]/@deviceType"] length] < 1) {
        [applicationStateDoc setValue:@"1" forPath:@"/Device[0]/@deviceType"];
    }
    
    [[MBDataManagerService sharedInstance] storeDocument:applicationStateDoc];
}

// support 3.x
-(void) applicationDidFinishLaunching:(UIApplication *)application {
	[self application:application didFinishLaunchingWithOptions:nil];
}

// for 4.x
- (BOOL) application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    // Startup sequence in foreground. ONLY do this in background if you need a long time to load (e.g. a network operation). 
    [self startController];
        
    // Hide the networkActivitiyIndicator, in case it's still running
	[[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];

	return YES;
}




@end
