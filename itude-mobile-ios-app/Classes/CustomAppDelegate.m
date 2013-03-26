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
#import "CustomRowViewBuilder.h"

// Framework imports
#import "MBCacheManager.h"
#import "MBDataManagerService.h"
#import "MBViewBuilderFactory.h"
#import "MBCacheManager.h"
#import "MBConfigurationDefinition.h"
#import "MBDeviceType.h"
#import "UncaughtExceptionHandler.h"
#import "MBMacros.h"
#import "MBRowViewBuilderFactory.h"
#import "MBOrientationManager.h"
#import "MBDevice.h"


@implementation CustomAppDelegate

-(void) startController {
	
	NSAutoreleasePool *pool = [NSAutoreleasePool new];
	
	// Uncomment this in development/test mode to get the stacktrace on-screen
	InstallUncaughtExceptionHandler();
    
    
    // Register custom RowViewBuilders
    CustomRowViewBuilder *customBuilder = [[CustomRowViewBuilder alloc] init];
    [[[MBViewBuilderFactory sharedInstance] rowViewBuilderFactory] registerRowViewBuilder:customBuilder forRowType:C_ROW forRowStyle:@"customRow"];
    [customBuilder release];
    
    // set the Custom datahandlers
    
    // Set custom stylehandling
    [[MBViewBuilderFactory sharedInstance] setStyleHandler:[[CustomStyleHandler new] autorelease]];
	
	// set the Custom datahandlers
	[[MBDataManagerService sharedInstance] registerDataHandler:[[CustomSoapServiceDataHandler new] autorelease] withName:@"CustomSoapServiceDataHandler"];
    
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
    
    // Example of how to set the orientationMask. Don't forget to update your plist as well. 
    //[[MBOrientationManager sharedInstance] setOrientationMask:UIInterfaceOrientationMaskLandscape];
}


-(void)initializeApplicationProperties {
    MBDocument *applicationStateDoc = [[MBDataManagerService sharedInstance] loadDocument: @"ApplicationState"];
    
    // set the device identifier
    if ([[applicationStateDoc valueForPath:@"/Device[0]/@deviceID"] length] < 1) {
        NSString *uniqueIdentifier = [MBDevice identifier];
        [applicationStateDoc setValue:uniqueIdentifier forPath:@"/Device[0]/@deviceID"];
    
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

- (NSUInteger)application:(UIApplication *)application supportedInterfaceOrientationsForWindow:(UIWindow *)window {
    return [[MBOrientationManager sharedInstance] orientationMask];
}


@end
