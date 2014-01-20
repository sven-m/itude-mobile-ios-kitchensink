/*
 * (C) Copyright Itude Mobile B.V., The Netherlands.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#import "CustomAppDelegate.h"

// Custom imports
#import "CustomApplicationFactory.h"
#import "CustomStyleHandler.h"
#import "CustomStyleConstants.h"
#import "CustomRowViewBuilder.h"
#import "PlantDataService.h"

#import "MBFadeTransitionStyle.h"
#import "MBArrowIconBackButtonBuilder.h"

#import "MBMenuDialogDecorator.h"

@implementation CustomAppDelegate

-(void) startController {
	
	NSAutoreleasePool *pool = [NSAutoreleasePool new];
	
	// Uncomment this in development/test mode to get the stacktrace on-screen
	InstallUncaughtExceptionHandler();
    
    
    // Register custom RowViewBuilders
    CustomRowViewBuilder *customBuilder = [[CustomRowViewBuilder alloc] init];
    [[[MBViewBuilderFactory sharedInstance] rowViewBuilderFactory] registerRowViewBuilder:customBuilder forRowType:C_ROW forRowStyle:@"customRow"];
    [customBuilder release];
    
    // Set our own applicationFactory. IMPORTANT: The applicationFactory needs to be set before [MBApplicationFactory sharedInstance] is called for the first time.
    CustomApplicationFactory *applicationFactory = [[[CustomApplicationFactory alloc] init] autorelease];
    [MBApplicationFactory setSharedInstance:applicationFactory];
    
    // Register transition styles
//    MBFadeTransitionStyle *transitionStyle = [MBFadeTransitionStyle new];
//    [[[MBApplicationFactory sharedInstance] transitionStyleFactory] setDefaultTransition:transitionStyle];
//    [transitionStyle release];

    // Register a custom back button (a wish but disabled for now because of inconsistency and bugs).
    //[[[MBViewBuilderFactory sharedInstance] backButtonBuilderFactory] setDefaultBuilder:[[MBArrowIconBackButtonBuilder new] autorelease]];

	[[[MBViewBuilderFactory sharedInstance]dialogDecoratorFactory] registerDialogDecorationBuilder:[[[MBMenuDialogDecorator alloc]init] autorelease] forType: @"MENU"];
    
    // set the Custom datahandlers
    
    // Set custom stylehandling
    [[MBViewBuilderFactory sharedInstance] setStyleHandler:[[CustomStyleHandler new] autorelease]];
	
	// set the Custom datahandlers
    [[MBDataManagerService sharedInstance] registerDataHandler:[[PlantDataService new] autorelease] withName:@"PlantDataHandler"];
    
	// Delete any cached documents at startup
	[MBCacheManager expireAllDocuments];
	

    
    [self initializeApplicationProperties];
    
	[self performSelectorOnMainThread:@selector(startApplication:) withObject:[MBApplicationFactory sharedInstance] waitUntilDone:YES];
    
	[pool drain];
    
}

- (void)startApplication:(MBApplicationFactory *)_applicationFactory {
    // Example of how to set the orientationMask. Don't forget to update your plist as well. 
    //[[MBOrientationManager sharedInstance] setOrientationMask:UIInterfaceOrientationMaskLandscape];
    
    // Start the application
    [super startApplication:_applicationFactory];
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
