//
//  MBSimpleTableViewCellBinder.m
//  kitchensink-app
//
//  Created by Emiel Bon on 20-01-15.
//  Copyright (c) 2015 Itude Mobile. All rights reserved.
//

#import "MBSimpleTableViewCellBinder.h"

@implementation MBSimpleTableViewCellBinder

+ (instancetype)binderWithIdentifier:(NSString *)identifier
{
    return [[[MBSimpleTableViewCellBinder alloc] initWithBindingIdentifier:identifier] autorelease];
}



@end
