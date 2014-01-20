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

#import "CustomStyleConstants.h"

// Other imports
#import "CustomColor.h"

@implementation CustomStyleConstants


static NSString * styleScheme = nil;

+(void) initialize {
	styleScheme = [MBProperties valueForProperty:PROPERTY_STYLE_SCHEME];
}

// Font
+(UIFont *)getFont:(int)type {
	
	UIFont * result = nil;
    
	// General fontFamily name
	NSString * fontPlain = nil;
	NSString * fontBold = nil;
	fontPlain = @"Helvetica";
    fontBold = @"Helvetica-Bold";
	
	NSString *font = fontPlain;
	NSUInteger size = 12;
	
	switch (type) {
		case CUSTOMFONTREGULAR:
			size = 12;
			break;
        case CUSTOMFONTBOLD:
            font = fontBold;
            size = 12;
            break;
        case CUSTOMFONTTITLEREGULAR:
            size = 16;
            break;
        default:
			// default font, give warning
			//font = fontPlain;
			size = 12;
			WLog(@"Style warning: unrecognized font ID: %d", type);
			break;
	}
    
	result = [UIFont fontWithName:font size:size];
	return result;
	
}

// Color
+ (UIColor *)getColor:(int)type {
	
	UIColor *result = nil;
	switch (type) {
		case CUSTOMNAVIGATIONBARCOLOR:
            result = [UIColor customNavigationBarColor];
			break;	
        case CUSTOMTOOLBARCOLOR:
            result = [UIColor customNavigationBarColor];
			break;	      
        default:
			// Color unrecognized; give warning
			WLog(@"Style warning: unrecognized color ID: %d", type);
			break;	
    }
    
    return result;
}


// Returns the filename of an image (or other file).
+(NSString *)getFilenameForItem:(NSString *)item {
	
	// Build and return the filename (e.g. styleScheme-item)
	NSString *result = @"";
    if (styleScheme != nil) {
		result = [NSString stringWithFormat: @"%@-%@.png", item, styleScheme];
	}
	else {
		result = [NSString stringWithFormat: @"%@.png", item];
	}
    
	return result;
	
}

@end
