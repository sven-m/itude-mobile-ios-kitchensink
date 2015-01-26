//
//  SimplestPlantCatalogViewBindingController.m
//  kitchensink-app
//
//  Created by Emiel Bon on 26-01-15.
//  Copyright (c) 2015 Itude Mobile. All rights reserved.
//

#import "SimplestPlantCatalogViewBindingController.h"

@implementation SimplestPlantCatalogViewBindingController

- (void)rebuildView
{
    // Prevent default View Builder behavior
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    MBPageBinder *binder = [MBPageBinder binderWithViewController:self];
    
    // To create a simple binder that binds the title and subtitle of every cell in a UITableView
    // to the value of the CommonName and BotanicalName elements from the CATALOG document
    [binder registerBinder:[MBStandardStyleTableViewBinder binderWithIdentifier:@"PlantList"
                                                                          style:UITableViewCellStyleSubtitle
                                                                    bindTitleTo:@"CommonName"
                                                                   bindDetailTo:@"BotanicalName"]];
    [binder registerBinder:[MBSimpleTextBinder binderWithIdentifier:@"CommonName"]];
    [binder registerBinder:[MBSimpleTextBinder binderWithIdentifier:@"BotanicalName"]];
    
    // To create an even simpler binder that binds only the title of every cell in a UITableView
    // (default style) to the value of the CommonName element from the CATALOG document,
    // replace the above 3 statements with the 2 below:
    
    //[binder registerBinder:[MBDefaultStyleTableViewBinder binderWithIdentifier:@"PlantList" bindTitleTo:@"CommonName"]];
    //[binder registerBinder:[MBSimpleTextBinder binderWithIdentifier:@"CommonName"]];
    
    // The MBDefaultStyleTableViewBinder is a shorter equivalent for:
    //[binder registerBinder:[MBStandardStyleTableViewBinder binderWithIdentifier:@"PlantList"
    //                                                                      style:UITableViewCellStyleDefault
    //                                                                bindTitleTo:@"CommonName"
    //                                                               bindDetailTo:nil]];
    
    [binder registerBinder:[MBSimpleTextBinder binderWithIdentifier:@"CommonName"]];
    [binder bind];
}

@end
