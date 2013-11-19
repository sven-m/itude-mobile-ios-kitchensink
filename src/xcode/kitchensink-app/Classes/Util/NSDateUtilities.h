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


@interface NSDate (DateAdditions) 

+ (NSDate *) theDayBeforeTomorrow;
+ (NSDate *) yesterday;
+ (NSDate *) today;
+ (NSDate *) tomorrow;
+ (NSDate *) theDayAfterTomorrow;

// Adds the number of days to the reciever.
- (NSDate *)addDays:(NSInteger) days;


// Converts a XML dateString to a NSDate object
+ (NSDate *)dateFromXmlString:(NSString *)xmlDateString;

// Converts a date into a XML dateString 0000-00-00T00:00:00
+ (NSString *)xmlDateStringFromDate:(NSDate *)date;



@end
