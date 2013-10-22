//
//  CustomColor.h
//  itude-mobile-ios-app
//
//  Created by Frank van Eenbergen on 7/20/11.
//  Copyright 2011 Itude Mobile. All rights reserved.
//

#import <Foundation/Foundation.h>


// Macros to transform hex to rgb
#define hexColorValueToFloat(x) (x/255.0)

// link: http://pegolon.wordpress.com/2008/11/03/quick-iphone-dev-tip-creating-a-uicolor-with-just-one-rgb-value/
#define UIColorFromRGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
// In code use: UIColor myColor = UIColorFromRGB(0x00FF00);

@interface UIColor (CustomColor) 


// Example of a custom color and how style should be used
+ (UIColor *) customNavigationBarColor;

+ (UIColor *) customViewBackgroundColor;

@end
