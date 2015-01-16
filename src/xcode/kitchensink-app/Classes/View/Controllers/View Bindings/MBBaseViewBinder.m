//
//  MBBaseViewBinder.m
//  kitchensink-app
//
//  Created by Emiel Bon on 15-01-15.
//  Copyright (c) 2015 Itude Mobile. All rights reserved.
//

#import "MBBaseViewBinder.h"
#import "MBBuildState.h"

@implementation MBBaseViewBinder

- (UIView *)bindView:(MBBuildState *)state
{
    UIView *view = [self bindSpecificView:state];
    
    if (view) {
        //[state.component attachView:view]; does not exist?
        [self bindOutcome:state toView:view];
    }
    
    for (MBComponent *child in [state.component childrenOfKind:[MBComponent class]]) {
        state.component = child;
        id element = [child.document valueForPath:child.absoluteDataPath];
        state.element = [element isKindOfClass:[MBElement class]] ? element : nil;
        state.parent = (view) ? view : state.parent;
        [state.mainViewBinder bindView:state];
    }
    
    return view;
}

- (void)bindOutcome:(MBBuildState *)state toView:(UIView *)view
{
    
}

- (UIView *)bindSpecificView:(MBBuildState *)state
{
    assert(false); // This method should be overridden
    return nil;
}

@end
