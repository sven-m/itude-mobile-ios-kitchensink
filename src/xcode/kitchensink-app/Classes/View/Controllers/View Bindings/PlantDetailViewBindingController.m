//
//  PlantDetailViewBindingController.m
//  kitchensink-app
//
//  Created by Emiel Bon on 19-01-15.
//  Copyright (c) 2015 Itude Mobile. All rights reserved.
//

#import "PlantDetailViewBindingController.h"

@implementation PlantDetailViewBindingController

- (void)rebuildView
{
    // Prevent default View Builder behavior
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    MBPageBinder *binder = [MBPageBinder binderWithViewController:self];
    [binder registerBinder:[MBSimpleTextBinder binderWithIdentifier:@"Light"]];
    [binder registerBinder:[MBSimpleTextBinder binderWithIdentifier:@"CommonName"]];
    [binder registerBinder:[MBSimpleTextBinder binderWithIdentifier:@"BotanicalName"]];
    [binder registerBinder:[MBSimpleTextBinder binderWithIdentifier:@"Availability"]];
    [binder registerBinder:[MBSimpleTextBinder binderWithIdentifier:@"Price"]];
    [binder registerBinder:[MBSwitchBinder     binderWithIdentifier:@"Coolness"]];
    [binder bind];
}

@end
