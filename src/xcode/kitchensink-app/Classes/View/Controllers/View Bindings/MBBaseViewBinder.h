//
//  MBBaseViewBinder.h
//  kitchensink-app
//
//  Created by Emiel Bon on 15-01-15.
//  Copyright (c) 2015 Itude Mobile. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MBViewBinder.h"
// The following 2 imports are not directly used here, but are used by all subclasses. This prevents having to include them everywhere.
#import "MBBuildState.h"
#import "UIView+ViewBinding.h"

@interface MBBaseViewBinder : NSObject <MBViewBinder>

@property (nonatomic, retain) NSString *identifier;

- (instancetype)initWithBindingIdentifier:(NSString *)identifier;
- (UIView *)bindView:(MBBuildState *)state;

// This method has to be overridden by a subclass
- (UIView *)findSpecificView:(MBBuildState *)state;
- (void)populateView:(UIView *)view withDataFromComponent:(MBComponent *)component;

@end
