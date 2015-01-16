//
//  MBBaseViewBinder.h
//  kitchensink-app
//
//  Created by Emiel Bon on 15-01-15.
//  Copyright (c) 2015 Itude Mobile. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MBViewBinder.h"

@interface MBBaseViewBinder : NSObject <MBViewBinder>

- (UIView *)bindView:(MBBuildState *)state;
- (void)bindOutcome:(MBBuildState *)state toView:(UIView *)view;

// This method has to be overridden by a subclass
- (UIView *)bindSpecificView:(MBBuildState *)state;

@end
