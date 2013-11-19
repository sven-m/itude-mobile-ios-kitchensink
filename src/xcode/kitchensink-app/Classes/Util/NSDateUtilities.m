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

#import "NSDateUtilities.h"


// XML date format
#define XMLDATEFORMAT @"yyyy-MM-dd'T'HH:mm:ss"

@implementation NSDate (DateAdditions)


+ (NSDate *) theDayBeforeTomorrow {
    return [[NSDate date] addDays:-2];
}

+ (NSDate *) yesterday {
    return [[NSDate date] addDays:-1];
}

+ (NSDate *) today {
    return [NSDate date];
}

+ (NSDate *) tomorrow {
    return [[NSDate date] addDays:1];
}

+ (NSDate *) theDayAfterTomorrow {
    return [[NSDate date] addDays:2];
}


// Adds excactly one day to the current date.
- (NSDate *) addDays:(NSInteger) days {

    NSDateComponents *offsetComponents = [[NSDateComponents alloc] init];
    [offsetComponents setDay:days];
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    self = [gregorian dateByAddingComponents:offsetComponents toDate:self options:0];
    [offsetComponents release];
    [gregorian release];
    return self;
}

// Converts a XML dateString to a NSDate object
+ (NSDate *)dateFromXmlString:(NSString *)xmlDateString {
    NSDate *result = nil;
    if (xmlDateString != nil) {
        NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
        [dateFormat setDateFormat:XMLDATEFORMAT];
        result = [dateFormat dateFromString:xmlDateString]; 
        [dateFormat release];
    }
    return result;
}

+ (NSString *)xmlDateStringFromDate:(NSDate *)date {
    NSString *result = nil;
    
    if (self) {
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:XMLDATEFORMAT];
        result = [dateFormatter stringFromDate:date];
        [dateFormatter release];
    }
    
    return result;
}

@end
