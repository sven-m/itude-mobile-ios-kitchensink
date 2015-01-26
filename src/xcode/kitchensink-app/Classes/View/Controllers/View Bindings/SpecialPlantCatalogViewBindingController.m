//
//  PlantCatalogBindingViewController.m
//  kitchensink-app
//
//  Created by Emiel Bon on 15-01-15.
//  Copyright (c) 2015 Itude Mobile. All rights reserved.
//

#import "SpecialPlantCatalogViewBindingController.h"
#import "SpecialPlantBinder.h"

@implementation SpecialPlantCatalogViewBindingController

- (void)rebuildView
{
    // Prevent default View Builder behavior
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];

    // The following code creates a binder that binds the Plant element to a special UITableViewCell.
    // The cell (SpecialPlantCatalogTableViewCell) is special because it is loaded from a xib AND has
    // its own custom API. It has text labels, but they are private and you don't set their text directly.
    // You set only the public properties of the cell and it will determine how it is placed in the text
    // labels (e.g. with special formatting, like for the Coolness element).
    
    MBPageBinder *binder = [MBPageBinder binderWithViewController:self];
    UINib *plantCellNib = [UINib nibWithNibName:@"SpecialPlantCatalogTableViewCell" bundle:nil];
    [binder registerBinder:[MBSimpleTableViewBinder binderWithIdentifier:@"PlantList" cellNib:plantCellNib]];
    [binder registerBinder:[SpecialPlantBinder      binderWithIdentifier:@"Plant"]];
    [binder bind];
}

@end
