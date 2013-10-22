//
//  NSDateUtilities.h
//  CalendarDemo
//
//  Created by Frank van Eenbergen on 7/12/11.
//  Copyright 2011 Itude. All rights reserved.
//

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
