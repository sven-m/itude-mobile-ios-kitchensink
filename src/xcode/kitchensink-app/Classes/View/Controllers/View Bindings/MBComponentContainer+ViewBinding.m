//
//  MBComponent+ViewBinding.m
//  kitchensink-app
//
//  Created by Emiel Bon on 20-01-15.
//  Copyright (c) 2015 Itude Mobile. All rights reserved.
//

#import "MBComponentContainer+ViewBinding.h"

@implementation MBComponentContainer (ViewBinding)

- (MBComponent *)childWithName:(NSString *)name
{
    for (MBComponent *component in self.children) {
        if ([component.name isEqualToString:name]) {
            return component;
        }
    }
    return nil;
}

@end
