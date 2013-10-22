//
//  CustomizedViewLogic.m
//  itude-mobile-ios-app
//
//  Created by Robin Puthli on 08-08-2012.
//  Copyright (c) 2012 Itude Mobile. All rights reserved.
//

#import "CustomizedViewLogic.h"
#import "MBPage.h"

@implementation CustomizedViewLogic 

-(void)viewDidLoad {
    [super viewDidLoad];
    [self rebuildView]; // create View out of page definition
    [self.page registerValueChangeListener:self forPath:@"/Form[0]/@gender"];
    [self.page registerOutcomeListener:self];
}

// MBValueChangeListener methods
-(void)valueChanged:(NSString *)value originalValue:(NSString *)originalValue forPath:(NSString *)path{
    if ([@"/Form[0]/@gender" isEqualToString:path]) {
        if ([@"male" isEqualToString:value]) {
            [self.page.document setValue:@"Watch Top Gear" forPath:@"/Form[0]/@comment"];
        }
        else{
            [self.page.document setValue:@"Watch Desperate Housewives" forPath:@"/Form[0]/@comment"];
        }
        [self rebuildView];
    }
}

// MBOutcomeListener methods. N.B. Outcomes are still handled by the ApplicationController
- (void) outcomeProduced:(MBOutcome*) outcome{
    UIAlertView *alert = [[[UIAlertView alloc] initWithTitle:@"Outcome name" message:outcome.description delegate:nil cancelButtonTitle:@"Done!" otherButtonTitles:nil, nil] autorelease];
    [alert show];   
}


@end
