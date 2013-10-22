//
//  CustomizedViewLogic.h
//  itude-mobile-ios-app
//
//  Created by Robin Puthli on 08-08-2012.
//  Copyright (c) 2012 Itude Mobile. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MBBasicViewController.h"
#import "MBValueChangeListenerProtocol.h"
#import "MBOutcomeListenerProtocol.h"

@interface CustomizedViewLogic : MBBasicViewController <MBValueChangeListenerProtocol, MBOutcomeListenerProtocol>
 

@end
