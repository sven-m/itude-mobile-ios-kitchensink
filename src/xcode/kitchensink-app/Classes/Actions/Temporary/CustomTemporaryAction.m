//
//  CustomTemporaryAction.m
//  itude-mobile-ios-app
//
//  Created by Frank van Eenbergen on 8/10/11.
//  Copyright 2011 Itude Mobile. All rights reserved.
//

#import "CustomTemporaryAction.h"

#import "MBOutcome.h"
#import "MBDocument.h"
#import "MBDataManagerService.h"
#import "MBApplicationController.h"

@implementation CustomTemporaryAction

-(MBOutcome *) execute:(MBDocument *)document withPath:(NSString *)path {
    MBOutcome *outcome = nil;
    
    NSString *message = @"Achter deze actie zit nog geen gedrag. Dit wordt nader geimplementeerd.";
    UIAlertView *todoMessage = [[[UIAlertView alloc] initWithTitle:@"TODO" message:message delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil] autorelease];
    [todoMessage show];
    
	return outcome;
}


@end
