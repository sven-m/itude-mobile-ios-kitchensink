//
//  ExceptionExampleAction.m
//  itude-mobile-ios-app
//
//  Created by Robin Puthli on 07-08-2012.
//  Copyright (c) 2012 Itude Mobile. All rights reserved.
//

#import "ExceptionExampleAction.h"


@implementation ExceptionExampleAction

-(MBOutcome*) execute:(MBDocument *)document withPath:(NSString *)path {
    // Throw an exception so we can see the exception handling working
    @throw [NSException exceptionWithName:@"Demo" reason:@"Deliberately caused exception" userInfo: nil];
}

@end
