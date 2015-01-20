//
//  MBSwitchBinder.m
//  kitchensink-app
//
//  Created by Emiel Bon on 20-01-15.
//  Copyright (c) 2015 Itude Mobile. All rights reserved.
//

#import "MBSwitchBinder.h"

@implementation MBSwitchBinder

+ (instancetype)binderWithIdentifier:(NSString *)identifier
{
    return [[[MBSwitchBinder alloc] initWithBindingIdentifier:identifier] autorelease];
}

- (void)populateView:(UIView *)view withDataFromComponent:(MBComponent *)component
{
    assert([component isKindOfClass:[MBField class]]);
    assert([view isKindOfClass:[UISwitch class]]);
    
    MBField *field = (MBField *)component;
    ((UISwitch *)view).on = field.untranslatedValue.boolValue;
}

@end
