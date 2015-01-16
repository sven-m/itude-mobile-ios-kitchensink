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
    [binder registerBinder:[[[MBTableViewBinder alloc] initWithBindingIdentifier:@"PlantList" cellNib:plantCellNib] autorelease]];
    [binder registerBinder:[[[MBTextBinder alloc]      initWithBindingIdentifier:@"Light"] autorelease]];
    [binder registerBinder:[[[MBTextBinder alloc]      initWithBindingIdentifier:@"CommonName"] autorelease]];
    [binder registerBinder:[[[MBTextBinder alloc]      initWithBindingIdentifier:@"BotanicalName"] autorelease]];
    [binder bind];
}

@end
