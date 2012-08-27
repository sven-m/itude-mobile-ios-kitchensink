//
//  PilserviceAppDelegate.h
//  itude-mobile-ios-app
//
//  Created by Ricardo de Wilde on 7/8/11.
//  Copyright 2011 Itude Mobile. All rights reserved.
//

#import "MBApplicationController.h"

@interface CustomAppDelegate : MBApplicationController <UIApplicationDelegate> {
    BOOL _handlingNotification;
}

-(void)initializeApplicationProperties;

@end
