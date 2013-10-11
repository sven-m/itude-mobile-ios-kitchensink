//
//  CustomColor.m
//  itude-mobile-ios-app
//
//  Created by Frank van Eenbergen on 7/20/11.
//  Copyright 2011 Itude Mobile. All rights reserved.
//

#import "CustomColor.h"
#import "MBProperties.h"


@implementation UIColor (CustomColor) 



+ (UIColor *) customNavigationBarColor {
    return [UIColor colorWithRed:hexColorValueToFloat(0) green:hexColorValueToFloat(84) blue:hexColorValueToFloat(166) alpha:1.0];
}

+ (UIColor *)customViewBackgroundColor {
    return [UIColor colorWithRed:hexColorValueToFloat(233) green:hexColorValueToFloat(233) blue:hexColorValueToFloat(233) alpha:1.0];
}

@end
