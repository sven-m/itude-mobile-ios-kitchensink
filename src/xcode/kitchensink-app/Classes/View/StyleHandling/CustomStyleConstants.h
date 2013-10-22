//
//  CustomStyleHandler.h
//  itude-mobile-ios-app
//
//  Created by Frank van Eenbergen on 7/20/11.
//  Copyright 2011 Itude Mobile. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CustomStyleConstants : NSObject {
    
}


// Style schemes
#define STYLESCHEME_DEFAULT @"default"


// Fonts
typedef enum {
	/* Font                     Size	Description */
	
	// Rows
	CUSTOMFONTREGULAR,           //12	// Standard font for the text in rows
    CUSTOMFONTBOLD,              //12	// Standard font for the text in rows
    CUSTOMFONTTITLEREGULAR,      //16   // 

} Font;


// Colors
typedef enum {
	CUSTOMNAVIGATIONBARCOLOR,
    CUSTOMTOOLBARCOLOR,
    CUSTOMFONTCOLOR,
}Color;


+(UIFont *)getFont:(int)type;
+ (UIColor *)getColor:(int)type;



// Returns filenames that correspond the particular styleScheme
// IMPORTANT: The name-convention of a file must be the Filename-stylescheme (e.g. "Background-default.png")
+(NSString *)getFilenameForItem:(NSString *)item;

@end
