//
//  PlantCatalogBindingViewController.m
//  kitchensink-app
//
//  Created by Emiel Bon on 15-01-15.
//  Copyright (c) 2015 Itude Mobile. All rights reserved.
//

#import "PlantCatalogViewBindingController.h"
#import "MBPageBinder.h"
#import "MBSimpleTableViewBinder.h"
#import "MBSimpleTextBinder.h"
#import "MBButtonBinder.h"

@implementation PlantCatalogViewBindingController

- (void)rebuildView
{
    MBPageBinder *binder = [MBPageBinder binderWithViewController:self];
    UINib *plantCellNib = [UINib nibWithNibName:@"PlantCatalogTableViewCell" bundle:nil];
    [binder registerBinder:[MBSimpleTableViewBinder binderWithIdentifier:@"PlantList" cellNib:plantCellNib]];
    [binder registerBinder:[MBSimpleTextBinder      binderWithIdentifier:@"Light"]];
    [binder registerBinder:[MBSimpleTextBinder      binderWithIdentifier:@"CommonName"]];
    [binder registerBinder:[MBSimpleTextBinder      binderWithIdentifier:@"BotanicalName"]];
    [binder registerBinder:[MBButtonBinder          binderWithIdentifier:@"Coolness"]];
    [binder bind];
}

@end
