//
//  NSDateUtilities.m
//  CalendarDemo
//
//  Created by Frank van Eenbergen on 7/12/11.
//  Copyright 2011 Itude. All rights reserved.
//

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
