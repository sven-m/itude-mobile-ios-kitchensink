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
#import "MBTextBinder.h"

@interface PlantCatalogBindingViewController ()

@end

@implementation PlantCatalogBindingViewController

- (void)rebuildView
{
    MBPageBinder *binder = [[MBPageBinder alloc] initWithViewController:self];
    UINib *plantCellNib = [UINib nibWithNibName:@"PlantCatalogTableViewCell" bundle:nil];
    [binder registerBinder:[[[MBTableViewBinder alloc] initWithTargetTag:1 cellNib:plantCellNib] autorelease] forComponentWithName:@"PlantList"];
    [binder registerBinder:[[[MBTextBinder alloc]      initWithTargetTag:2] autorelease] forComponentWithName:@"Light"];
    [binder registerBinder:[[[MBTextBinder alloc]      initWithTargetTag:3] autorelease] forComponentWithName:@"CommonName"];
    [binder registerBinder:[[[MBTextBinder alloc]      initWithTargetTag:4] autorelease] forComponentWithName:@"BotanicalName"];
    [binder bind];
}

@end
