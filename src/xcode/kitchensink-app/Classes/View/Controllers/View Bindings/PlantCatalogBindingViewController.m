//
//  PlantCatalogBindingViewController.m
//  kitchensink-app
//
//  Created by Emiel Bon on 15-01-15.
//  Copyright (c) 2015 Itude Mobile. All rights reserved.
//

#import "PlantCatalogBindingViewController.h"
#import "MBPageBinder.h"
#import "MBTableViewBinder.h"
#import "MBSimpleTextBinder.h"

@interface PlantCatalogBindingViewController ()

@end

@implementation PlantCatalogBindingViewController

- (void)rebuildView
{
    MBPageBinder *binder = [MBPageBinder binderWithViewController:self];
    UINib *plantCellNib = [UINib nibWithNibName:@"PlantCatalogTableViewCell" bundle:nil];
    [binder registerBinder:[MBTableViewBinder binderWithIdentifier:@"PlantList" cellNib:plantCellNib]];
    [binder registerBinder:[MBSimpleTextBinder      binderWithIdentifier:@"Light"]];
    [binder registerBinder:[MBSimpleTextBinder      binderWithIdentifier:@"CommonName"]];
    [binder registerBinder:[MBSimpleTextBinder      binderWithIdentifier:@"BotanicalName"]];
    [binder bind];
}

@end
