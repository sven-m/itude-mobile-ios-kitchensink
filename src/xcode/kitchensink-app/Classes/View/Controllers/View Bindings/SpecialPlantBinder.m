//
//  SpecialPlantBinder.m
//  kitchensink-app
//
//  Created by Emiel Bon on 20-01-15.
//  Copyright (c) 2015 Itude Mobile. All rights reserved.
//

#import "SpecialPlantBinder.h"
#import "SpecialPlantCatalogTableViewCell.h"

@implementation SpecialPlantBinder

+ (instancetype)binderWithIdentifier:(NSString *)identifier
{
    return [[[SpecialPlantBinder alloc] initWithBindingIdentifier:identifier] autorelease];
}

- (void)populateView:(UIView *)view withDataFromComponent:(MBComponent *)component
{
    assert([component isKindOfClass:[MBPanel class]]);
    assert([view      isKindOfClass:[SpecialPlantCatalogTableViewCell class]]);
    
    MBPanel *panel = (MBPanel *)component;
    SpecialPlantCatalogTableViewCell *cell = (SpecialPlantCatalogTableViewCell *)view;
    
    cell.commonName    = ((MBField *)[panel childWithName:@"CommonName"]).value;
    cell.botanicalName = ((MBField *)[panel childWithName:@"BotanicalName"]).value;
    cell.coolPlant     = ((MBField *)[panel childWithName:@"Coolness"]).untranslatedValue.boolValue;
}

@end
