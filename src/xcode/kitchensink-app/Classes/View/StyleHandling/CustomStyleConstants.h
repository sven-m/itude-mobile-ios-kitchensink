/*
 * (C) Copyright Itude Mobile B.V., The Netherlands.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

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
