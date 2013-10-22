//
//  FireInitialOutcomes.m
//  itude-mobile-ios-app
//
//  Created by Ricardo de Wilde on 7/15/11.
//  Copyright 2011 Itude Mobile. All rights reserved.
//

#import "FireInitialOutcomes.h"
#import "MBDevice.h"

@implementation FireInitialOutcomes

- (NSString *)documentName {
    //return ([MBDevice isPad]) ? @"InitialOutcomes_tablet": [super documentName];
    return [super documentName];
}

@end