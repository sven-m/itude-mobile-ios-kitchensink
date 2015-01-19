//
//  PlantDetailViewBindingController.m
//  kitchensink-app
//
//  Created by Emiel Bon on 19-01-15.
//  Copyright (c) 2015 Itude Mobile. All rights reserved.
//

#import "PlantDetailViewBindingController.h"
#import "MBPageBinder.h"
#import "MBTableViewBinder.h"
#import "MBSimpleTextBinder.h"
#import "MBButtonBinder.h"

@implementation PlantDetailViewBindingController

- (void)rebuildView
{
    MBPageBinder *binder = [MBPageBinder binderWithViewController:self];
    [binder registerBinder:[MBSimpleTextBinder binderWithIdentifier:@"Light"]];
    [binder registerBinder:[MBSimpleTextBinder binderWithIdentifier:@"CommonName"]];
    [binder registerBinder:[MBSimpleTextBinder binderWithIdentifier:@"BotanicalName"]];
    [binder registerBinder:[MBSimpleTextBinder binderWithIdentifier:@"Availability"]];
    [binder registerBinder:[MBSimpleTextBinder binderWithIdentifier:@"Price"]];
    //[binder registerBinder:[MBButtonBinder     binderWithIdentifier:@"Coolness"]];
    [binder bind];
}

@end
