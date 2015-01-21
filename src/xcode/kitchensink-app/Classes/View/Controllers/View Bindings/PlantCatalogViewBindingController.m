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
#import "SpecialPlantBinder.h"
#import "MBStandardStyleTableViewBinder.h"
#import "MBDefaultStyleTableViewBinder.h"

@implementation PlantCatalogViewBindingController

/*- (void)rebuildView
{
    MBPageBinder *binder = [MBPageBinder binderWithViewController:self];
    UINib *plantCellNib = [UINib nibWithNibName:@"SpecialPlantCatalogTableViewCell" bundle:nil];
    [binder registerBinder:[MBSimpleTableViewBinder binderWithIdentifier:@"PlantList" cellNib:plantCellNib]];
    [binder registerBinder:[SpecialPlantBinder      binderWithIdentifier:@"Plant"]];
    [binder registerBinder:[MBSimpleTextBinder      binderWithIdentifier:@"Light"]];
    [binder registerBinder:[MBSimpleTextBinder      binderWithIdentifier:@"CommonName"]];
    [binder registerBinder:[MBSimpleTextBinder      binderWithIdentifier:@"BotanicalName"]];
    [binder registerBinder:[MBButtonBinder          binderWithIdentifier:@"Coolness"]];
    [binder bind];
}*/

/*- (void)rebuildView
{
    MBPageBinder *binder = [MBPageBinder binderWithViewController:self];
    [binder registerBinder:[MBStandardStyleTableViewBinder binderWithIdentifier:@"PlantList"
                                                                          style:UITableViewCellStyleSubtitle
                                                                    bindTitleTo:@"CommonName"
                                                                   bindDetailTo:@"BotanicalName"]];
    [binder registerBinder:[MBSimpleTextBinder binderWithIdentifier:@"CommonName"]];
    [binder registerBinder:[MBSimpleTextBinder binderWithIdentifier:@"BotanicalName"]];
    [binder bind];
}*/

- (void)rebuildView
{
    MBPageBinder *binder = [MBPageBinder binderWithViewController:self];
    [binder registerBinder:[MBDefaultStyleTableViewBinder binderWithIdentifier:@"PlantList" bindTitleTo:@"CommonName"]];
    [binder registerBinder:[MBSimpleTextBinder binderWithIdentifier:@"CommonName"]];
    [binder bind];
}

@end
